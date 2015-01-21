package com.dkl.merchantdb.interceptor;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class CheckUserInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		String requestUri = request.getRequestURI();
		System.out.println("PATH::::" + requestUri);
		HttpSession session = request.getSession();
		ServletContext ctx = session.getServletContext();

		Map<String, List<String>> map = (Map<String, List<String>>) ctx.getAttribute("rolemap");
		List<String> clerkUrlList = map.get("clerkUrlList");

		System.out.println("Roles Map::" + map);

		if (!(requestUri.equals("/merchantdb/") || requestUri.equals("/merchantdb/processLogin")
				|| requestUri.equals("/merchantdb/error") || requestUri.equals("/merchantdb/logout"))) {
			try {
				if (session.getAttribute("username") != null) {
					String role = (String) session.getAttribute("userRole");
					System.out.println("UserRole::" + role);
					if ("clerk".equals(role) && !clerkUrlList.contains(requestUri.trim())) {
						response.getWriter().write("<h1>You dont have enough previliges to view this page</h1>");
						response.sendRedirect("error");
					}
				} else {
					response.sendRedirect("/merchantdb");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}
