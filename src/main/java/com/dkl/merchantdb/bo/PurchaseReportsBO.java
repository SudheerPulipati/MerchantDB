package com.dkl.merchantdb.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.intf.IPurchaseReportDAO;
import com.dkl.merchantdb.to.PurchaseReportTO;

@Component
public class PurchaseReportsBO {
 
	@Autowired
	private IPurchaseReportDAO purchaseReportDAO;
	
	public List<PurchaseReportTO> readAllPurchaseEntries(String bookId, String startDate, String endDate) {
		return purchaseReportDAO.readAllPurchaseEntries(bookId, startDate, endDate);
	}
	
}
