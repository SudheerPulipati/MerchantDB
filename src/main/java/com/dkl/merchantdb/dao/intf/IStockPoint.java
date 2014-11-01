package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.StockPointTO;

public interface IStockPoint {
	int create(StockPointTO stockPointTO);

	StockPointTO read(long stockPointID);

	List<StockPointTO> readAll();

	int update(StockPointTO stockPointTO);

	int delete(long stockPointID);
}
