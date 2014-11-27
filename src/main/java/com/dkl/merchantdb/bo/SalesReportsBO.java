package com.dkl.merchantdb.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.intf.ISaleReportDAO;
import com.dkl.merchantdb.to.SalesReportTO;

@Component
public class SalesReportsBO {
 
	@Autowired
	private ISaleReportDAO salesReportDAO;
	
	public List<SalesReportTO> readAllSalesEntries(String bookId, String startDate, String endDate) {
		return salesReportDAO.readAllSalesEntries(bookId, startDate, endDate);
	}
	
}
