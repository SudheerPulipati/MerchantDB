package com.dkl.merchantdb.listener;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dkl.merchantdb.bo.UrlMappingsBO;

/**
 * Application Lifecycle Listener implementation class AppContextListener
 *
 */
public class AppContextListener implements ServletContextListener {

	private static ApplicationContext context = new ClassPathXmlApplicationContext("../spring/root-context.xml");

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		ServletContext servletContext = servletContextEvent.getServletContext();
		System.out.println("application context::" + context);
		UrlMappingsBO urlMappingsBO = (UrlMappingsBO) context.getBean("urlMappingsBO");
		Map<String, List<String>> rolemap = urlMappingsBO.readAllUrlMappings();
		System.out.println("cashbookreportBO::" + urlMappingsBO.readAllUrlMappings());
		servletContext.setAttribute("rolemap", rolemap);

	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent servletContextEvent) {
		System.out.println("Database connection closed for Application.");
	}

}
