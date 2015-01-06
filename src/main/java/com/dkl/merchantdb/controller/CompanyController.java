package com.dkl.merchantdb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dkl.merchantdb.bo.CompanyBO;
import com.dkl.merchantdb.bo.FinancialBookBO;
import com.dkl.merchantdb.to.CompanyTO;
import com.dkl.merchantdb.to.JsonTemplateTO;
import com.google.gson.Gson;

@Controller
@SessionAttributes({ "companyId", "financialYears", "companyList" })
public class CompanyController {

	@Autowired
	private CompanyBO companyBO;

	@Autowired
	private FinancialBookBO financialBookBO;

	@RequestMapping(value = "/createCompany", method = { RequestMethod.GET })
	public String createCompany() {
		return "createCompany";
	}
	
	@RequestMapping(value = "/saveCompany", method = { RequestMethod.GET })
	public String saveCompany(Model model) {
		
		return "createCompany";
	}

	@RequestMapping(value = "/saveCompany", method = { RequestMethod.POST })
	public String saveCompany(CompanyTO companyTO, Model model) {
		int rowCount = companyBO.createCompany(companyTO);

		if (rowCount > 0) {
			model.addAttribute("companyList", companyBO.viewCompanyList());
			//model.addAttribute("status", "Company " + companyTO.getCompanyName() + "has created successfully.");
		}
		return "redirect:/success?status=Company " + companyTO.getCompanyName() + " has been created successfully.";
	}

	@RequestMapping(value = "/editCompany", method = { RequestMethod.GET })
	public String editCompany() {
		return "updateCompany";
	}
	@RequestMapping(value = "/editCompany",method = { RequestMethod.POST })
	public String viewCompany(Model model, @RequestParam("companyId") String companyId) {
		model.addAttribute("companyId", Long.parseLong(companyId));
		model.addAttribute("companyObj", companyBO.viewCompany(Long.parseLong(companyId)));
		return "updateCompany";
	}

	@RequestMapping(value = "/updateCompany", method = { RequestMethod.GET })
	public String updateCompany() {
		return "updateCompany";
	}

	@RequestMapping(value = "/updateCompany", method = { RequestMethod.POST })
	public String updateCompany(CompanyTO companyTO, @ModelAttribute("companyId") Long companyId, Model model) {
		System.out.println("======updateCompany========" + companyTO);
		companyTO.setCompanyID(companyId);
		int noOfRowsUpdated = companyBO.updateCompany(companyTO);
		if (noOfRowsUpdated > 0) {
			model.addAttribute("companyList", companyBO.viewCompanyList());
			//model.addAttribute("status", "Company Details Updated Successfully.");
		}
		return "redirect:/success?status=Company Details Updated Successfully.";
	}
	@RequestMapping(value = "/viewCompany")
	@ResponseBody
	public String viewCompany() {
		JsonTemplateTO jsonTemplateTO = new JsonTemplateTO();
		jsonTemplateTO.setDraw(1);
		jsonTemplateTO.setRecordsFiltered(20);
		jsonTemplateTO.setRecordsTotal(20);
		List<CompanyTO> dataList = companyBO.viewCompanyList();
		jsonTemplateTO.setData(dataList);
		// return "viewCompany";
		return new Gson().toJson(jsonTemplateTO);
	}
	
	

	@RequestMapping(value = "/adminView")
	public String adminView(Model model, @RequestParam("companyId") String companyId) {
		model.addAttribute("companyId", Long.parseLong(companyId));
		model.addAttribute("financialYears", financialBookBO.readAllByFK(Long.parseLong(companyId)));
		return "companyAdminView";
	}

	@RequestMapping("/viewCompanyJSON")
	@ResponseBody
	public String viewReportJSON(@ModelAttribute("companyId") Long companyId) {
		return new Gson().toJson(companyBO.viewCompany(companyId));
	}

	@RequestMapping(value = "/deleteCompany", method = { RequestMethod.POST })
	public String deleteCompany(@RequestParam("companyId") String companyId, Model model) {
		System.out.println("In Controller");
		companyBO.deleteCompany(companyId);
		model.addAttribute("companyList", companyBO.viewCompanyList());
		//model.addAttribute("status", "Company Details deleted Successfully.");
		return "redirect:/success?status=Company Details deleted Successfully.";
	}

	@RequestMapping(value = "/deleteCompany", method = { RequestMethod.GET })
	public String deleteCompany() {
		return "createCompany";
	}
	
	@RequestMapping(value = "/success", method = { RequestMethod.GET })
	public String success(@RequestParam("status")String status,Model model) {
		model.addAttribute("status", status);
		return "success";
	}
}
