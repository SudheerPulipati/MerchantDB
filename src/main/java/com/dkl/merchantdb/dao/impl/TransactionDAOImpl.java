package com.dkl.merchantdb.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.TransactionDAO;
import com.dkl.merchantdb.to.TransactionTO;

@Repository
public class TransactionDAOImpl implements TransactionDAO{
	
	private static final String INSERT_INTO_TRANSACTION = "INSERT INTO `dklf`.`transaction`(`FIB_ID`,"
			+ "`TRANSACTION_ID`,`TRANSACTION_TYPE`,`TRANSACTION_DATE`,`LEDGER_ID`,`LEDGER_NAME`,`PAYMENT_MODE`,`WAY_BILL_NO`,`VEHICLE_NO`,"
			+ "`TOTAL_AMOUNT`,`SLIP_NO`,`TRANS_CRT_DATE`,`TRANS_MOD_DATE`) VALUES(?,?,?,?,?,?,?,?,?,?,?,now(),now())";

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public int createNewTransactionRecord(String txnType,TransactionTO transactionTO) {
		return jdbcTemplate.update(INSERT_INTO_TRANSACTION, new Object[]{
				transactionTO.getBookID(),
				txnType+transactionTO.getTransactionID(),
				transactionTO.getTransactionType(),
				transactionTO.getTransactionDate(),
				transactionTO.getLedgerID(),
				transactionTO.getLedgerName(),
				transactionTO.getPaymentMode(),
				transactionTO.getWayBillNo(),
				transactionTO.getVehicleNo(),
				transactionTO.getTotalAmount(),
				transactionTO.getSlipNo()});
	}
	
}
