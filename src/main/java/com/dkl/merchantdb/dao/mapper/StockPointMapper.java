package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.StockPointTO;

public class StockPointMapper implements RowMapper<StockPointTO> {

	@Override
	public StockPointTO mapRow(ResultSet resultSet, int rowNum)
			throws SQLException {
		StockPointTO stockPointTO = new StockPointTO();
		stockPointTO.setStockID(resultSet.getString("STOCK_POINT_ID"));
		stockPointTO.setCompanyID(resultSet.getLong("COMPANY_ID"));
		stockPointTO.setStockPointName(resultSet.getString("STOCK_POINT_NAME"));
		stockPointTO.setStockPointAddress(resultSet
				.getString("STOCK_POINT_ADDRESS"));
		stockPointTO.setStockPointCity(resultSet.getString("STOCK_POINT_CITY"));
		stockPointTO.setStockPointState(resultSet
				.getString("STOCK_POINT_STATE"));
		stockPointTO.setStockPointPhone(resultSet
				.getString("STOCK_POINT_PHONE"));
		return stockPointTO;
	}

}
