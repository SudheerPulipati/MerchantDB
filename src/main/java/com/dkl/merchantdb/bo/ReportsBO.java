package com.dkl.merchantdb.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.intf.IReportsDAO;
import com.dkl.merchantdb.to.CashBookTO;

@Component
public class ReportsBO {

	@Autowired
	private IReportsDAO reportsDAO;
	
	public List<CashBookTO> readAllCashBookEntries(String finBookId){
		System.out.println("inBO:"+reportsDAO.readAllCashBookEntries(finBookId));
		return reportsDAO.readAllCashBookEntries(finBookId);
	}
}
