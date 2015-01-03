package com.dkl.merchantdb.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.LedgerDAO;
import com.dkl.merchantdb.to.LedgerTO;

@Repository
public class LedgerDAOImpl implements LedgerDAO{

	private static final String INSERT_INTO_LEDGER = "INSERT INTO `dklf`.`ledger`(`FIB_ID`,`TRANS_ID`,`TRANS_TYPE`,`TRANS_DATE`,"
			+ "`LEDGER_ID`,`LEDGER_SEQ_NO`,`LEDGER_NAME`,`FIRM_ID`,`FIRM_NAME`,`LEDGER_CR_DR`,`LEDGER_AMOUNT`,`LEDGER_GRP_CRT_DATE`,`LEDGER_GRP_MOD_DATE`) VALUES(?,?,?,?,?,?,?,?,?,?,?,now(),now());";

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public int createLedgerItemAndLedgerPartyRecords(LedgerTO ledgerItem, LedgerTO ledgerParty) {
		int result =0;
		
		result = jdbcTemplate.update(INSERT_INTO_LEDGER, new Object[]{
				ledgerItem.getBookID(),
				ledgerItem.getTransactionID(),
				ledgerItem.getTransactionType(),
				ledgerItem.getTransactionDate(),
				ledgerItem.getLedgerID(),
				ledgerItem.getLedgerSeqNo(),
				ledgerItem.getLedgerName(),
				ledgerItem.getFirmID(),
				ledgerItem.getFirmName(),
				ledgerItem.getCr_Dr(),
				ledgerItem.getAmount()});
		
		result = result +jdbcTemplate.update(INSERT_INTO_LEDGER, new Object[]{
							ledgerParty.getBookID(),
							ledgerParty.getTransactionID(),
							ledgerParty.getTransactionType(),
							ledgerParty.getTransactionDate(),
							ledgerParty.getLedgerID(),
							ledgerParty.getLedgerSeqNo(),
							ledgerParty.getLedgerName(),
							ledgerParty.getFirmID(),
							ledgerParty.getFirmName(),
							ledgerParty.getCr_Dr(),
							ledgerParty.getAmount()});
		
		return result;
		
	}

	@Override
	public int createLedgerCashAndLedgerPartyRecords(LedgerTO ledgerCash,LedgerTO ledgerParty) {
		return createLedgerItemAndLedgerPartyRecords(ledgerCash,ledgerParty);
	}

}
