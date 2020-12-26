package cn.hbsi.listener;

import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MyLicenesListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
	
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		System.out.println("servlet初始化");
		System.out.println("加载数据...");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("username", "root");
		map.put("password", "root");
		
		ServletContext servletContext = sce.getServletContext();
		servletContext.setAttribute("map", map);
		
		System.out.println("加载成功");
	}

}
