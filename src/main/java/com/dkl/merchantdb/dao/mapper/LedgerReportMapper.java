package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.LedgerReportDataTO;
import com.dkl.merchantdb.to.LedgerReportTO;

public class LedgerReportMapper implements RowMapper<LedgerReportDataTO>  {

	@Override
	public LedgerReportDataTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		LedgerReportDataTO ledgerReportDataTO = new LedgerReportDataTO();
		ledgerReportDataTO.setLedgerName(rs.getString("LEDGER_NAME"));
		ledgerReportDataTO.setLedgerGroup(rs.getString("LEDGER_GRP_NAME"));
		ledgerReportDataTO.setCityGroup(rs.getString("city_group_name"));
		ledgerReportDataTO.setDate(rs.getString("MODIFIED_DATE"));
		ledgerReportDataTO.setCredit(rs.getLong("LEDGER_ACC_CREDIT"));
		ledgerReportDataTO.setDebit(rs.getLong("LEDGER_ACC_DEBIT"));
		ledgerReportDataTO.setBalance(rs.getLong("LEDGER_ACC_CLOSE_BAL"));
		ledgerReportDataTO.setMode(rs.getString("PAYMENT_MODE"));
		return ledgerReportDataTO;
	}

}
