package cn.hbsi.login;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import cn.hbsi.entity.bevisit;
import cn.hbsi.utils.ExcelUtils;

public class historyServlet extends HttpServlet {

	IhistoryService historyService = new historyServiceImpl();
	ExcelUtils excel = new ExcelUtils();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method = request.getParameter("method");
		try {
			if ("queryAllandAdd".equals(method)) {
				this.queryAllandAdd(request, response);
			} else if ("queryAll".equals(method)) {
				this.queryAll(request, response);
			} else if ("queryAll_ajax".equals(method)) {
				this.queryAll_ajax(request, response);
			} else if ("del".equals(method)) {
				this.del(request, response);
			} else if ("editPage".equals(method)) {
				this.editPage(request, response);
			} else if ("edit".equals(method)) {
				this.edit(request, response);
			} else if ("makeExcel".equals(method)) {
				this.makeExcel(request, response);
			} else if ("query_ss".equals(method)) {
				this.query_ss(request, response);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void query_ss(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		// TODO Auto-generated method stub
		String bevisit = request.getParameter("bevisit");
		List<Map<String, Object>> map = historyService.query_ss(bevisit);
		request.setAttribute("infoList", map);
		request.getRequestDispatcher("/pages/history.jsp").forward(request, response);
	}

	private void queryAll_ajax(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		System.out.println("historyServlet...queryAll_ajax()");
		
		String bevisit = request.getParameter("bevisit");
		
		System.out.println(bevisit);
		
		bevisit obj = new bevisit();
		List<Map<String, Object>> infoList = historyService.queryAll();
		for (Map<String, Object> map : infoList) {
			String bevisitz = (String) map.get("bename");
			String besexz = (String) map.get("besex");
			String bephonez = (String) map.get("bephone");
			if (bevisit.equals(bevisitz)) {
				obj.setName(bevisitz);
				obj.setSex(besexz);
				obj.setPhone(bephonez);
				break;
			}
		}
		
		PrintWriter out = response.getWriter();
		String jsonOut = jsonOut(obj);
		out.write(jsonOut);
		out.flush();
		out.close();
		
	}

	private void makeExcel(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		System.out.println("historyServlet...makeExcel()");

		String filename = "来访者信息.xls";
		excel.settings(request, response, filename);

		List<Map<String, Object>> list_examinee = historyService.queryAll();

		HSSFWorkbook workbook = new HSSFWorkbook();
		String sheetname = "来访者信息";
		HSSFSheet sheet = workbook.createSheet(sheetname);

		String[] tableTop = { "visit", "bevisit", "time"};
		String[] columnName ={ "vname", "bename", "time"};

		HSSFRow row = sheet.createRow(0);
		for (int i = 0; i < tableTop.length; i++) {
			row.createCell(i).setCellValue(tableTop[i]);
		}

		for (int i = 0; i < list_examinee.size(); i++) {
			HSSFRow row2 = sheet.createRow(i + 1);
			Map<String, Object> map = list_examinee.get(i);
			for (int j = 0; j < columnName.length; j++) {
				row2.createCell(j).setCellValue((String) map.get(columnName[j]));
			}
		}

		excel.setColumnAutoAdapter(sheet, list_examinee.size());

		OutputStream out = response.getOutputStream();
		workbook.write(out);
		out.close();

	}

	private void edit(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, FileNotFoundException, SQLException, IOException, ServletException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String visit = request.getParameter("visit");
		String bevisit = request.getParameter("bevisit");
		String nowTime = request.getParameter("time");

		historyService.update(id, visit, bevisit, nowTime);
		this.queryAll(request, response);
	}

	private void editPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		System.out.println("historyServlet...editPage()");

		String id = request.getParameter("id");
		Map<String, Object> map = historyService.queryOne(id);

		request.setAttribute("id", id);
		request.setAttribute("infoMapzz", map);

		request.getRequestDispatcher("/pages/edit.jsp").forward(request, response);
	}

	private void del(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, FileNotFoundException, SQLException, IOException, ServletException {
		// TODO Auto-generated method stub
		System.out.println("historyServlet...del()");

		String[] checkBoxArr = request.getParameterValues("checkBox");

		System.out.println("要删除的IDs :");
		for (String id : checkBoxArr) {
			System.out.print(id + "\t");
		}

		historyService.del(checkBoxArr);
		this.queryAll(request, response);
	}

	private void queryAll(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, FileNotFoundException, SQLException, IOException, ServletException {
		// TODO Auto-generated method stub
		System.out.println("historyServlet...queryAll()");
		List<Map<String, Object>> infoList = historyService.queryAll();
		request.setAttribute("infoList", infoList);
		request.getRequestDispatcher("/pages/history.jsp").forward(request, response);
	}

	private void queryAllandAdd(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, FileNotFoundException, SQLException, IOException, ServletException {
		// TODO Auto-generated method stub
		System.out.println("historyServlet...queryAllandAdd()");

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss ");
		String nowTime = sdf.format(date);
		String id = request.getParameter("id");
		String visit = request.getParameter("visit");
		String bevisit = request.getParameter("bevisit");

		int result = historyService.add(id,visit, bevisit, nowTime);
		if (result != 0) {
			System.out.println(visit + "  visit " + bevisit + "  in " + nowTime);
			request.getRequestDispatcher("/pages/history.do?method=queryAll").forward(request, response);
		}
	}
	
	
	public String jsonOut(Object obj) throws JsonGenerationException, JsonMappingException, IOException{
		//初始化Jackson包中解析json的核心类
		ObjectMapper om=new ObjectMapper();
		String json = om.writeValueAsString(obj);
	    return json;
	}

}
