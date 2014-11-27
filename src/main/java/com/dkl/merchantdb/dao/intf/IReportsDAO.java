package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.CashBookTO;

public interface IReportsDAO {

	List<CashBookTO> readAllCashBookEntries(String finBookId);

}
