package cn.DoO.Controller.Manager.Mpinfo;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 商品 function接口
 * @author 梦伴
 *
 */
public class MpinfoServlet extends HttpServlet {
	
	// service对象
	MpinfoService mpinfoService = new MpinfoServiceImpl();

	// session对象
	HttpSession session;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		try {
			if ("queryAll".equals(method)) {
				this.queryAll(request, response);//查询所有
			}else if ("del".equals(method)) {
				this.del(request, response);//选中删除
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 删除选中
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws FileNotFoundException 
	 * @throws ClassNotFoundException 
	 * @throws ServletException 
	 */
	private void del(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException, ServletException {
		// TODO Auto-generated method stub
		String[] delArr = request.getParameterValues("checkboxzz");
		mpinfoService.delArr(delArr);
		this.queryAll(request, response);
	}

	/**
	 * 查询全部
	 * @param request
	 * @param response
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void queryAll(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		// TODO Auto-generated method stub
		List<Map<String, Object>> queryAllList = mpinfoService.queryAll();
		request.setAttribute("queryAllList", queryAllList);
		request.getRequestDispatcher("/Pages/manager/Tables.jsp").forward(request, response);
	}


}
