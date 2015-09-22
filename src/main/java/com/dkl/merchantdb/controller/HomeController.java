package com.dkl.merchantdb.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {

	// private static final Logger logger =
	// LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	//@ExcludeClassInterceptors
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		return "login";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public String error() {
		return "error";
	}
	
	@RequestMapping(value = "/success", method = { RequestMethod.GET })
	public String success(@RequestParam("status")String status,Model model) {
		model.addAttribute("status", status);
		return "success";
	}
	
	@RequestMapping(value = "/adminSuccess", method = { RequestMethod.GET })
	public String adminSuccess(@RequestParam("status")String status,Model model) {
		model.addAttribute("status", status);
		return "adminSuccess";
	}
}
