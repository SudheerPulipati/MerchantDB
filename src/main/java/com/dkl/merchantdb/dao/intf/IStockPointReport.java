package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.StockPointReportTO;

public interface IStockPointReport {

	List<StockPointReportTO> readAll(String startDate, String endDate);
}
