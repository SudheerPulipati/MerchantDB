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

import com.dkl.merchantdb.bo.ItemUnitBO;
import com.dkl.merchantdb.to.ItemUnitTO;
import com.dkl.merchantdb.to.JsonTemplateTO;
import com.google.gson.Gson;

@Controller
@SessionAttributes("companyId")
public class ItemUnitController {

	@Autowired
	private ItemUnitBO itemUnitBO;

	@RequestMapping("/createItemUnit")
	public String createItemUnit() {
		return "createItemUnit";
	}

	@RequestMapping("/saveItemUnit")
	public String saveItemUnit(ItemUnitTO itemUnitTO, @ModelAttribute("companyId") Long companyId, RedirectAttributes redirectAttributes) {
		itemUnitTO.setCompanyId(companyId);
		int noOfRows = itemUnitBO.createItemUnit(itemUnitTO);
		if (noOfRows > 0) {
			redirectAttributes.addAttribute("status", "Item Unit "+itemUnitTO.getUnitName()+" has been created successfully");
		}
		return "redirect:success";
	}

	@RequestMapping("/viewItemUnit")
	public String viewItemUnit() {
		System.out.println("viewItemUnit");
		return "viewItemUnit";
	}

	@RequestMapping("/viewItemUnitJson")
	@ResponseBody
	public String viewItemUnitJSON(@ModelAttribute("companyId") Long companyId) {
		System.out.println("viewItemUnitJSON");
		JsonTemplateTO jsonTemplateTO = new JsonTemplateTO();
		List<ItemUnitTO> dataList = itemUnitBO.readAllByFK(companyId);
		System.out.println(dataList);
		jsonTemplateTO.setDraw(1);
		jsonTemplateTO.setRecordsFiltered(dataList.size() % 10);
		jsonTemplateTO.setRecordsTotal(dataList.size());
		jsonTemplateTO.setData(dataList);
		return new Gson().toJson(jsonTemplateTO);
	}

	@RequestMapping("/updateItemUnit")
	public String updateCityGroup(ItemUnitTO itemUnitTO, @ModelAttribute("companyId") Long companyId) {
		System.out.println("updateItemUnit:itemUnitTO:"+itemUnitTO.getUnitId());
		itemUnitTO.setCompanyId(companyId);
		int row = itemUnitBO.update(itemUnitTO);
		System.out.println("No of rows updated:"+row);
		return "viewItemUnit";
	}

	@RequestMapping("/deleteItemUnit")
	public String deleteCityGroup(@RequestParam("unitId") String itemUnitId) {
		System.out.println("deleteItemUnit");
		itemUnitBO.delete(itemUnitId);
		return "viewItemUnit";
	}
}
