package com.dkl.merchantdb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dkl.merchantdb.bo.LedgGroupBO;
import com.dkl.merchantdb.to.LedgerReportTO;
import com.google.gson.Gson;

@Controller
@SessionAttributes({"companyId","fbid"})
public class LedgerReportController {
	
	@Autowired
	LedgGroupBO ledgerGroupBO;
	
	@RequestMapping("/ledgerReport")
	public String viewLedgerReport() {
		return "ledgerReport";
	}
	
	@RequestMapping("/ledgerReportJSON")
	@ResponseBody
	public String viewLedgerReportJSON(LedgerReportTO ledgerReportTO, @ModelAttribute("companyId")Long companyId,@ModelAttribute("fbid") String finBookId){
		System.out.println(new Gson().toJson(ledgerGroupBO.readLedgerReport(ledgerReportTO, companyId, finBookId)));
		return new Gson().toJson(ledgerGroupBO.readLedgerReport(ledgerReportTO, companyId, finBookId));
	}
}
