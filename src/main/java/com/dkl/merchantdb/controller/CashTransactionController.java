package com.dkl.merchantdb.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dkl.merchantdb.bo.CashTransactionBO;
import com.dkl.merchantdb.to.CashReceiptTO;
import com.dkl.merchantdb.to.CashTransactionTO;
import com.dkl.merchantdb.to.TransactionTO;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class CashTransactionController {
	

	private static final Logger logger = LoggerFactory.getLogger(CashTransactionController.class);
	
	@Autowired
	private CashTransactionBO cashTransactionBO;

	@RequestMapping(value = "/getCashReceiptRequestData", method = RequestMethod.GET)
	@ResponseBody
	public CashReceiptTO getCashReceiptRequestData() {
		return cashTransactionBO.prepareRequestDataForCashReceipt();
	}
	
	@RequestMapping(value = "/cashReceipt", method = RequestMethod.GET)
	public String cashReceipt() {
		return "cashReceipt";
	}
	
	@RequestMapping(value = "/createCashTransaction", method = RequestMethod.POST)
	@ResponseBody
	public String createCashTransaction(@RequestBody String transactionTO) throws Exception {
		logger.info("Welcome createCashTransaction!");
		
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		TransactionTO transactionTO1 = objectMapper.readValue(transactionTO, TransactionTO.class);
		
		CashTransactionTO[] cashTransactionTOs = transactionTO1.getCashTransactionTOs();
		
		logger.info("Welcome cashTransactionTO! transactionTO BookID===="+transactionTO1.getBookID());
		logger.info("Welcome cashTransactionTO! transactionTO TransactionID===="+transactionTO1.getTransactionID());
		logger.info("Welcome cashTransactionTO! transactionTO TransactionType===="+transactionTO1.getTransactionType());
		logger.info("Welcome cashTransactionTO! transactionTO TransactionDate===="+transactionTO1.getTransactionDate());
		logger.info("Welcome cashTransactionTO! transactionTO LedgerID===="+transactionTO1.getLedgerID());
		logger.info("Welcome cashTransactionTO! transactionTO LedgerName===="+transactionTO1.getLedgerName());
		logger.info("Welcome cashTransactionTO! transactionTO TotalAmount===="+transactionTO1.getTotalAmount());
		
		for (CashTransactionTO cashTransactionTO : cashTransactionTOs){
			logger.info("Welcome cashTransactionTO! getFirmID===="+cashTransactionTO.getFirmID());
			logger.info("Welcome cashTransactionTO! getAmount===="+cashTransactionTO.getAmount());
			logger.info("Welcome cashTransactionTO! getFirmName===="+cashTransactionTO.getFirmName());
			logger.info("Welcome cashTransactionTO! getLedgerID===="+cashTransactionTO.getLedgerID());
			logger.info("Welcome cashTransactionTO! getLedgerName===="+cashTransactionTO.getLedgerName());
		}
		
		cashTransactionBO.saveCashReceiptTxn(transactionTO1);
		
		return "cashReceiptTxnSuccess";
	}
	
}
