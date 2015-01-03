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

import com.dkl.merchantdb.bo.ItemBO;
import com.dkl.merchantdb.bo.ItemUnitBO;
import com.dkl.merchantdb.to.ItemTO;
import com.dkl.merchantdb.to.ItemUnitTO;
import com.dkl.merchantdb.to.JsonTemplateTO;

@Controller
@SessionAttributes("companyId")
public class ItemController {

	@Autowired
	private ItemBO itemBO;
	
	@Autowired
	private ItemUnitBO itemUnitBO;

	@RequestMapping("/createItem")
	public String createItem() {
		return "createItem";
	}

	@RequestMapping("/saveItem")
	public String saveItem(ItemTO itemTO, @ModelAttribute("companyId") Long companyId, Model model) {
		itemTO.setCompanyId(companyId);
		int noOfRows = itemBO.createItem(itemTO);
		if (noOfRows > 0) {
			model.addAttribute("itemCreationStatus", "Item has been inserted successfully");
		}
		return "createItem";
	}

	@RequestMapping(value="/getWeight")
	@ResponseBody
	public ItemUnitTO  getWeight(@RequestParam String unitName, @ModelAttribute("companyId") Long companyId) {
		System.out.println(unitName+"==============="+companyId);
		ItemUnitTO itemUnitTO = itemUnitBO.getWeight(unitName, companyId);
		System.out.println(itemUnitTO.getUnitId()+"===============");
		//ResponseEntity<String> return new ResponseEntity<String>(headers, HttpStatus.OK);
		return itemUnitTO;
	}

	// @RequestMapping("/saveItemUnit")
	// public String saveItemUnit(ItemUnitTO itemUnitTO,
	// @ModelAttribute("companyId") Long companyId, Model model) {
	// itemUnitTO.setCompanyId(companyId);
	// int noOfRows = itemUnitBO.createItemUnit(itemUnitTO);
	// if (noOfRows > 0) {
	// model.addAttribute("success", "Item Unit has been created successfully");
	// }
	// return "createItemUnit";
	// }
	//
	 @RequestMapping("/viewItem")
	 public String viewItemUnit() {
	 System.out.println("viewItemUnit........");
	 return "viewItem";
	 }
	
	 @RequestMapping("/viewItemJSON")
	 @ResponseBody
	 public JsonTemplateTO viewItemUnitJSON(@ModelAttribute("companyId") Long companyId) {
	 System.out.println("viewItemJSON..."+companyId);
	 JsonTemplateTO jsonTemplateTO = new JsonTemplateTO();
	 List<ItemTO> dataList = itemBO.readAllByFk(companyId);
	 System.out.println(dataList);
	 jsonTemplateTO.setDraw(1);
	 jsonTemplateTO.setRecordsFiltered(dataList.size() % 10);
	 jsonTemplateTO.setRecordsTotal(dataList.size());
	
	 jsonTemplateTO.setData(dataList);
	 return jsonTemplateTO;
	 }
	
	 @RequestMapping("/updateItem")
	 public String updateCityGroup(ItemTO itemTO,@ModelAttribute("companyId") Long companyId) {
		 System.out.println("updateItemUnit:itemUnitTO:"+itemTO.getItemId());
		 itemTO.setCompanyId(companyId);
		 int row = itemBO.update(itemTO);
		 System.out.println("No of rows updated:"+row);
		 return "viewItem";
	 }
	
	 @RequestMapping("/deleteItem")
	 public String deleteCityGroup(@RequestParam("itemId") String itemId)
	 {
	 System.out.println("deleteItemUnit");
	 itemBO.delete(Long.parseLong(itemId));
	 return "viewItem";
	 }
}
