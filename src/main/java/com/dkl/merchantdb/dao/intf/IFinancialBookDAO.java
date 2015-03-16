package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.FinancialBookTO;

public interface IFinancialBookDAO {

	List<FinancialBookTO> readAllByFk(Long companyId);

	String getMaxFinYear(long companyID);
}
