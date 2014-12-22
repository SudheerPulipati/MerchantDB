package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.CompanyTO;

public interface ICompanyDAO {

	int createCompany(CompanyTO companyTO);

	CompanyTO viewCompany(Long companyId);
	
	List<CompanyTO> viewCompanyList();
	
	int update(CompanyTO companyTO);
	
	int delete(String companyID);
}
