package cn.DoO.Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class infoServlet extends HttpServlet {

	IinfoService infoService = new infoServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("TuServlet--->service()");
		String method = request.getParameter("method");
		try {
			if ("zhu".equals(method)) {
				this.zhu(request, response);
			} else if ("bing".equals(method)) {
				this.bing(request, response);
			} else if ("zhe".equals(method)) {
				this.zhe(request, response);
			}
		} catch (ClassNotFoundException e) {
			System.out.println("类没有找到异常....");
		} catch (SQLException e) {
			System.out.println("SQL异常....");
		}
	}

	private void zhe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		System.out.println("TuServlet--->zhe()");
		
		//1.取值
		List<Map<String, Object>> list_zhe=infoService.queryZhe();
		
		//2.存值
		request.setAttribute("list_zhexian", list_zhe);
		
		//3.转向
		request.getRequestDispatcher("/pages/xian.jsp").forward(request, response);
	}

	private void bing(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("TuServlet--->bing()");	
		//1.取值
		List<Map<String, Object>> list_xueli=infoService.queryXueLi();
		
		//2.存值
		request.setAttribute("list_xueli",list_xueli);
		
		//3.转向
		request.getRequestDispatcher("/pages/bing.jsp").forward(request, response);
	}

	private void zhu(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("TuServlet--->zhu()");
		
		//1.取数据
		List<Map<String, Object>> list_shouru=infoService.queryShouRu();
		List<Map<String, Object>> list_zhichu=infoService.queryZhiChu();
		List<Map<String, Object>> list_yusuan=infoService.queryYuSuan();

		//2.存值
		request.setAttribute("list_shouru",list_shouru);
		request.setAttribute("list_zhichu",list_zhichu);
		request.setAttribute("list_yusuan", list_yusuan);
		
		//3.转向
	    request.getRequestDispatcher("/pages/zhu.jsp").forward(request, response);	


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
