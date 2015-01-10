package com.dkl.merchantdb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dkl.merchantdb.bo.CityGroupBO;
import com.dkl.merchantdb.bo.LedgGroupBO;
import com.dkl.merchantdb.bo.PartyBO;
import com.dkl.merchantdb.to.CityGroupTO;
import com.dkl.merchantdb.to.JsonTemplateTO;
import com.dkl.merchantdb.to.LedgGroupTO;
import com.dkl.merchantdb.to.PartyTO;
import com.google.gson.Gson;

@Controller
@SessionAttributes("companyId")
public class PartyController {

	@Autowired
	private PartyBO partyBO;

	@Autowired
	private LedgGroupBO ledgGroupBO;

	@Autowired
	private CityGroupBO cityGroupBO;

	@RequestMapping(value = "/createParty")
	public String createParty(Model model, @ModelAttribute("companyId") Long companyId) {
		List<LedgGroupTO> ledgerGrpList = ledgGroupBO.readAllByFK(companyId);
		List<CityGroupTO> cityGrpList = cityGroupBO.readAllByFK(companyId);
		model.addAttribute("ledgerGroupList", ledgerGrpList);
		model.addAttribute("cityGroupList", cityGrpList);
		return "createParty";
	}

	@RequestMapping(value = "/saveParty")
	public String saveParty(PartyTO partyTO, @ModelAttribute("companyId") Long companyId,
			RedirectAttributes redirectAttributes) {
		partyTO.setCompanyID(companyId);
		int rowCount = partyBO.createParty(partyTO);
		if (rowCount > 0) {
			redirectAttributes.addAttribute("status", "Party " + partyTO.getPartyName()
					+ " has been created successfully.");
		}
		return "redirect:success";
	}

	@RequestMapping(value = "/viewParty")
	public String viewParty() {
		return "viewParty";
	}

	@RequestMapping(value = "/viewPartyJSON")
	@ResponseBody
	public String viewPartyJSON(Model model, @ModelAttribute("companyId") Long companyId) {

		JsonTemplateTO jsonTemplateTO = new JsonTemplateTO();
		jsonTemplateTO.setRecordsFiltered(10);
		jsonTemplateTO.setRecordsTotal(10);
		List<PartyTO> dataList = partyBO.readAllParty(companyId);
		jsonTemplateTO.setData(dataList);
		return new Gson().toJson(jsonTemplateTO);
	}

	@RequestMapping(value = "/updateParty")
	public String updateParty(PartyTO partyTO) {
		partyBO.update(partyTO);
		return "viewParty";
	}

	@RequestMapping(value = "/deleteParty")
	public String deleteParty(PartyTO partyTO) {
		partyBO.delete(partyTO.getPartyID());
		return "viewParty";
	}
}
