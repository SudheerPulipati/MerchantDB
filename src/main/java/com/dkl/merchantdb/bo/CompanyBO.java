package com.dkl.merchantdb.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.dkl.merchantdb.dao.impl.CompanyDAO;
import com.dkl.merchantdb.to.CompanyTO;

public class CompanyBO {

	@Autowired
	private CompanyDAO companyDAO;

	public int createCompany(CompanyTO companyTO) {
		System.out.println("In BO");
		return companyDAO.createCompany(companyTO);
	}
	
	public List<CompanyTO> viewCompany(){
		return companyDAO.viewCompany();
	}

	public CompanyDAO getCompanyDAO() {
		return companyDAO;
	}

	public void setCompanyDAO(CompanyDAO companyDAO) {
		this.companyDAO = companyDAO;
	}
}
