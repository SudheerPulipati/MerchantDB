package com.dkl.merchantdb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dkl.merchantdb.bo.StockPointBO;
import com.dkl.merchantdb.to.JsonTemplateTO;
import com.dkl.merchantdb.to.StockPointTO;
import com.google.gson.Gson;

@Controller
@SessionAttributes("companyId")
public class StockPointController {

	@Autowired
	private StockPointBO stockPointBo;

	@RequestMapping(value = "/createStockPoint")
	public String createStockPoint(StockPointTO stockPointTO) {
		return "createStockPoint";
	}

	@RequestMapping(value = "/saveStockPoint")
	public String saveStockPoint(StockPointTO stockPointTO,
			@ModelAttribute("companyId") Long companyId) {
		stockPointTO.setCompanyID(companyId);
		stockPointBo.create(stockPointTO);
		return "viewStockPoint";
	}

	@RequestMapping(value = "/viewStockPoint")
	public String viewStockerPoint(Model model) {
		return "viewStockPoint";
	}

	@RequestMapping(value = "/viewStockPointJSON")
	@ResponseBody
	public String viewStockPointJSON(@ModelAttribute("companyId") Long companyId) {
		JsonTemplateTO jsonTemplateTO = new JsonTemplateTO();
		List<StockPointTO> dataList = stockPointBo.readAll();
		jsonTemplateTO.setDraw(1);
		jsonTemplateTO.setRecordsTotal(dataList.size());
		jsonTemplateTO.setRecordsFiltered(10);
		jsonTemplateTO.setData(dataList);
		return new Gson().toJson(jsonTemplateTO);
	}

	@RequestMapping(value = "/updateStockPoint")
	public String updateStockPoint(StockPointTO stockPointTO) {
		stockPointBo.update(stockPointTO);
		return "viewStockPoint";
	}

	@RequestMapping(value = "/deleteStockPoint")
	public String deleteStockPoint(
			@RequestParam("stockID") Long stockID) {
		stockPointBo.delete(stockID);
		return "viewStockPoint";
	}

}
