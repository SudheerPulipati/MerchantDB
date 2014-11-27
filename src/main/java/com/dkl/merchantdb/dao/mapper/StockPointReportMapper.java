package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.StockPointReportTO;

public class StockPointReportMapper implements RowMapper<StockPointReportTO>{

	@Override
	public StockPointReportTO mapRow(ResultSet rs, int rowNum)
			throws SQLException {
		StockPointReportTO stockPointReportTO = new StockPointReportTO();
		stockPointReportTO.setBookID(rs.getLong("BOOK_ID"));
		stockPointReportTO.setStockPointID(rs.getLong("STOCK_POINT_ID"));
		stockPointReportTO.setStockPointName(rs.getString("STOCK_POINT_NAME"));
		stockPointReportTO.setItemID(rs.getLong("ITEM_ID"));
		stockPointReportTO.setItemName(rs.getString("ITEM_NAME"));
		
		return null;
	}

}
