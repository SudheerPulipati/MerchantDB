package com.dkl.merchantdb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/logout")
public class LogoutController {

  @RequestMapping(method=RequestMethod.GET)
  public String logout(HttpSession session) {
	System.out.println("You have been successfully logged out");
    session.invalidate();
    return "login";
  }
}