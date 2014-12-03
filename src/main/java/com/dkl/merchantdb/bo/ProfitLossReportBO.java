package com.dkl.merchantdb.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.intf.IProfitLossDAO;
import com.dkl.merchantdb.to.ProfitLossTO;

@Component
public class ProfitLossReportBO {

	@Autowired
	private IProfitLossDAO reportsDAO;

	public List<ProfitLossTO> readAllProfitLossRecords(String finBookId, String startDate, String endDate) {
		return reportsDAO.readAllProfitLossRecords(finBookId, startDate, endDate);
	}
}
