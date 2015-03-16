package com.dkl.merchantdb.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dkl.merchantdb.bo.CompanyBO;
import com.dkl.merchantdb.bo.FinancialBookBO;
import com.dkl.merchantdb.to.CompanyTO;
import com.dkl.merchantdb.to.JsonTemplateTO;
import com.google.gson.Gson;

@Controller
@SessionAttributes({ "companyId", "financialYears", "companyList", "selectedItem" })
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
	public String saveCompany(CompanyTO companyTO, HttpSession session, RedirectAttributes redirectAttributes, @RequestParam("firmNames")List<String> firmNames) {
		CompanyTO companyToResp = companyBO.createCompany(companyTO, firmNames);
		if (companyToResp != null) {
			List<CompanyTO> companyList = (List<CompanyTO>) session.getAttribute("companyList");
			if (CollectionUtils.isEmpty(companyList)) {
				companyList = new ArrayList<CompanyTO>();
			}
			companyList.add(companyToResp);
			session.setAttribute("companyList", companyList);
			redirectAttributes.addAttribute("status", "Company " + companyTO.getCompanyName()
					+ " has been created successfully.");
		}
		return "redirect:success";
//		return "createCompany";
	}

	@RequestMapping(value = "/editCompany", method = { RequestMethod.GET })
	public String editCompany() {
		return "updateCompany";
	}

	@RequestMapping(value = "/editCompany", method = { RequestMethod.POST })
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
	public String updateCompany(CompanyTO companyTO, @RequestParam("companyId") String companyId, Model model,
			RedirectAttributes redirectAttributes) {
		model.addAttribute("selectedItem", companyId);
		companyTO.setCompanyID(Long.parseLong(companyId));
		int noOfRowsUpdated = companyBO.updateCompany(companyTO);
		if (noOfRowsUpdated > 0) {
			redirectAttributes.addAttribute("status", "Company Details Updated Successfully.");
		}
		return "redirect:success";
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
		model.addAttribute("companyList", companyBO.viewCompanyList());
		model.addAttribute("selectedItem", companyId);
		model.addAttribute("financialYears", financialBookBO.readAllByFK(Long.parseLong(companyId)));
		return "companyAdminView";
	}

	@RequestMapping(value = "/viewFinYears")
	public String viewFinYears(Model model, @RequestParam("companyId") String companyId) {
		model.addAttribute("companyId", Long.parseLong(companyId));
		model.addAttribute("selectedItem", companyId);
		model.addAttribute("financialYears", financialBookBO.readAllByFK(Long.parseLong(companyId)));
		return "viewFinYears";
	}

	@RequestMapping("/viewCompanyJSON")
	@ResponseBody
	public String viewReportJSON(@ModelAttribute("companyId") Long companyId) {
		System.out.println(new Gson().toJson(companyBO.viewCompany(companyId)));
		return new Gson().toJson(companyBO.viewCompany(companyId));
	}

	@RequestMapping(value = "/deleteCompany", method = { RequestMethod.POST })
	public String deleteCompany(@RequestParam("companyId") String companyId, HttpSession session,
			final RedirectAttributes redirectAttributes) {
		System.out.println("In Controller");
		List<CompanyTO> companyList = null;
		if (companyBO.deleteCompany(companyId) > 0) {
			companyList = (List<CompanyTO>) session.getAttribute("companyList");
			Iterator<CompanyTO> iterator = companyList.iterator();
			while (iterator.hasNext()) {
				if (iterator.next().getCompanyID() == Long.parseLong(companyId)) {
					iterator.remove();
				}
			}
		}
		session.setAttribute("companyList", companyList);
		redirectAttributes.addAttribute("status", "Company Details deleted Successfully.");
		return "redirect:success";
	}

	@RequestMapping(value = "/deleteCompany", method = { RequestMethod.GET })
	public String deleteCompany() {
		return "createCompany";
	}

}
