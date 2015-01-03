package com.dkl.merchantdb.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dkl.merchantdb.dao.intf.ItemLedgerDAO;
import com.dkl.merchantdb.dao.intf.ItemStockRegisterDAO;
import com.dkl.merchantdb.dao.intf.ItemTransactionDAO;
import com.dkl.merchantdb.dao.intf.LedgerAccountDAO;
import com.dkl.merchantdb.dao.intf.LedgerDAO;
import com.dkl.merchantdb.dao.intf.PurchaseOrderDAO;
import com.dkl.merchantdb.dao.intf.IsequenceGenDAO;
import com.dkl.merchantdb.dao.intf.TransactionDAO;
import com.dkl.merchantdb.to.ItemLedgerTO;
import com.dkl.merchantdb.to.ItemStockRegisterTO;
import com.dkl.merchantdb.to.ItemTransactionTO;
import com.dkl.merchantdb.to.LedgerAccountTO;
import com.dkl.merchantdb.to.LedgerTO;
import com.dkl.merchantdb.to.PurchaseOrderRequestTO;
import com.dkl.merchantdb.to.TransactionTO;

@Service
public class PurchaseOrderBO {

	@Autowired
	private PurchaseOrderDAO purchaseOrderDAO;
	
	@Autowired
	private ItemStockRegisterDAO itemStockRegisterDAO;
	
	@Autowired
	private ItemTransactionDAO itemTransactionDAO;
	
	@Autowired
	private ItemLedgerDAO itemLedgerDAO;
	
	@Autowired
	private LedgerDAO ledgerDAO;
	
	@Autowired
	private LedgerAccountDAO ledgerAccountDAO;
	
	@Autowired
	private IsequenceGenDAO sequenceGenDAO;
	
	@Autowired
	private TransactionDAO transactionDAO;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	

	public PurchaseOrderRequestTO prepareDataForPurchaseOrder(Long companyId){
		return purchaseOrderDAO.prepareDataForPurchaseOrder(companyId);
	}
	
	public List<ItemStockRegisterTO> getAllItemBatch(String itemId,String stockPointId) {
		return itemStockRegisterDAO.getAllItemBatch(itemId,stockPointId);
	}
	
	

