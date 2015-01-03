package com.dkl.merchantdb.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dkl.merchantdb.dao.intf.CashTransactionDAO;
import com.dkl.merchantdb.dao.intf.FirmDAO;
import com.dkl.merchantdb.dao.intf.LedgerAccountDAO;
import com.dkl.merchantdb.dao.intf.LedgerDAO;
import com.dkl.merchantdb.dao.intf.NarrationDAO;
import com.dkl.merchantdb.dao.intf.IPartyDAO;
import com.dkl.merchantdb.dao.intf.TransactionDAO;
import com.dkl.merchantdb.to.CashReceiptTO;
import com.dkl.merchantdb.to.CashTransactionTO;
import com.dkl.merchantdb.to.FirmTO;
import com.dkl.merchantdb.to.LedgerAccountTO;
import com.dkl.merchantdb.to.LedgerTO;
import com.dkl.merchantdb.to.NarrationTO;
import com.dkl.merchantdb.to.PartyTO;
import com.dkl.merchantdb.to.TransactionTO;

@Service
public class CashTransactionBO {
	
	@Autowired
	private FirmDAO firmDAO;
	
	@Autowired
	private IPartyDAO partyDAO;
	
	@Autowired
	private NarrationDAO narrationDAO;
	
	@Autowired
	private LedgerDAO ledgerDAO;
	
	@Autowired
	private LedgerAccountDAO ledgerAccountDAO;
	
	@Autowired
	private CashTransactionDAO cashTransactionDAO;
	
	@Autowired
	private TransactionDAO transactionDAO;
	

	public CashReceiptTO prepareRequestDataForCashReceipt(){
		
		List<FirmTO> firmList = firmDAO.readAllFirms();
		
		//TODO
		List<PartyTO> partyList = partyDAO.readAllParty(1L);
		
		List<NarrationTO> narrationList = narrationDAO.readAllNarration();
		
		CashReceiptTO cashReceiptTO = new CashReceiptTO();
		cashReceiptTO.setFirmList(firmList);
		cashReceiptTO.setNarrationList(narrationList);
		cashReceiptTO.setPartyList(partyList);
		
		Long transactionID = cashTransactionDAO.getNextHighestTransactionSeqNo("CR","FY2013-14");
		cashReceiptTO.setCashReceiptNo(transactionID);
		return cashReceiptTO;
	}

