package com.dkl.merchantdb.interceptor;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class CheckUserInterceptor implements  HandlerInterceptor{

	@Autowired
	Map<String, List<String>> urlAccessDetailMap;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		 System.out.println("PATH : "+request.getRequestURI());
		 System.out.println("URL PROPERTY:"+urlAccessDetailMap.get("admin").get(0));
		 String excludedURI = request.getRequestURI();
		 if(excludedURI.equals("/merchantdb/")||excludedURI.equals("/merchantdb/processLogin")){
			 
		 }else{
			 try{
					String userID = request.getSession().getAttribute("username").toString();
					if(StringUtils.isEmpty(userID)){
					}else{
					}
				}catch(NullPointerException exception){
					response.sendRedirect("/merchantdb");
				}
		 }
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
