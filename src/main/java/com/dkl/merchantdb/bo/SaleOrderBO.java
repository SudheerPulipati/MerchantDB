package com.dkl.merchantdb.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dkl.merchantdb.dao.impl.PartyDAO;
import com.dkl.merchantdb.dao.intf.ILedgerAccountDAO;
import com.dkl.merchantdb.dao.intf.IsequenceGenDAO;
import com.dkl.merchantdb.dao.intf.ItemLedgerDAO;
import com.dkl.merchantdb.dao.intf.ItemStockRegisterDAO;
import com.dkl.merchantdb.dao.intf.ItemTransactionDAO;
import com.dkl.merchantdb.dao.intf.LedgerDAO;
import com.dkl.merchantdb.dao.intf.SaleOrderDAO;
import com.dkl.merchantdb.dao.intf.TransactionDAO;
import com.dkl.merchantdb.to.ItemLedgerTO;
import com.dkl.merchantdb.to.ItemStockRegisterTO;
import com.dkl.merchantdb.to.ItemTransactionTO;
import com.dkl.merchantdb.to.LedgerAccountTO;
import com.dkl.merchantdb.to.LedgerTO;
import com.dkl.merchantdb.to.PartyTO;
import com.dkl.merchantdb.to.SaleOrderRequestTO;
import com.dkl.merchantdb.to.TransactionTO;

@Service
public class SaleOrderBO {
	
	@Autowired
	private SaleOrderDAO saleOrderDAO; 
	
	@Autowired
	private ItemTransactionDAO itemTransactionDAO;
	
	@Autowired
	private ItemLedgerDAO itemLedgerDAO;
	
	@Autowired
	private LedgerDAO ledgerDAO;
	
	@Autowired
	private PartyDAO partyDAO;
	
	@Autowired
	private ILedgerAccountDAO ledgerAccountDAO;
	
	@Autowired
	private ItemStockRegisterDAO itemStockRegisterDAO;
	
	@Autowired
	private IsequenceGenDAO sequenceGenDAO;
	
	@Autowired
	private TransactionDAO transactionDAO;
	
	public SaleOrderRequestTO prepareDataForPurchaseOrder(Long companyId){
		return saleOrderDAO.prepareRequestDataForSalesOrder(companyId);
	}

