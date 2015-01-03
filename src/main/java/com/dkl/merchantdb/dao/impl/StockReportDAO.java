package com.dkl.merchantdb.dao.impl;

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

	private static final String READ_ALL_QUERY = "";

	private static final String READ_QUERY = "";

	@Override
	public StockReportTO read(String itemGroupId) {
		return jdbcTemplate.queryForObject(READ_QUERY,
				new Object[] { itemGroupId }, new StockReportMapper());
	}

	@Override
	public List<StockReportTO> readAll() {
		return jdbcTemplate.query(READ_ALL_QUERY, new StockReportMapper());
	}

}
