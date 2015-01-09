package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.SalesReportTO;

public class SalesReportMapper implements RowMapper<SalesReportTO> {

	@Override
	public SalesReportTO mapRow(ResultSet resultSet, int row) throws SQLException {
		
		SalesReportTO salesReportTO = new SalesReportTO();
		salesReportTO.setSlipName("Need to confirm");
		salesReportTO.setItemName(resultSet.getString("item_name"));
		salesReportTO.setItemBond("Need to confirm");
		salesReportTO.setItemGroup(resultSet.getString("item_batch_name"));
		salesReportTO.setPartyName(resultSet.getString("firm_name"));
		salesReportTO.setSalesDate(resultSet.getString("modified_date"));
		salesReportTO.setStockPoint(resultSet.getString("item_stock_point_id"));
		salesReportTO.setQuantity(resultSet.getString("stock_sale_qty"));
		salesReportTO.setBillPrice(resultSet.getString("stock_transfer_in"));
		salesReportTO.setUnbilledPrice(resultSet.getString("stock_transfer_out"));
		return salesReportTO;
	}

}
