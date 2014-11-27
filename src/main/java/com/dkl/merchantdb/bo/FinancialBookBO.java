package com.dkl.merchantdb.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.intf.IFinancialBookDAO;
import com.dkl.merchantdb.to.FinancialBookTO;

@Component
public class FinancialBookBO {

	@Autowired
	private IFinancialBookDAO financialBookDAO;

	public List<FinancialBookTO> readAllByFK(Long companyId) {
		return financialBookDAO.readAllByFk(companyId);

	}
}
