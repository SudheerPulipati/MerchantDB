package com.dkl.merchantdb.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.intf.IBalanceSheetDAO;
import com.dkl.merchantdb.to.BalanceSheetTO;

@Component
public class BalanceSheetReportBO{

	@Autowired
	private IBalanceSheetDAO reportsDAO;

	public List<BalanceSheetTO> readAllBalanceSheetEntries(String finBookId, String startDate, String endDate) {
		return reportsDAO.readAllBalanceSheetEntries(finBookId, startDate, endDate);
	}
}
