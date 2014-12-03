package com.dkl.merchantdb.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.intf.ITrailBalanceReportDAO;
import com.dkl.merchantdb.to.TrailBalanceTO;

@Component
public class TrailBalanceReportBO {

	@Autowired
	private ITrailBalanceReportDAO reportsDAO;
	
	public List<TrailBalanceTO> readAllTrailBalanceEntries(String finBookId,String startDate,String endDate){
		return reportsDAO.readAllTrailBalanceEntries(finBookId,startDate,endDate);
	}
}
