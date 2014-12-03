package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.TrailBalanceTO;

public interface ITrailBalanceReportDAO {

	List<TrailBalanceTO> readAllTrailBalanceEntries(String bookId, String startDate, String endDate);
}
