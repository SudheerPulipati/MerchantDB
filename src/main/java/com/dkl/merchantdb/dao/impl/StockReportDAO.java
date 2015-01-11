package com.dkl.merchantdb.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.intf.IStockReportDAO;
import com.dkl.merchantdb.dao.mapper.StockReportMapper;
import com.dkl.merchantdb.to.StockReportTO;

@Component
public class StockReportDAO implements IStockReportDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;

	private static final String READ_ALL_QUERY = "SELECT item_ledger.ITEM_GROUP_NAME"
												    + ", item_ledger.ITEM_NAME"
												    + ", item_stock_point.ITEM_BATCH_ID"
												    + ", item_stock_point.STOCK_POINT_NAME"
												    + ", item_stock_point.STOCK_OPEN_QTY"
												    + ",item_stock_point.STOCK_PURCHASE_QTY"
												    + ",item_stock_point.STOCK_SALE_QTY"
												    + ",item_stock_point.STOCK_ON_HAND "
												    + "FROM dklf.item_ledger JOIN dklf.item_stock_point "
												    + "on item_ledger.ITEM_ID = item_stock_point.ITEM_ID";

	private static final String READ_QUERY = "";

	@Override
	public StockReportTO read(String itemGroupId) {
		return jdbcTemplate.queryForObject(READ_QUERY,
				new Object[] { itemGroupId }, new StockReportMapper());
	}

	@Override
	public List<StockReportTO> readAll() {
		return jdbcTemplate.query(READ_ALL_QUERY, new StockReportMapper());
		//return populateReport();
	}
	
	//FIXME due to unavailable of datat in database this method is used to show data.This should be deleted  
	private List<StockReportTO> populateReport(){
		List<StockReportTO> stockReportTOList = new ArrayList<StockReportTO>();
		for(int i=0;i<20;i++){
			StockReportTO StockReportTO = new StockReportTO();
			StockReportTO.setItemGroup("Item Group"+i);
			StockReportTO.setItemName("ItemName"+i);
			StockReportTO.setItemBond("Bond"+i);
			StockReportTO.setStockPoint("Stock"+i);
			StockReportTO.setOpen(""+i);
			StockReportTO.setPurchase(""+i);
			StockReportTO.setSale(""+i);
			StockReportTO.setStockInHand(""+i);
			stockReportTOList.add(StockReportTO);
		}
		return stockReportTOList;
	}

}