	public List<ItemStockRegisterTO> getAllItemBatch(String itemId,String stockPointId) {
		return itemStockRegisterDAO.getAllItemBatch(itemId,stockPointId);
	}
	
	
	@Transactional(rollbackFor=DataAccessException.class)
	public void storeSaleOrder(TransactionTO transactionInputTO) throws Exception{
		Long transactionID = saleOrderDAO.getNextHighestTransactionSeqNo(transactionInputTO.getTransactionType(), transactionInputTO.getBookID());
		transactionInputTO.setTransactionID(transactionID);
		ItemTransactionTO[] itemTransactionTOs = transactionInputTO.getItemTransactionTOs();
		String cashSaleInd = "N";

		String partyLedgerID = transactionInputTO.getLedgerID(); 
		String partyLedgerName = transactionInputTO.getLedgerName();
		
		
		PartyTO partyTO = partyDAO.readParty("CASH ON HAND", itemTransactionTOs[0].getCompanyId());
		
		
		if(partyLedgerID==null){
			if(transactionInputTO.getTotalPaid() < transactionInputTO.getTotalAmount()){
				//need to change
				throw new Exception("Credit is Not Allowed on Cash Transaction");
			}else{
				cashSaleInd = "Y";
				partyLedgerID 	= partyTO.getPartyID();
				partyLedgerName = partyTO.getPartyName();		
			}
		}
		
		
		Long currentTxnRowSqNo = 0L;
		Long currentTxnRowSqNo_TxnTable = 0L;
		
		for (ItemTransactionTO itemTransactionTO2 : itemTransactionTOs){
			
			currentTxnRowSqNo_TxnTable = currentTxnRowSqNo_TxnTable+1;
			currentTxnRowSqNo = currentTxnRowSqNo+1;
			
			itemTransactionDAO.createNewItemTransactionRecord(setItemTransactionDetails(itemTransactionTO2,transactionInputTO,currentTxnRowSqNo_TxnTable),"SALE");
			
			itemStockRegisterDAO.updateItemStockRegisterRecordSale(setItemStockRegisterDetails(itemTransactionTO2,transactionInputTO));
			ItemLedgerTO  itemLedgerTO = itemLedgerDAO.getLedgerDetails(itemTransactionTO2.getCompanyId(),itemTransactionTO2.getItemID().toString(),transactionInputTO.getTransactionType());
			
			LedgerTO ledgerItemObj  = setLedgerItemDetails(itemLedgerTO,transactionInputTO,itemTransactionTO2,currentTxnRowSqNo);
			currentTxnRowSqNo = currentTxnRowSqNo+1;
			LedgerTO ledgerPartyObj = setLedgerPartyDetails(itemLedgerTO,transactionInputTO,itemTransactionTO2,currentTxnRowSqNo);
			
			
			createLedgerItemAndLedgerPartyRecords(ledgerItemObj,ledgerPartyObj);
			
			LedgerAccountTO itemLedgerAccountObj = getLedgerAccountRecord(ledgerItemObj.getLedgerID(), itemTransactionTO2.getFirmID(), itemTransactionTO2.getBookID());
			LedgerAccountTO ledgerAccountPartyObj = getLedgerAccountRecord(ledgerPartyObj.getLedgerID(), itemTransactionTO2.getFirmID(), itemTransactionTO2.getBookID());
		
			itemLedgerAccountObj.setCredit(itemTransactionTO2.getAmount1());
			ledgerAccountSetCloseBalance(itemLedgerAccountObj,itemTransactionTO2.getAmount1());
			
			ledgerAccountPartyObj.setDebit(itemTransactionTO2.getAmount1());
			ledgerAccountSetCloseBalance(ledgerAccountPartyObj,-itemTransactionTO2.getAmount1());
			
			updateLedgerAccountItemAndPartyRecords(ledgerAccountPartyObj,itemLedgerAccountObj);
 
			
			if(cashSaleInd.equals("N") && transactionInputTO.getTotalPaid()>0.0){
				
				currentTxnRowSqNo =currentTxnRowSqNo+1;
				LedgerTO ledgerCashObj = new LedgerTO();
				LedgerTO ledgerParty = new LedgerTO();
				
				ledgerCashObj.setBookID(itemTransactionTO2.getBookID());
				ledgerCashObj.setTransactionID("CASH"+transactionInputTO.getTransactionID());
				ledgerCashObj.setTransactionType("CASH");
				ledgerCashObj.setTransactionDate(transactionInputTO.getTransactionDate());				
				ledgerCashObj.setLedgerID(partyTO.getPartyID());
				ledgerCashObj.setLedgerName(partyTO.getPartyName());				
				ledgerCashObj.setFirmID(itemTransactionTO2.getFirmID());
				ledgerCashObj.setFirmName(itemTransactionTO2.getFirmName());				
				ledgerCashObj.setLedgerSeqNo(currentTxnRowSqNo);
								
				currentTxnRowSqNo =currentTxnRowSqNo+1;
				ledgerParty.setBookID(itemTransactionTO2.getBookID());
				ledgerParty.setTransactionID("CASH"+transactionInputTO.getTransactionID());
				ledgerParty.setTransactionType("CASH");
				ledgerParty.setTransactionDate(transactionInputTO.getTransactionDate());				
				ledgerParty.setLedgerID(partyLedgerID);
				ledgerParty.setLedgerName(partyLedgerName);				
				ledgerParty.setFirmID(itemTransactionTO2.getFirmID());
				ledgerParty.setFirmName(itemTransactionTO2.getFirmName());				
				ledgerParty.setLedgerSeqNo(currentTxnRowSqNo);

				LedgerAccountTO ledgerAccountCash  = getLedgerAccountRecord(ledgerCashObj.getLedgerID(), itemTransactionTO2.getFirmID(), itemTransactionTO2.getBookID());
				LedgerAccountTO ledgerAccountParty = getLedgerAccountRecord(ledgerParty.getLedgerID(), itemTransactionTO2.getFirmID(), itemTransactionTO2.getBookID());
				
				ledgerCashObj.setCr_Dr("Dr");
				ledgerCashObj.setAmount(transactionInputTO.getTotalPaid());
				
				ledgerParty.setCr_Dr("Cr");
				ledgerParty.setAmount(transactionInputTO.getTotalPaid());
				
				ledgerAccountCash.setDebit(transactionInputTO.getTotalPaid());
				ledgerAccountCash.setCloseBalance(ledgerAccountCash.getCloseBalance() + transactionInputTO.getTotalPaid());
				
				ledgerAccountParty.setCredit(transactionInputTO.getTotalPaid());
				ledgerAccountParty.setCloseBalance(ledgerAccountParty.getCloseBalance() - transactionInputTO.getTotalPaid());
		
				createLedgerItemAndLedgerPartyRecords(ledgerCashObj,ledgerParty);
				updateLedgerAccountItemAndPartyRecords(ledgerAccountParty,ledgerAccountCash);

			}
			
		}	
		TransactionTO transactionTO = new TransactionTO();
		transactionTO.setBookID(transactionInputTO.getBookID());
		transactionTO.setTransactionID(transactionInputTO.getTransactionID());
		transactionTO.setTransactionType(transactionInputTO.getTransactionType());
		transactionTO.setTransactionDate(transactionInputTO.getTransactionDate());
		transactionTO.setPaymentMode(transactionInputTO.getPaymentMode());
		transactionTO.setLedgerID(transactionInputTO.getLedgerID());
		transactionTO.setLedgerName(transactionInputTO.getLedgerName());
		transactionTO.setTotalAmount(transactionInputTO.getTotalAmount());
		transactionTO.setSlipNo(transactionInputTO.getSlipNo());
		
		transactionDAO.createNewTransactionRecord("SALE",transactionTO);
		
	}
	
