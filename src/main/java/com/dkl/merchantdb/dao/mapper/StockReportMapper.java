package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.StockReportTO;

public class StockReportMapper implements RowMapper<StockReportTO> {

	@Override
	public StockReportTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		StockReportTO stockReportTO = new StockReportTO();
		stockReportTO.setItemGroup(rs.getString("ITEM_GROUP_NAME"));
		stockReportTO.setItemName(rs.getString("ITEM_NAME"));
		stockReportTO.setItemBond(rs.getString("ITEM_BATCH_ID"));
		stockReportTO.setStockPoint(rs.getString("STOCK_POINT_NAME"));
		stockReportTO.setOpen(rs.getString("STOCK_OPEN_QTY"));
		stockReportTO.setPurchase(rs.getString("STOCK_PURCHASE_QTY"));
		stockReportTO.setSale(rs.getString("STOCK_SALE_QTY"));
		stockReportTO.setStockInHand(rs.getString("STOCK_ON_HAND"));
		return stockReportTO;
	}

}
