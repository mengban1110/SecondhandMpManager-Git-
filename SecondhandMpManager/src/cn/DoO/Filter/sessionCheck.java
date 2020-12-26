package cn.DoO.Filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * session校验Filter
 * 
 * @author 梦伴
 *
 */
public class sessionCheck implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
//		HttpServletRequest req = (HttpServletRequest) request;
//		HttpServletResponse resp = (HttpServletResponse) response;
//		
//		HttpSession session = req.getSession();
//		String path = req.getServletPath();
//		System.out.println(path);
//		
//		Object user = session.getAttribute("user");
//		
//		if ("/login.jsp".equals(path) || "/info.do".equals(path)) {
//			chain.doFilter(request, response);
//			return;
//		}else {
//			if (user == null) {
//				req.setAttribute("error", "请先登录!");
//				req.getRequestDispatcher("error.jsp").forward(req, resp);
//			}else {
//				System.out.println("session校验成功 : 放行...");
//				chain.doFilter(request, response);
//			}
//		}
//		
//		
//		chain.doFilter(req, resp);

	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

}
