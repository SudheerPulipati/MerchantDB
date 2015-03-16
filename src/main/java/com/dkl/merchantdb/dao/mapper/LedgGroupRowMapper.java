package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.LedgerGroupTO;

public class LedgGroupRowMapper implements RowMapper<LedgerGroupTO> {

	@Override
	public LedgerGroupTO mapRow(ResultSet resultSet, int rowNum)
			throws SQLException {
		LedgerGroupTO ledgGroupTO = new LedgerGroupTO();
		ledgGroupTO.setLedgGroupID(resultSet.getString("LEDGER_GRP_ID"));
		ledgGroupTO.setCompanyID(resultSet.getLong("COMPANY_ID"));
		ledgGroupTO.setLedgGroupName(resultSet.getString("LEDGER_GRP_NAME"));
		ledgGroupTO.setLedgGroupType(resultSet.getString("LEDGER_GRP_TYPE"));
		ledgGroupTO.setLedgCreateDate(resultSet
				.getString("created_date"));
		ledgGroupTO.setLedgModDate(resultSet.getString("modified_date"));
		return ledgGroupTO;
	}
}
