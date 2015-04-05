package com.dkl.merchantdb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dkl.merchantdb.bo.LedgGroupBO;
import com.google.gson.Gson;

@Controller
@SessionAttributes("fbid")
public class LedgerReportController {
	
	@Autowired
	LedgGroupBO ledgerGroupBO;
	
	@RequestMapping("/ledgerReport")
	public String viewLedgerReport() {
		return "ledgerReport";
	}
	
	@RequestMapping("/ledgerReportJSON")
	@ResponseBody
	public String viewLedgerReportJSON(){
		System.out.println("#123#"+new Gson().toJson(ledgerGroupBO.readLedgerReport()));
		return new Gson().toJson(ledgerGroupBO.readLedgerReport());
	}
}