	private void updateLedgerAccountItemAndPartyRecords(LedgerAccountTO ledgerAccountPartyObj1,LedgerAccountTO ledgerAccountItemObj1){
		ledgerAccountDAO.updateLedgerAccountItemAndPartyRecords(ledgerAccountPartyObj1,ledgerAccountItemObj1);
	}
	
	private LedgerAccountTO ledgerAccountSetCloseBalance(LedgerAccountTO ledgerAccountObj,double amountToBeAdjusted){
		 ledgerAccountObj.setCloseBalance(ledgerAccountObj.getCloseBalance() - amountToBeAdjusted);
		 return ledgerAccountObj;
	}
	
	private LedgerAccountTO  getLedgerAccountRecord(String ledgerID,String firmID,String finBookID){
		return ledgerAccountDAO.getLedgerAccountRecord(ledgerID, firmID, finBookID);
	}
	
	private LedgerTO setLedgerItemDetails(ItemLedgerTO itemLedgerTO,TransactionTO transactionInputTO,ItemTransactionTO itemTransactionTO2,Long currentSqNo){
		LedgerTO ledgerItemObj = new LedgerTO();
		ledgerItemObj.setBookID(transactionInputTO.getBookID());
		ledgerItemObj.setTransactionID("SALE"+transactionInputTO.getTransactionID());
		ledgerItemObj.setTransactionType(transactionInputTO.getTransactionType());
		
		ledgerItemObj.setTransactionDate(transactionInputTO.getTransactionDate());
		ledgerItemObj.setLedgerID(itemLedgerTO.getItemLedgerID());
		ledgerItemObj.setLedgerName(itemLedgerTO.getItemLedgerName());
		ledgerItemObj.setFirmID(itemTransactionTO2.getFirmID());
		ledgerItemObj.setFirmName(itemTransactionTO2.getFirmName());
		ledgerItemObj.setLedgerSeqNo(currentSqNo);
		
		ledgerItemObj.setCr_Dr("Cr");
		ledgerItemObj.setAmount(itemTransactionTO2.getAmount1());
		
		return ledgerItemObj;
	}
	
