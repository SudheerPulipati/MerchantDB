package com.dkl.merchantdb.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.swing.text.TableView;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dkl.merchantdb.bo.CompanyBO;
import com.dkl.merchantdb.to.CompanyTO;
import com.google.gson.Gson;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	@Autowired
	private CompanyBO companyBO;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/")
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
				DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@RequestMapping(value = "/createCompany")
	public String createCompany(Locale locale, Model model) {

		// model.addAttribute("serverTime", formattedDate );
		System.out.println("createCompany");
		return "createCompany";
	}

	@RequestMapping(value = "/saveCompany")
	public String saveCompany(CompanyTO companyTO, Model model) {
		System.out.println(companyTO);
		System.out.println(companyTO.getCity());
		System.out.println(companyTO.getCompanyName());
		int rowCount = companyBO.createCompany(companyTO);
		if (rowCount > 0) {
			model.addAttribute("companyCreationStatus",
					"Company " + companyTO.getCompanyName()
							+ "has created successfully.");
		}
		return "createCompany";
	}

	@RequestMapping(value = "/viewCompany")
	//@ResponseBody
	public String viewCompany(Model model) {
		System.out.println("viewCompany");
		List<CompanyTO> companyTOs = companyBO.viewCompany();
		Gson gson = new Gson();
		gson.toJson(companyTOs);
		return "viewCompany";
	}

	@RequestMapping(value = "/viewCompanyJSON")
	@ResponseBody
	public String viewCompanyJSON(Model model) {
		System.out.println("viewCompanyJSON");
		List<CompanyTO> companyTOs = companyBO.viewCompany();
		Gson gson = new Gson();
		return gson.toJson(companyTOs);
	}
}
