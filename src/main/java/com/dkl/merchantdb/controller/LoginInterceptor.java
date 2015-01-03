package com.dkl.merchantdb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest request,HttpServletResponse response, Object arg2, Exception arg3)	throws Exception {
	}


	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,Object arg2, ModelAndView arg3) throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object arg2) throws Exception {
		 if( !request.getRequestURI().equals("/merchantdb/") && 
			 !request.getRequestURI().equals("/merchantdb/login") && 
			 !request.getRequestURI().equals("/merchantdb/processLogin"))
		  {
			   Long companyId = (Long) request.getSession().getAttribute("companyId");
			   if(companyId == null)
			   {
				 System.out.println("===========redirecting to login page as session invalidated");  
			     response.sendRedirect("/merchantdb/");
			    return false;
			   }   
		  }
		 return true;
	}
}