	@Transactional(rollbackFor = DataAccessException.class)
	public void saveCashReceiptTxn(TransactionTO transactionInputTO) throws Exception {
		
		Long transactionID = cashTransactionDAO.getNextHighestTransactionSeqNo(transactionInputTO.getTransactionType(), transactionInputTO.getBookID());
		
		transactionInputTO.setTransactionID(transactionID);
		System.out.println(".....transactionID from getNextHighestTransactionSeqNo is............"+transactionID);
		CashTransactionTO[] cashTransactionTOs = transactionInputTO.getCashTransactionTOs();
		Long currentTxnRowSqNo = 0L;
		double totalAmountOfCashTxns =0;
		
		for (CashTransactionTO cashTransactionTO : cashTransactionTOs){
			
			currentTxnRowSqNo = currentTxnRowSqNo+1;
			totalAmountOfCashTxns = totalAmountOfCashTxns + cashTransactionTO.getAmount();
			
			CashTransactionTO cashTransactionTO2 = new CashTransactionTO();
			cashTransactionTO2.setBookID(transactionInputTO.getBookID());
			cashTransactionTO2.setFirmID(cashTransactionTO.getFirmID());
			cashTransactionTO2.setFirmName(cashTransactionTO.getFirmName());
			cashTransactionTO2.setLedgerID(cashTransactionTO.getLedgerID());
			cashTransactionTO2.setLedgerName(cashTransactionTO.getLedgerName());
			cashTransactionTO2.setTransactionID("CR"+transactionID);
			cashTransactionTO2.setTransactionSeqNo(currentTxnRowSqNo);
			cashTransactionTO2.setAmount(cashTransactionTO.getAmount());
			
			cashTransactionDAO.createCashReceiptRecord(cashTransactionTO2);
			
			
			LedgerTO partyLedgerObj = new LedgerTO();
			partyLedgerObj.setBookID(transactionInputTO.getBookID());
			partyLedgerObj.setTransactionID("CR"+transactionID);
			partyLedgerObj.setTransactionType(transactionInputTO.getTransactionType());
			partyLedgerObj.setTransactionDate(transactionInputTO.getTransactionDate());
			partyLedgerObj.setLedgerSeqNo(currentTxnRowSqNo);
			partyLedgerObj.setLedgerID(cashTransactionTO.getLedgerID());
			partyLedgerObj.setLedgerName(cashTransactionTO.getLedgerID());
			partyLedgerObj.setFirmID(cashTransactionTO.getFirmID());
			partyLedgerObj.setFirmName(cashTransactionTO.getFirmName());
			partyLedgerObj.setAmount(cashTransactionTO.getAmount());
			
			
			LedgerTO cashLedgerObj = new LedgerTO();
			cashLedgerObj.setBookID(transactionInputTO.getBookID());
			cashLedgerObj.setTransactionID("CR"+transactionID);
			cashLedgerObj.setTransactionType(transactionInputTO.getTransactionType());
			cashLedgerObj.setTransactionDate(transactionInputTO.getTransactionDate());
			cashLedgerObj.setLedgerSeqNo(currentTxnRowSqNo);
			cashLedgerObj.setLedgerID(cashTransactionTO.getLedgerID());
			cashLedgerObj.setLedgerName(cashTransactionTO.getLedgerID());
			cashLedgerObj.setFirmID(cashTransactionTO.getFirmID());
			cashLedgerObj.setFirmName(cashTransactionTO.getFirmName());
			cashLedgerObj.setAmount(cashTransactionTO.getAmount());
			
			if("CR".equalsIgnoreCase(transactionInputTO.getTransactionType())){
				partyLedgerObj.setCr_Dr("Cr");
				cashLedgerObj.setCr_Dr("Dr");
			}else if("CP".equalsIgnoreCase(transactionInputTO.getTransactionType())){
				partyLedgerObj.setCr_Dr("Dr");
				cashLedgerObj.setCr_Dr("Cr");
			}else{
				throw new Exception("Invalid Transaction Type in Cash Receipt Module");
			}
			ledgerDAO.createLedgerCashAndLedgerPartyRecords(cashLedgerObj, partyLedgerObj);
			
			LedgerAccountTO ledgerAccountPartyObj = getLedgerAccountRecord(partyLedgerObj.getLedgerID(), cashTransactionTO2.getFirmID(), cashTransactionTO2.getBookID());
			LedgerAccountTO ledgerAccountCashObj  = getLedgerAccountRecord(cashLedgerObj.getLedgerID(), cashTransactionTO2.getFirmID(), cashTransactionTO2.getBookID());
			System.out.println(".....End of LedgerAccountTO Retrieval............");
			
			System.out.println("======ledgerAccountPartyObj===closeBalance=="+ledgerAccountPartyObj.getCloseBalance()+"======Amount====="+ cashTransactionTO2.getAmount());
			ledgerAccountPartyObj.setCredit(cashTransactionTO2.getAmount());
			ledgerAccountPartyObj.setCloseBalance(ledgerAccountPartyObj.getCloseBalance() + cashTransactionTO2.getAmount());
			
			System.out.println("======ledgerAccountCashObj===closeBalance=="+ledgerAccountCashObj.getCloseBalance()+"======Amount====="+ cashTransactionTO2.getAmount());
			ledgerAccountCashObj.setDebit(cashTransactionTO2.getAmount());
			ledgerAccountCashObj.setCloseBalance(ledgerAccountCashObj.getCloseBalance() - cashTransactionTO2.getAmount());
			
			System.out.println(".....End of LedgerAccount Update............");
			ledgerAccountDAO.updateLedgerAccountCashAndPartyRecords(ledgerAccountPartyObj,ledgerAccountCashObj);
			
		}
		
		TransactionTO transactionTO = new TransactionTO();
		transactionTO.setBookID(transactionInputTO.getBookID());
		transactionTO.setTransactionID(transactionInputTO.getTransactionID());
		transactionTO.setTransactionType(transactionInputTO.getTransactionType());
		transactionTO.setTransactionDate(transactionInputTO.getTransactionDate());
		transactionTO.setPaymentMode(transactionInputTO.getPaymentMode());
		transactionTO.setLedgerID(transactionInputTO.getLedgerID());
		transactionTO.setLedgerName(transactionInputTO.getLedgerName());
		transactionTO.setTotalAmount(totalAmountOfCashTxns);
		
		transactionDAO.createNewTransactionRecord("CR",transactionTO);
				
	}
	
	private LedgerAccountTO  getLedgerAccountRecord(String ledgerID,String firmID,String finBookID){
		return ledgerAccountDAO.getLedgerAccountRecord(ledgerID, firmID, finBookID);
	}
	
}
