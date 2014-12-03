package com.dkl.merchantdb.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dkl.merchantdb.bo.ProfitLossReportBO;
import com.dkl.merchantdb.to.JsonTemplateTO;
import com.dkl.merchantdb.to.ProfitLossTO;
import com.google.gson.Gson;

@Controller
@SessionAttributes("fbid")
public class ProfitLossReportsController {

	@Autowired
	private ProfitLossReportBO reportsBO;

	@RequestMapping("/profitLossReport")
	public String viewCashbookReport() {
		return "profitLossReport";
	}

	@RequestMapping("/profitLossReportJSON")
	@ResponseBody
	public String viewReportJSON(@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate,
			@ModelAttribute("fbid") String finBookId) {
		System.out.println("startDate:" + startDate + "," + "endDate:" + endDate);
		if (StringUtils.isEmpty(endDate)) {
			endDate = startDate;
		}
		JsonTemplateTO jsonTemplateTO = new JsonTemplateTO();
		jsonTemplateTO.setRecordsFiltered(10);
		jsonTemplateTO.setRecordsTotal(10);
		List<ProfitLossTO> dataList = reportsBO.readAllProfitLossRecords(finBookId, startDate, endDate);
		jsonTemplateTO.setData(dataList);
		return new Gson().toJson(jsonTemplateTO);
	}

}
