package com.dkl.merchantdb.controller;

import java.util.List;

import javax.interceptor.ExcludeClassInterceptors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dkl.merchantdb.bo.CompanyBO;
import com.dkl.merchantdb.bo.UserLoginBO;
import com.dkl.merchantdb.to.UserLoginTO;

@Controller
@SessionAttributes({ "username", "companyList" })
public class UserLoginController {

	@Autowired
	private UserLoginBO userLoginBO;

	@Autowired
	private CompanyBO companyBO;
	
	@ExcludeClassInterceptors
	@RequestMapping(value = "/processLogin")
	public String processLogin(UserLoginTO userLoginTO, Model model) {
		System.out.println("userLoginController" + userLoginTO.getUsername());
		String viewName = null;
		UserLoginTO userLoginResponse = userLoginBO.getUserInfo(userLoginTO.getUsername(), userLoginTO.getPassword());
		if (userLoginResponse != null) {
			List<String> userRoles = userLoginBO.getUserRoles(userLoginResponse.getUserID());
//			session.setAttribute("username", userLoginTO.getUsername());
//			session.setAttribute("companyList", companyBO.viewCompanyList());
			model.addAttribute("username", userLoginTO.getUsername());
			if (userRoles.contains("admin")) {
				model.addAttribute("companyList", companyBO.viewCompanyList());
				viewName = "home";
			} else{
				viewName = "home";
			}

		} else {
			viewName = "login";
			model.addAttribute("error", "Invalid Credentials");
		}
		return viewName;
	}

//	@RequestMapping(value = "/logout")
//	public String logout(HttpServletRequest request) {
//		System.out.println("You have been successfully logged out");
//		HttpSession session = request.getSession(false);
//	    session.invalidate();
//		//request.getSession().setAttribute("username", null);
//		//request.getSession().removeAttribute("username");
//		return "login";
//	}
}