	@Transactional(rollbackFor=DataAccessException.class)
	public void storePurchaseOrder(TransactionTO transactionInputTO) throws Exception{
		
		Long transactionID = purchaseOrderDAO.getNextHighestTransactionSeqNo(transactionInputTO.getTransactionType(), transactionInputTO.getBookID());
		
		transactionInputTO.setTransactionID(transactionID);
		System.out.println(".....transactionID from getNextHighestTransactionSeqNo is............"+transactionID);
		
		ItemTransactionTO[] itemTransactionTOs = transactionInputTO.getItemTransactionTOs();
		Long currentTxnRowSqNo = 0L;
		for (ItemTransactionTO itemTransactionTO2 : itemTransactionTOs) {
			
			currentTxnRowSqNo =currentTxnRowSqNo+1;
			
			System.out.println(".....start of ItemTransactionTO loop............");
			itemTransactionDAO.createNewItemTransactionRecord(setItemTransactionDetails(itemTransactionTO2,transactionInputTO,currentTxnRowSqNo));
			
			
			System.out.println(".....End of createNewItemTransactionRecord............");
			itemStockRegisterDAO.createOrUpdateItemStockRegisterRecord(setItemStockRegisterDetails(itemTransactionTO2,transactionInputTO),itemTransactionTO2.getNewItemBatchInd());
				
			
			System.out.println(".....End of createOrUpdateItemStockRegisterRecord............");		
			ItemLedgerTO  itemLedgerTO = itemLedgerDAO.getLedgerDetails(itemTransactionTO2.getCompanyId(),itemTransactionTO2.getItemID().toString(),transactionInputTO.getTransactionType());
			System.out.println(".....End of getLedgerDetails............");	
			
			LedgerTO ledgerItemObj  = setLedgerItemDetails(itemLedgerTO,transactionInputTO,itemTransactionTO2,currentTxnRowSqNo);
			LedgerTO ledgerPartyObj = setLedgerPartyDetails(itemLedgerTO,transactionInputTO,itemTransactionTO2,currentTxnRowSqNo);
			createLedgerItemAndLedgerPartyRecords(ledgerItemObj,ledgerPartyObj);
						
			System.out.println(".....End of LedgerItem and LedgerParty data insertion............");	
			LedgerAccountTO ledgerAccountPartyObj = getLedgerAccountRecord(ledgerPartyObj.getLedgerID(), itemTransactionTO2.getFirmID(), itemTransactionTO2.getBookID());
			LedgerAccountTO ledgerAccountItemObj  = getLedgerAccountRecord(ledgerItemObj.getLedgerID(), itemTransactionTO2.getFirmID(), itemTransactionTO2.getBookID());
			System.out.println(".....End of LedgerAccountTO Retrieval............");
			
			System.out.println("======ledgerAccountPartyObj===closeBalance=="+ledgerAccountPartyObj.getCloseBalance()+"======Amount1====="+ itemTransactionTO2.getAmount1());
			ledgerAccountPartyObj.setCredit(itemTransactionTO2.getAmount1());
			ledgerAccountSetCloseBalance(ledgerAccountPartyObj,itemTransactionTO2.getAmount1());
 
			System.out.println("======ledgerAccountItemObj===closeBalance=="+ledgerAccountPartyObj.getCloseBalance()+"======Amount1====="+ itemTransactionTO2.getAmount1());
			ledgerAccountItemObj.setDebit(itemTransactionTO2.getAmount1());
			ledgerAccountSetCloseBalance(ledgerAccountItemObj,-itemTransactionTO2.getAmount1());		
			
			System.out.println(".....End of LedgerAccount Update............");
			updateLedgerAccountItemAndPartyRecords(ledgerAccountPartyObj,ledgerAccountItemObj);
			
			if(itemTransactionTO2.getPrice2()!=0){
							
				overrideLedgerDetailsForAnavathRecordCreation(itemTransactionTO2,ledgerItemObj,ledgerPartyObj,currentTxnRowSqNo);
				
				createLedgerItemAndLedgerPartyRecords(ledgerItemObj,ledgerPartyObj);
							
				System.out.println(".....End of LedgerItem and LedgerParty data insertion............");	
				LedgerAccountTO ledgerAccountPartyObj1 = getLedgerAccountRecord(ledgerPartyObj.getLedgerID(), itemTransactionTO2.getAnavathFirmId(), itemTransactionTO2.getBookID());
				LedgerAccountTO ledgerAccountItemObj2  = getLedgerAccountRecord(ledgerItemObj.getLedgerID(), itemTransactionTO2.getAnavathFirmId(), itemTransactionTO2.getBookID());
				System.out.println(".....End of LedgerAccountTO Retrieval............");
				
				System.out.println("======ledgerAccountPartyObj1===closeBalance=="+ledgerAccountPartyObj1.getCloseBalance()+"======Amount2====="+ itemTransactionTO2.getAmount2());
				ledgerAccountPartyObj1.setCredit(itemTransactionTO2.getAmount2());
				ledgerAccountSetCloseBalance(ledgerAccountPartyObj1,itemTransactionTO2.getAmount2());
				
				System.out.println("======ledgerAccountItemObj2===closeBalance=="+ledgerAccountItemObj2.getCloseBalance()+"======Amount2====="+ itemTransactionTO2.getAmount2());
				ledgerAccountItemObj2.setDebit(itemTransactionTO2.getAmount2());		
				ledgerAccountSetCloseBalance(ledgerAccountItemObj2,-itemTransactionTO2.getAmount2());
				
				System.out.println(".....End of LedgerAccount Update............");
				updateLedgerAccountItemAndPartyRecords(ledgerAccountPartyObj1,ledgerAccountItemObj2);
				
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
		transactionTO.setWayBillNo(transactionInputTO.getWayBillNo());
		transactionTO.setVehicleNo(transactionInputTO.getVehicleNo());
		
		transactionDAO.createNewTransactionRecord("PUR",transactionTO);
		System.out.println(".....End of Transaction............");
	}
	
	private void overrideLedgerDetailsForAnavathRecordCreation(ItemTransactionTO itemTransactionTO2,LedgerTO ledgerItemObj, LedgerTO ledgerPartyObj,Long currentSqNo) {
		ledgerItemObj.setFirmID(itemTransactionTO2.getAnavathFirmId());
		ledgerItemObj.setFirmName(itemTransactionTO2.getAnavathFirmName());
		ledgerItemObj.setLedgerSeqNo(currentSqNo);
		ledgerItemObj.setAmount(itemTransactionTO2.getAmount2());
		
		ledgerPartyObj.setFirmID(itemTransactionTO2.getAnavathFirmId());
		ledgerPartyObj.setFirmName(itemTransactionTO2.getAnavathFirmName());
		ledgerPartyObj.setLedgerSeqNo(currentSqNo);
		ledgerPartyObj.setAmount(itemTransactionTO2.getAmount2());
	}

	private LedgerAccountTO  getLedgerAccountRecord(String ledgerID,String firmID,String finBookID){
		return ledgerAccountDAO.getLedgerAccountRecord(ledgerID, firmID, finBookID);
	}
	
	
	private void updateLedgerAccountItemAndPartyRecords(LedgerAccountTO ledgerAccountPartyObj1,LedgerAccountTO ledgerAccountItemObj1){
		ledgerAccountDAO.updateLedgerAccountItemAndPartyRecords(ledgerAccountPartyObj1,ledgerAccountItemObj1);
	}
	
	private void createLedgerItemAndLedgerPartyRecords(LedgerTO ledgerItemObj,LedgerTO ledgerPartyObj){
		ledgerDAO.createLedgerItemAndLedgerPartyRecords(ledgerItemObj,ledgerPartyObj);
	}
	
	
	private LedgerAccountTO ledgerAccountSetCloseBalance(LedgerAccountTO ledgerAccountObj,double amountToBeAdjusted){
		 ledgerAccountObj.setCloseBalance(ledgerAccountObj.getCloseBalance() + amountToBeAdjusted);
		 return ledgerAccountObj;
	}
	
	
	private LedgerTO setLedgerItemDetails(ItemLedgerTO itemLedgerTO,TransactionTO transactionInputTO,ItemTransactionTO itemTransactionTO2,Long currentSqNo){
		LedgerTO ledgerItemObj = new LedgerTO();
		ledgerItemObj.setBookID(transactionInputTO.getBookID());
		ledgerItemObj.setTransactionID("PUR"+transactionInputTO.getTransactionID());
		ledgerItemObj.setTransactionType(transactionInputTO.getTransactionType());
		
		ledgerItemObj.setTransactionDate(transactionInputTO.getTransactionDate());
		ledgerItemObj.setLedgerID(itemLedgerTO.getItemLedgerID());
		ledgerItemObj.setLedgerName(itemLedgerTO.getItemLedgerName());
		ledgerItemObj.setFirmID(itemTransactionTO2.getFirmID());
		ledgerItemObj.setFirmName(itemTransactionTO2.getFirmName());
		ledgerItemObj.setLedgerSeqNo(currentSqNo);
		
		ledgerItemObj.setCr_Dr("Dr");
		ledgerItemObj.setAmount(itemTransactionTO2.getAmount1());
		
		return ledgerItemObj;
	}
	
	private LedgerTO setLedgerPartyDetails(ItemLedgerTO itemLedgerTO,TransactionTO transactionInputTO,ItemTransactionTO itemTransactionTO2,Long currentSqNo){
		LedgerTO ledgerPartyObj = new LedgerTO();
		ledgerPartyObj.setBookID(transactionInputTO.getBookID());
		ledgerPartyObj.setTransactionID("PUR"+transactionInputTO.getTransactionID());
		ledgerPartyObj.setTransactionType(transactionInputTO.getTransactionType());
		ledgerPartyObj.setTransactionDate(transactionInputTO.getTransactionDate());
		ledgerPartyObj.setLedgerID(transactionInputTO.getLedgerID().toString());
		ledgerPartyObj.setLedgerName(transactionInputTO.getLedgerName());
		ledgerPartyObj.setFirmID(itemTransactionTO2.getFirmID());
		ledgerPartyObj.setFirmName(itemTransactionTO2.getFirmName());
		ledgerPartyObj.setLedgerSeqNo(currentSqNo);
		ledgerPartyObj.setCr_Dr("Cr");
		ledgerPartyObj.setAmount(itemTransactionTO2.getAmount1());
		return ledgerPartyObj;
	}
	
	
	
	
	private ItemStockRegisterTO setItemStockRegisterDetails(ItemTransactionTO itemTransactionTO2,TransactionTO transactionInputTO){
		ItemStockRegisterTO itemStockRegisterTO = new ItemStockRegisterTO();
		itemStockRegisterTO.setBookID(transactionInputTO.getBookID());
		
		itemStockRegisterTO.setStockPointID(itemTransactionTO2.getStockPointId());
		itemStockRegisterTO.setStockPointName(itemTransactionTO2.getStockPointName());
		
		itemStockRegisterTO.setItemID(itemTransactionTO2.getItemID().toString());
		itemStockRegisterTO.setItemName(itemTransactionTO2.getItemName());
		itemStockRegisterTO.setItemBatchName(itemTransactionTO2.getItemBatchName());
		if("Y".equalsIgnoreCase(itemTransactionTO2.getNewItemBatchInd()))
		{
			itemStockRegisterTO.setItemBatchID(sequenceGenDAO.getSequenceID("ITEM_BATCH_ID", "ITEM_STOCK_REGISTER", "IT"));
			itemStockRegisterTO.setPurchaseQuantity(itemTransactionTO2.getQuantity());
			itemStockRegisterTO.setStockOnHand(itemTransactionTO2.getQuantity());
		}
		else
		{
			ItemStockRegisterTO retrievedItemStockRegister = itemStockRegisterDAO.getItemStockRegisterRecord(itemTransactionTO2.getItemID().toString(),itemTransactionTO2.getItemName(),itemTransactionTO2.getStockPointId(),transactionInputTO.getBookID());
			
			itemStockRegisterTO.setItemBatchID(itemTransactionTO2.getItemBatchID().toString());
			itemStockRegisterTO.setPurchaseQuantity(retrievedItemStockRegister.getPurchaseQuantity()+itemTransactionTO2.getQuantity());
			itemStockRegisterTO.setStockOnHand(retrievedItemStockRegister.getStockOnHand()+itemTransactionTO2.getQuantity());
		}
		return itemStockRegisterTO;
	}
	
	
	private ItemTransactionTO setItemTransactionDetails(ItemTransactionTO itemTransactionTO2,TransactionTO transactionInputTO, Long currentSqNo){
		ItemTransactionTO itemTransactionTO = new ItemTransactionTO();
		itemTransactionTO.setBookID(transactionInputTO.getBookID());
		itemTransactionTO.setTransactionID("PUR"+transactionInputTO.getTransactionID());
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

