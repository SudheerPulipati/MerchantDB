package com.dkl.merchantdb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dkl.merchantdb.bo.RemarksBO;
import com.dkl.merchantdb.to.JsonTemplateTO;
import com.dkl.merchantdb.to.RemarksTO;
import com.google.gson.Gson;

@Controller
@SessionAttributes("companyId")
public class RemarksController {

	@Autowired
	private RemarksBO remarksBO;

	@RequestMapping("/createRemark")
	public String createRemark() {
		return "createRemark";
	}

	@RequestMapping("/saveRemark")
	public String saveRemark(RemarksTO remarksTO, @ModelAttribute("companyId") Long companyId, RedirectAttributes redirectAttributes) {
		remarksTO.setCompanyID(companyId);
		int noOfRows = remarksBO.createRemark(remarksTO);
		if (noOfRows > 0) {
			redirectAttributes.addAttribute("status", "Remark "+remarksTO.getRemarks()+" has been inserted successfully");
		}
		return "redirect:adminSuccess";
	}

	@RequestMapping("/viewRemarks")
	public String viewRemark() {
		return "viewRemarks";
	}

	@RequestMapping("/viewRemarksJSON")
	@ResponseBody
	public String viewRemarkJSON(@ModelAttribute("companyId") Long companyId) {
		System.out.println("viewRemarkJSON" + companyId);
		JsonTemplateTO jsonTemplateTO = new JsonTemplateTO();
		List<RemarksTO> dataList = remarksBO.readAllByFk(companyId);
		System.out.println(dataList);
		jsonTemplateTO.setDraw(1);
		jsonTemplateTO.setRecordsFiltered(dataList.size() % 10);
		jsonTemplateTO.setRecordsTotal(dataList.size());

		jsonTemplateTO.setData(dataList);
		return new Gson().toJson(jsonTemplateTO);
	}

	@RequestMapping("/updateRemark")
	public String updateRemarks(RemarksTO remarksTO, @ModelAttribute("companyId") Long companyId) {
		System.out.println("updateRemarks:remarksTO:" + remarksTO.getRemarksID());
		remarksTO.setCompanyID(companyId);
		int row = remarksBO.update(remarksTO);
		System.out.println("No of rows updated:" + row);
		return "viewRemarks";
	}

	@RequestMapping("/deleteRemark")
	public String deleteRemark(@RequestParam("remarksID") String remarksID) {
		System.out.println("deleteRemarks");
		remarksBO.delete(remarksID);
		return "viewRemarks";
	}
}
