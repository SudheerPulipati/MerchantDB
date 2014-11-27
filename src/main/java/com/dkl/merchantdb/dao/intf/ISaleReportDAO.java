package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.SalesReportTO;

public interface ISaleReportDAO {
	List<SalesReportTO> readAllSalesEntries(String finBookId,String startDate,String endDate);
}
