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

		if (resultSet.getString("deposittype").equalsIgnoreCase("cr")) {
			trailBalanceTO.setCredit(resultSet.getDouble("amount"));
			trailBalanceTO.setDebit(0.0);
		} else if (resultSet.getString("deposittype").equalsIgnoreCase("dr")) {
			trailBalanceTO.setDebit(resultSet.getDouble("amount"));
			trailBalanceTO.setCredit(0.0);
		}

		trailBalanceTO.setRemark("Need to discuss");
		return trailBalanceTO;
	}

}
