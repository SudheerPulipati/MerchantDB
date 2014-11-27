package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.PurchaseReportTO;

public interface IPurchaseReportDAO {
	List<PurchaseReportTO> readAllPurchaseEntries(String finBookId,String startDate,String endDate);
}
