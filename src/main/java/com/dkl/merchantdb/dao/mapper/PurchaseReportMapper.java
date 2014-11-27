package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.PurchaseReportTO;

public class PurchaseReportMapper implements RowMapper<PurchaseReportTO> {

	@Override
	public PurchaseReportTO mapRow(ResultSet resultSet, int row) throws SQLException {
		
		PurchaseReportTO purchaseReportTO = new PurchaseReportTO();
		purchaseReportTO.setSlipName("Need to confirm");
		purchaseReportTO.setItemName(resultSet.getString("item_name"));
		purchaseReportTO.setItemBond("Need to confirm");
		purchaseReportTO.setItemGroup(resultSet.getString("item_batch_name"));
		purchaseReportTO.setPartyName(resultSet.getString("firm_name"));
		purchaseReportTO.setPurchaseDate(resultSet.getString("modified_date"));
		purchaseReportTO.setStockPoint(resultSet.getString("stock_point_name"));
		purchaseReportTO.setQuantity(resultSet.getString("purchase_quantity"));
		purchaseReportTO.setBillPrice(resultSet.getString("price1"));
		purchaseReportTO.setUnbilledPrice(resultSet.getString("price2"));
		return purchaseReportTO;
	}

}
