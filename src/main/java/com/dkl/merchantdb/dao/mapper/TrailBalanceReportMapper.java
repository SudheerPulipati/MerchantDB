package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.TrailBalanceTO;

public class TrailBalanceReportMapper implements RowMapper<TrailBalanceTO> {

	@Override
	public TrailBalanceTO mapRow(ResultSet resultSet, int rows) throws SQLException {
		TrailBalanceTO trailBalanceTO = new TrailBalanceTO();
		trailBalanceTO.setLedgerName(resultSet.getString("ledger_name"));

		if (resultSet.getString("ledger_cr_dr").equalsIgnoreCase("cr")) {
			trailBalanceTO.setCredit(resultSet.getDouble("ledger_amount"));
			trailBalanceTO.setDebit(0.0);
		} else if (resultSet.getString("ledger_cr_dr").equalsIgnoreCase("dr")) {
			trailBalanceTO.setDebit(resultSet.getDouble("ledger_amount"));
			trailBalanceTO.setCredit(0.0);
		}

		trailBalanceTO.setRemark("Need to discuss");
		return trailBalanceTO;
	}

}
