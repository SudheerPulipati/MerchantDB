package com.dkl.merchantdb.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dkl.merchantdb.bo.StockPointBO;
import com.dkl.merchantdb.bo.StockReportBO;
import com.dkl.merchantdb.to.JsonTemplateTO;
import com.dkl.merchantdb.to.StockReportTO;
import com.google.gson.Gson;

@Component
@SessionAttributes("fbid")
public class StockReportController {
	
	@Autowired
	StockReportBO stockReportBO;
	
	@RequestMapping("/stockReport")
	public String viewStockReport(){
		return "viewStockReport";
	}
	
	@RequestMapping("/viewStockReportJson")
	public String viewStockReportJson(){
		List<StockReportTO> stockReportToList = new ArrayList<StockReportTO>();
		stockReportToList = stockReportBO.readAll();
		JsonTemplateTO jsonTemplateTO = new JsonTemplateTO();
		jsonTemplateTO.setRecordsFiltered(10);
		jsonTemplateTO.setRecordsTotal(stockReportToList.size());
		jsonTemplateTO.setData(stockReportToList);
		return new Gson().toJson(jsonTemplateTO);
	}
}
