package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.BalanceSheetTO;

public class BalanceSheetMapper implements RowMapper<BalanceSheetTO> {

	@Override
	public BalanceSheetTO mapRow(ResultSet resultSet, int rows) throws SQLException {
		BalanceSheetTO balanceSheetTO = new BalanceSheetTO();
		balanceSheetTO.setLiabilities("liabilities");
		balanceSheetTO.setAssets("assets");
		balanceSheetTO.setAmount1(0.0);
		balanceSheetTO.setAmount2(0.0);
		return balanceSheetTO;
	}

}
