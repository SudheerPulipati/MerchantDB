package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.StockPointTO;

public interface StockPointDAO{


	List<StockPointTO> getAllStockPointDetails();

}
