package com.dkl.merchantdb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dkl.merchantdb.dao.intf.FirmDAO;
import com.dkl.merchantdb.to.FirmTO;

@Controller
@SessionAttributes({ "companyId", "financialYears", "companyList", "selectedItem" })
public class FirmController {

	@Autowired
	private FirmDAO firmDAO;
	@RequestMapping(value = "/updateFirmByAjax", method = { RequestMethod.POST })
	public String updateFirmByAjax(FirmTO firmTO){
		firmDAO.updateFirm(firmTO);
		return "updateFirmByAjax";
	}
}
