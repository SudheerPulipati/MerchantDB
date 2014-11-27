package com.dkl.merchantdb.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dkl.merchantdb.bo.CompanyBO;
import com.dkl.merchantdb.bo.FinancialBookBO;
import com.dkl.merchantdb.to.CompanyTO;

@Controller
@SessionAttributes({"companyId","financialYears"})
public class CompanyController {

	@Autowired
	private CompanyBO companyBO;
	
	@Autowired
	private FinancialBookBO financialBookBO;

	HttpSession session = null;

	@RequestMapping(value = "/createCompany")
	public String createCompany(Locale locale, Model model) {
		return "createCompany";
	}

	@RequestMapping(value = "/saveCompany")
	public String saveCompany(CompanyTO companyTO, Model model) {
		int rowCount = companyBO.createCompany(companyTO);
		if (rowCount > 0) {
			model.addAttribute("companyCreationStatus", "Company " + companyTO.getCompanyName()
					+ "has created successfully.");
		}
		return "createCompany";
	}

	@RequestMapping(value = "/editCompany")
	public String viewCompany(Model model, @RequestParam("companyId") String companyId) {
		model.addAttribute("companyId", Long.parseLong(companyId));
		return "updateCompany";
	}

	@RequestMapping(value = "/viewCompany")
	public String viewCompany() {
		return "viewCompany";
	}

	// @RequestMapping(value = "/viewCompanyJSON")
	// @ResponseBody
	// public String viewCompanyJSON(@RequestParam("companyID") String
	// companyID, Model model) {
	// CompanyTO company = companyBO.viewCompany(companyID);
	// String str = new Gson().toJson(company);
	// return str;
	// /*JsonTemplateTO jsonTemplateTO = new JsonTemplateTO();
	// jsonTemplateTO.setDraw(1);
	// jsonTemplateTO.setRecordsFiltered(20);
	// jsonTemplateTO.setRecordsTotal(20);
	// List<CompanyTO> dataList = companyBO.viewCompany();
	// jsonTemplateTO.setData(dataList.toArray(new CompanyTO[dataList.size()]));
	// return new Gson().toJson(jsonTemplateTO);*/
	// }

	// @RequestMapping(value = "/viewCompanyListJSON")
	// @ResponseBody
	// public String viewCompanyListJSON(Model model){
	// JsonTemplateTO jsonTemplateTO = new JsonTemplateTO();
	// jsonTemplateTO.setDraw(1);
	// jsonTemplateTO.setRecordsFiltered(20);
	// jsonTemplateTO.setRecordsTotal(20);
	// List<CompanyTO> dataList = companyBO.viewCompanyList();
	// jsonTemplateTO.setData(dataList.toArray(new CompanyTO[dataList.size()]));
	// return new Gson().toJson(jsonTemplateTO);
	// }

	@RequestMapping(value = "/updateCompany")
	public String updateCompany(CompanyTO companyTO, @ModelAttribute("companyId") Long companyId, Model model) {

		companyTO.setCompanyID(companyId);
		int noOfRowsUpdated = companyBO.updateCompany(companyTO);
		if (noOfRowsUpdated > 0) {
			model.addAttribute("companyUpdationStatus", "Company Details Updated Successfully.");
		}
		return "updateCompany";
	}

	@RequestMapping(value = "/adminView")
	public String adminView(Model model, @RequestParam("companyId") String companyId) {
		model.addAttribute("companyId", Long.parseLong(companyId));
		model.addAttribute("financialYears", financialBookBO.readAllByFK(Long.parseLong(companyId)));
		return "companyAdminView";
	}
	// @RequestMapping(value = "/deleteCompany")
	// public String deleteCompany(@RequestParam("companyID") String companyID)
	// {
	// System.out.println("In COntroller");
	// companyBO.deleteCompany(companyID);
	// return "viewCompany";
	// }

}
