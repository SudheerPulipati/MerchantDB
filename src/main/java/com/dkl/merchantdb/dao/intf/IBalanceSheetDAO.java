package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.BalanceSheetTO;

public interface IBalanceSheetDAO {
	
	List<BalanceSheetTO> readAllBalanceSheetEntries(String bookId, String startDate, String endDate);
}
