package com.dkl.merchantdb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dkl.merchantdb.bo.PartyBO;
import com.dkl.merchantdb.to.JsonTemplateTO;
import com.dkl.merchantdb.to.PartyTO;
import com.google.gson.Gson;

@Controller
@SessionAttributes("companyId")
public class PartyController {

	@Autowired
	PartyBO partyBO;

	@RequestMapping(value = "/createParty")
	public String createParty() {
		return "createParty";
	}

	@RequestMapping(value = "/saveParty")
	public String saveParty(PartyTO partyTO, Model model,@ModelAttribute("companyId")Long companyId) {
		partyTO.setCompanyID(companyId);
		int rowCount = partyBO.createParty(partyTO);
		if (rowCount > 0) {
			model.addAttribute("partyCreationStatus", "Company " + partyTO.getPartyName() + "has created successfully.");
		}
		return "createParty";
	}

	@RequestMapping(value = "/viewParty")
	public String viewParty() {
		return "viewParty";
	}

	@RequestMapping(value = "/viewPartyJSON")
	@ResponseBody
	public String viewPartyJSON(Model model,@ModelAttribute("companyId")Long companyId) {
		
		JsonTemplateTO jsonTemplateTO = new JsonTemplateTO();
		jsonTemplateTO.setRecordsFiltered(10);
		jsonTemplateTO.setRecordsTotal(10);
		List<PartyTO> dataList = partyBO.readAllParty(companyId);
		jsonTemplateTO.setData(dataList);
		return new Gson().toJson(jsonTemplateTO);
	}
	
	@RequestMapping(value = "/updateParty")
	public String updateParty(PartyTO partyTO){
		partyBO.update(partyTO);
		return "viewParty";
	}
}
