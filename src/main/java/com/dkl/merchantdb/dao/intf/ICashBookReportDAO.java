package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.CashBookTO;

public interface ICashBookReportDAO {

	List<CashBookTO> readAllCashBookEntries(String finBookId,String startDate,String endDate);

}
