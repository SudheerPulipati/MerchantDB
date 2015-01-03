package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.LedgerAccountTO;

public class LedgerAccountMapper implements RowMapper<LedgerAccountTO> {

	@Override
	public LedgerAccountTO mapRow(ResultSet rs, int row) throws SQLException {
		LedgerAccountTO ledgerAccountTO = new LedgerAccountTO();
		ledgerAccountTO.setBookID(rs.getString("FIB_ID"));
		ledgerAccountTO.setLedgerAccountID(rs.getString("LEDGER_ACC_ID"));
		ledgerAccountTO.setLedgerAccountName(rs.getString("LEDGER_ACC_NAME"));
		ledgerAccountTO.setLedgerGroupID(rs.getString("LEDGER_GRP_ID"));
		ledgerAccountTO.setLedgerGroupName(rs.getString("LEDGER_GRP_NAME"));
		ledgerAccountTO.setLedgerGroupType(rs.getString("LEDGER_GRP_TYPE"));
		ledgerAccountTO.setFirmID(rs.getString("FIRM_ID"));
		ledgerAccountTO.setFirmName(rs.getString("FIRM_NAME"));
		ledgerAccountTO.setOpenBalance(Double.parseDouble(rs.getString("LEDGER_ACC_OPEN_BAL")));
		ledgerAccountTO.setCredit(Double.parseDouble(rs.getString("LEDGER_ACC_CREDIT")));
		ledgerAccountTO.setDebit(Double.parseDouble(rs.getString("LEDGER_ACC_DEBIT")));
		ledgerAccountTO.setCityGroupID(rs.getString("CITY_GROUP_ID"));
		ledgerAccountTO.setCloseBalance(Double.parseDouble(rs.getString("LEDGER_ACC_CLOSE_BAL")));
		return ledgerAccountTO;
	}

}
