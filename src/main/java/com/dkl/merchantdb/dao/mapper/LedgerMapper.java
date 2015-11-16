package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.LedgerTO;

public class LedgerMapper implements RowMapper<LedgerTO> {

	@Override
	public LedgerTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		LedgerTO ledgerTO = new LedgerTO();
		ledgerTO.setBookID(rs.getString("FIB_ID"));
		ledgerTO.setTransactionID(rs.getString("TRANS_ID"));
		ledgerTO.setTransactionType(rs.getString("TRANS_TYPE"));
		ledgerTO.setLedgerSeqNo(rs.getLong("LEDGER_SEQ_NO"));
		ledgerTO.setTransactionDate(rs.getString("TRANS_DATE"));
		ledgerTO.setLedgerID(rs.getString("LEDGER_ID"));
		ledgerTO.setLedgerName(rs.getString("LEDGER_NAME"));
		ledgerTO.setFirmID(rs.getString("FIRM_ID"));
		ledgerTO.setFirmName(rs.getString("FIRM_NAME"));
		ledgerTO.setCr_Dr(rs.getString("LEDGER_CR_DR"));
		ledgerTO.setAmount(rs.getDouble("LEDGER_AMOUNT"));
		ledgerTO.setCreationDate(rs.getString("CREATED_DATE"));
		ledgerTO.setModifiedDate(rs.getString("MODIFIED_DATE"));
		return ledgerTO;
	}

}
