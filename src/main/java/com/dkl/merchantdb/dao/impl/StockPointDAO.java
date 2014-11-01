package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.intf.IStockPoint;
import com.dkl.merchantdb.dao.mapper.StockPointMapper;
import com.dkl.merchantdb.to.StockPointTO;

@Component
public class StockPointDAO implements IStockPoint {

	private static final String CREATE_QUERY = "INSERT INTO stock_point values(?,?,?,?,?,?,?)";

	private static final String READ_QUERY = "SELECT * FROM stock_point where STOCK_POINT_ID = ?";

	private static final String READ_ALL_QUERY = "SELECT * FROM dklf.stock_point";

	private static final String UPDATE_QUERY = "UPDATE stock_point set STOCK_POINT_NAME = ?,STOCK_POINT_ADDRESS = ?,STOCK_POINT_CITY = ?,STOCK_POINT_STATE = ?,STOCK_POINT_PHONE = ? WHERE STOCK_POINT_ID = ?";

	private static final String DELETE_QUERY = "DELETE FROM stock_point where STOCK_POINT_ID = ?";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public int create(StockPointTO stockPointTO) {
		return jdbcTemplate.update(
				CREATE_QUERY,
				new Object[] { stockPointTO.getStockID(),
						stockPointTO.getCompanyID(),
						stockPointTO.getStockPointName(),
						stockPointTO.getStockPointAddress(),
						stockPointTO.getStockPointCity(),
						stockPointTO.getStockPointState(),
						stockPointTO.getStockPointPhone() });
	}

	@Override
	public StockPointTO read(long stockPointID) {
		return jdbcTemplate.queryForObject(READ_QUERY,
				new Object[] { stockPointID }, new StockPointMapper());
	}

	@Override
	public List<StockPointTO> readAll() {
		return jdbcTemplate.query(READ_ALL_QUERY, new StockPointMapper());
	}

	@Override
	public int update(StockPointTO stockPointTO) {
		return jdbcTemplate.update(
				UPDATE_QUERY,
				new Object[] { stockPointTO.getStockPointName(),
						stockPointTO.getStockPointAddress(),
						stockPointTO.getStockPointCity(),
						stockPointTO.getStockPointState(),
						stockPointTO.getStockPointPhone(),
						stockPointTO.getStockID() });
	}

	@Override
	public int delete(long stockPointID) {
		return jdbcTemplate.update(DELETE_QUERY, new Object[] { stockPointID });
	}

}
