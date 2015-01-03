package com.dkl.merchantdb.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.CashTransactionDAO;
import com.dkl.merchantdb.to.CashTransactionTO;

@Repository
public class CashTransactionDAOImpl implements CashTransactionDAO {
	
	private static final String NEXT_HIGHEST_CASH_TXN_SEQ_NO = "select count(distinct csh_trans.transaction_id)+1 as seq_no from dklf.cash_transaction csh_trans,dklf.transaction trans where trans.TRANSACTION_TYPE=? and trans.FIB_ID=? and trans.TRANSACTION_ID = csh_trans.TRANSACTION_ID";
	private static final String INSERT_CASH_RECEIPT_RECORD = "INSERT INTO `dklf`.`cash_transaction`(`FIN_BOOK_ID`,`TRANSACTION_ID`,`TRANSACTION_SEQ_NO`,`LEDGER_ID`,`LEDGER_NAME`,`AMOUNT`,`CREATED_DATE`,`MODIFIED_DATE`) VALUES(?,?,?,?,?,?,now(),now())";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public Long getNextHighestTransactionSeqNo(String transType,String finBookId) {
		return jdbcTemplate.queryForObject(NEXT_HIGHEST_CASH_TXN_SEQ_NO, new Object[]{transType,finBookId},Long.class);
	}

	@Override
	public int createCashReceiptRecord(CashTransactionTO cashTransactionTO){
		return jdbcTemplate.update(INSERT_CASH_RECEIPT_RECORD, new Object[]{cashTransactionTO.getBookID(),
																			cashTransactionTO.getTransactionID(),
																			cashTransactionTO.getTransactionSeqNo(),
																			cashTransactionTO.getLedgerID(),
																			cashTransactionTO.getLedgerName(),
																			cashTransactionTO.getAmount()});
	}

}
