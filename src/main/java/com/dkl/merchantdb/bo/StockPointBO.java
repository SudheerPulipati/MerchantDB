package com.dkl.merchantdb.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.impl.SequenseGenDAO;
import com.dkl.merchantdb.dao.impl.StockPointDAO;
import com.dkl.merchantdb.to.StockPointTO;

@Component
public class StockPointBO {

	@Autowired
	private StockPointDAO stockpointDAO;
    
	@Autowired
	private SequenseGenDAO sequenseGenDAO;
	
	public int create(StockPointTO stockPointTO) {
		stockPointTO.setStockID(sequenseGenDAO.getSequenceID("STOCK_POINT_ID", "STOCK_POINT","SP"));
		return stockpointDAO.create(stockPointTO);
	}

	public StockPointTO read(long stockPointID) {
		return stockpointDAO.read(stockPointID);
	}

	public List<StockPointTO> readAll() {
		return stockpointDAO.readAll();
	}

	public int update(StockPointTO stockPointTO) {
		return stockpointDAO.update(stockPointTO);
	}

	public int delete(String stockID) {
		return stockpointDAO.delete(stockID);
	}
}
