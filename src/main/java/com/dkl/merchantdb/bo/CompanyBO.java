package com.dkl.merchantdb.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.dkl.merchantdb.dao.impl.SequenseGenDAO;
import com.dkl.merchantdb.dao.intf.FirmDAO;
import com.dkl.merchantdb.dao.intf.ICompanyDAO;
import com.dkl.merchantdb.to.CompanyTO;
import com.dkl.merchantdb.to.FirmTO;
import com.dkl.merchantdb.util.DklUtil;
@Component
public class CompanyBO {

	@Autowired
	private ICompanyDAO companyDAO;
	
	@Autowired
	private FirmDAO firmDAO; 
	
	@Autowired
	private SequenseGenDAO sequenseGenDAO;
	
	@Transactional
	public CompanyTO createCompany(CompanyTO companyTO, List<String> firmNames) {
		CompanyTO companyToResponse = null;
		companyTO.setCompanyID(sequenseGenDAO.getSequenceID("company_id", "company"));
		companyTO.setCreationDate(DklUtil.getTodayDate());
		companyTO.setModifiedDate(DklUtil.getTodayDate());
		if(companyDAO.createCompany(companyTO)>0){
			companyToResponse = companyTO;
		}
		for(String firmDetail : firmNames){
			FirmTO firmTO = new FirmTO(); 
			firmTO.setCompanyID(companyToResponse.getCompanyID());
			firmTO.setFirmID(sequenseGenDAO.getSequenceID("firm_id", "firm","FIRM"));
			firmTO.setFirmName(getFirmName(firmDetail));
			firmTO.setCreationDate(companyToResponse.getCreationDate());
			firmTO.setModifiedDate(companyToResponse.getModifiedDate());
			System.out.println(firmTO);
			firmDAO.createFirm(firmTO);
		}
		
		return companyToResponse;
	}
	
	public CompanyTO viewCompany(Long companyId){
		CompanyTO companyTO = companyDAO.viewCompany(companyId);
		companyTO.setFirmList(firmDAO.readAllFirmsByFK(companyId));
		return companyTO;
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
	
	private String getFirmName(String firmDetail){
		return firmDetail.split(":")[1];
	}
}
