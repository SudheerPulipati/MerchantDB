package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.StockReportTO;

public interface IStockReportDAO {
 StockReportTO read(String itemGroupId);
 List<StockReportTO> readAll();
}
