package cn.hbsi.listener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionListener implements HttpSessionListener {

	public SessionListener() {
		System.out.println("SessionListener加载了");
	}

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		String id = se.getSession().getId();
		System.out.println("session已经创建 且sessionID : " + id);

		ServletContext sc = se.getSession().getServletContext();
		Integer numSessions = (Integer) sc.getAttribute("numSessions");

		if (numSessions == null) {
			numSessions = new Integer(1);
		} else {
			int count = numSessions.intValue();
			numSessions = new Integer(count + 1);
		}

		sc.setAttribute("numSessions", numSessions);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		ServletContext sc = se.getSession().getServletContext();
		Integer numSessions = (Integer) sc.getAttribute("numSessions");

		if (numSessions == null) {
			numSessions = new Integer(0);
		} else {
			int count = numSessions.intValue();
			numSessions = new Integer(count - 2);
		}
		
		sc.setAttribute("numSessions", numSessions);

	}

}
