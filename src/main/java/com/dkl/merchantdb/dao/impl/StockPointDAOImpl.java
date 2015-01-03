package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.StockPointDAO;
import com.dkl.merchantdb.dao.mapper.StockPointMapper;
import com.dkl.merchantdb.to.StockPointTO;

@Repository
public class StockPointDAOImpl implements StockPointDAO{
	
	private static final String READ_ALL_QUERY = "select * from stock_point";

	@Autowired
	private JdbcTemplate jdbcTemplate;


	@Override
	public List<StockPointTO> getAllStockPointDetails() {
		return jdbcTemplate.query(READ_ALL_QUERY, new StockPointMapper());
	}

	
}
