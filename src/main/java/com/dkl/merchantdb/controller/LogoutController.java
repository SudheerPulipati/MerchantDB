package com.dkl.merchantdb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@RequestMapping("/logout")
public class LogoutController {

	@RequestMapping
	public String logout(SessionStatus sessionStatus,HttpSession session) {
		sessionStatus.setComplete();
		session.invalidate();
		return "login";
	}
}