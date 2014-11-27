package com.dkl.merchantdb.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.intf.ICashBookReportDAO;
import com.dkl.merchantdb.to.CashBookTO;

@Component
public class CashBookReportBO {

	@Autowired
	private ICashBookReportDAO reportsDAO;
	
	public List<CashBookTO> readAllCashBookEntries(String finBookId,String startDate,String endDate){
		return reportsDAO.readAllCashBookEntries(finBookId,startDate,endDate);
	}
}
