package com.dkl.merchantdb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dkl.merchantdb.bo.CashBookReportBO;

@Controller
@SessionAttributes("fbid")
public class ReportsController {

	@Autowired
	private CashBookReportBO reportsBO;
	
	@RequestMapping("/viewReports")
	public String viewReports(@RequestParam("fbid")String finBookId,Model model) {
		model.addAttribute("fbid", finBookId);
		return "reports";
	}
	
	
}
