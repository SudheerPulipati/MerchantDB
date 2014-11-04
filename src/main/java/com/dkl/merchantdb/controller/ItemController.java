package com.dkl.merchantdb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dkl.merchantdb.bo.ItemUnitBO;

@Controller
@SessionAttributes("companyId")
public class ItemController {

	@Autowired
	private ItemUnitBO itemUnitBO;

	@RequestMapping("/createItem")
	public String createItem() {
		System.out.println("createItem");
		return "createItem";
	}

	@RequestMapping("/getWeight")
	@ResponseBody
	public String getWeight(String unitName,@ModelAttribute("companyId")Long companyId) {
		return itemUnitBO.getWeight(unitName,companyId).toString();
	}
	
//	@RequestMapping("/saveItemUnit")
//	public String saveItemUnit(ItemUnitTO itemUnitTO, @ModelAttribute("companyId") Long companyId, Model model) {
//		itemUnitTO.setCompanyId(companyId);
//		int noOfRows = itemUnitBO.createItemUnit(itemUnitTO);
//		if (noOfRows > 0) {
//			model.addAttribute("success", "Item Unit has been created successfully");
//		}
//		return "createItemUnit";
//	}
//
//	@RequestMapping("/viewItemUnit")
//	public String viewItemUnit() {
//		System.out.println("viewItemUnit");
//		return "viewItemUnit";
//	}
//
//	@RequestMapping("/viewItemUnitJson")
//	@ResponseBody
//	public String viewItemUnitJSON(@ModelAttribute("companyId") Long companyId) {
//		System.out.println("viewItemUnitJSON");
//		JsonTemplateTO jsonTemplateTO = new JsonTemplateTO();
//		List<ItemUnitTO> dataList = itemUnitBO.readAllByFK(companyId);
//		System.out.println(dataList);
//		jsonTemplateTO.setDraw(1);
//		jsonTemplateTO.setRecordsFiltered(dataList.size() % 10);
//		jsonTemplateTO.setRecordsTotal(dataList.size());
//
//		jsonTemplateTO.setData(dataList.toArray(new ItemUnitTO[dataList.size()]));
//		return new Gson().toJson(jsonTemplateTO);
//	}
//
//	@RequestMapping("/updateItemUnit")
//	public String updateCityGroup(ItemUnitTO itemUnitTO, @ModelAttribute("companyId") Long companyId) {
//		System.out.println("updateItemUnit:itemUnitTO:"+itemUnitTO.getUnitId());
//		itemUnitTO.setCompanyId(companyId);
//		int row = itemUnitBO.update(itemUnitTO);
//		System.out.println("No of rows updated:"+row);
//		return "viewItemUnit";
//	}
//
//	@RequestMapping("/deleteItemUnit")
//	public String deleteCityGroup(@RequestParam("unitId") String itemUnitId) {
//		System.out.println("deleteItemUnit");
//		itemUnitBO.delete(itemUnitId);
//		return "viewItemUnit";
//	}
}