	private LedgerTO setLedgerPartyDetails(ItemLedgerTO itemLedgerTO,TransactionTO transactionInputTO,ItemTransactionTO itemTransactionTO2,Long currentSqNo){
		LedgerTO ledgerPartyObj = new LedgerTO();
		ledgerPartyObj.setBookID(transactionInputTO.getBookID());
		ledgerPartyObj.setTransactionID("SALE"+transactionInputTO.getTransactionID());
		ledgerPartyObj.setTransactionType(transactionInputTO.getTransactionType());
		ledgerPartyObj.setTransactionDate(transactionInputTO.getTransactionDate());
		ledgerPartyObj.setLedgerID(transactionInputTO.getLedgerID().toString());
		ledgerPartyObj.setLedgerName(transactionInputTO.getLedgerName());
		ledgerPartyObj.setFirmID(itemTransactionTO2.getFirmID());
		ledgerPartyObj.setFirmName(itemTransactionTO2.getFirmName());
		ledgerPartyObj.setLedgerSeqNo(currentSqNo);
		ledgerPartyObj.setCr_Dr("Dr");
		ledgerPartyObj.setAmount(itemTransactionTO2.getAmount1());
		return ledgerPartyObj;
	}
	
	private void createLedgerItemAndLedgerPartyRecords(LedgerTO ledgerItemObj,LedgerTO ledgerPartyObj){
		ledgerDAO.createLedgerItemAndLedgerPartyRecords(ledgerItemObj,ledgerPartyObj);
	}
	
	private ItemStockRegisterTO setItemStockRegisterDetails(ItemTransactionTO itemTransactionTO2,TransactionTO transactionInputTO){
		ItemStockRegisterTO itemStockRegisterTO = new ItemStockRegisterTO();
		itemStockRegisterTO.setBookID(transactionInputTO.getBookID());
		
		itemStockRegisterTO.setStockPointID(itemTransactionTO2.getStockPointId());
		itemStockRegisterTO.setStockPointName(itemTransactionTO2.getStockPointName());
		
		itemStockRegisterTO.setItemID(itemTransactionTO2.getItemID().toString());
		itemStockRegisterTO.setItemName(itemTransactionTO2.getItemName());
		itemStockRegisterTO.setItemBatchName(itemTransactionTO2.getItemBatchName());
		
		ItemStockRegisterTO retrievedItemStockRegister = itemStockRegisterDAO.getItemStockRegisterRecord(itemTransactionTO2.getItemID().toString(),itemTransactionTO2.getItemName(),itemTransactionTO2.getStockPointId(),transactionInputTO.getBookID());
			
		itemStockRegisterTO.setItemBatchID(itemTransactionTO2.getItemBatchID().toString());
		itemStockRegisterTO.setSaleQuantity(itemTransactionTO2.getQuantity());
		itemStockRegisterTO.setStockOnHand(retrievedItemStockRegister.getStockOnHand() - itemTransactionTO2.getQuantity());
		return itemStockRegisterTO;
	}
	
	
	private ItemTransactionTO setItemTransactionDetails(ItemTransactionTO itemTransactionTO2,TransactionTO transactionInputTO, Long currentSqNo){
		ItemTransactionTO itemTransactionTO = new ItemTransactionTO();
		itemTransactionTO.setBookID(transactionInputTO.getBookID());
		itemTransactionTO.setTransactionID("SALE"+transactionInputTO.getTransactionID());
		itemTransactionTO.setTransactionSeqNr(currentSqNo);
		itemTransactionTO.setItemID(itemTransactionTO2.getItemID());
		itemTransactionTO.setItemName(itemTransactionTO2.getItemName());
		itemTransactionTO.setItemBatchID(itemTransactionTO2.getItemBatchID());
		itemTransactionTO.setItemBatchName(itemTransactionTO2.getItemBatchName());
		itemTransactionTO.setQuantity(itemTransactionTO2.getQuantity());
		itemTransactionTO.setWeight(itemTransactionTO2.getWeight());
		itemTransactionTO.setWeightDifference(itemTransactionTO2.getWeightDifference());
		itemTransactionTO.setPricePer(itemTransactionTO2.getPricePer());
		itemTransactionTO.setPrice1(itemTransactionTO2.getPrice1());
		itemTransactionTO.setPrice2(itemTransactionTO2.getPrice2());
		itemTransactionTO.setAmount1(itemTransactionTO2.getAmount1());
		itemTransactionTO.setAmount2(itemTransactionTO2.getAmount2());
		itemTransactionTO.setTotalAmount(itemTransactionTO2.getTotalAmount());
		itemTransactionTO.setFirmID(itemTransactionTO2.getFirmID());
		itemTransactionTO.setFirmName(itemTransactionTO2.getFirmName());
		return itemTransactionTO;
	}

}
