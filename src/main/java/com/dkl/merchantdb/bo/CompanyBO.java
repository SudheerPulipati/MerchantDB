package com.dkl.merchantdb.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.dkl.merchantdb.dao.intf.ICompanyDAO;
import com.dkl.merchantdb.to.CompanyTO;

public class CompanyBO {

	@Autowired
	private ICompanyDAO companyDAO;

	public ICompanyDAO getCompanyDAO() {
		return companyDAO;
	}

	public void setCompanyDAO(ICompanyDAO companyDAO) {
		this.companyDAO = companyDAO;
	}

	public int createCompany(CompanyTO companyTO) {
		System.out.println("In BO");
		return companyDAO.createCompany(companyTO);
	}
	
	public List<CompanyTO> viewCompany(){
		return companyDAO.viewCompany();
	}
}
