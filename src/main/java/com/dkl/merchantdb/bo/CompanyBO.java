package com.dkl.merchantdb.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.impl.SequenseGenDAO;
import com.dkl.merchantdb.dao.intf.ICompanyDAO;
import com.dkl.merchantdb.to.CompanyTO;
import com.dkl.merchantdb.util.DklUtil;

@Component
public class CompanyBO {

	@Autowired
	private ICompanyDAO companyDAO;
	
	@Autowired
	private SequenseGenDAO sequenseGenDAO;
	
	public CompanyTO createCompany(CompanyTO companyTO) {
		CompanyTO companyToResponse = null;
		companyTO.setCompanyID(sequenseGenDAO.getSequenceID("company_id", "company"));
		companyTO.setCreationDate(DklUtil.getTodayDate());
		companyTO.setModifiedDate(DklUtil.getTodayDate());
		System.out.println(companyTO.getSlipsIndicator()+"==========");
		if(companyDAO.createCompany(companyTO)>0){
			companyToResponse = companyTO;
		}
		return companyToResponse;
	}
	
	public CompanyTO viewCompany(Long companyId){
		return companyDAO.viewCompany(companyId);
	}
	
	public List<CompanyTO> viewCompanyList() {
		return companyDAO.viewCompanyList();
	}
	
	public int updateCompany(CompanyTO companyTO){
		return companyDAO.update(companyTO);
	}
	
	public int deleteCompany(String companyID){
		return companyDAO.delete(companyID);
	}
}
