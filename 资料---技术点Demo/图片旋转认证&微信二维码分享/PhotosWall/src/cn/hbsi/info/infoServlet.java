package cn.hbsi.info;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

import com.alibaba.fastjson.JSON;

import cn.hbsi.dao.Dao;
import cn.hbsi.qrcode.qrcodeentity;

public class infoServlet extends HttpServlet {

	IinfoService infoService = new infoServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		ServletContext sc = getServletContext();
		Object attribute = sc.getAttribute("map");
		System.out.println(attribute);
		try {
			if ("upload".equals(method)) {
				this.upload(request, response);
			} else if ("download".equals(method)) {
				this.download(request, response);
			} else if ("queryAll".equals(method)) {
				this.queryAll(request, response);
			} else if ("del".equals(method)) {
				this.del(request, response);
			} else if ("share".equals(method)) {
				this.share(request, response);
			} else if ("login".equals(method)) {
				this.login(request, response);
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
	 * 登录验证
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws FileNotFoundException 
	 * @throws ClassNotFoundException 
	 * @throws ServletException 
	 */
	private void login(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException, ServletException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Map<String, Object> login = infoService.login(username,password);
		if (login == null) {
			request.setAttribute("error", "账号或密码错误!!");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("user", login);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

	/**
	 * 生成微信二维码
	 * @param request
	 * @param response
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ServletException
	 * @throws IOException
	 */
	private void share(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		// TODO Auto-generated method stub
		String path = this.getServletContext().getRealPath("/") + "WEB-INF/images/code.png";// 二维码保存路径
		if (!new File(path).exists()) {
			new File(this.getServletContext().getRealPath("/") + "WEB-INF/images/").mkdir();
		}
        // 跳转的内容，如果http://则当做文字处理
        String content = request.getRequestURL()+"?method=queryAll";
        System.out.println(content);
        
        // 创建封装类
        qrcodeentity assis = new qrcodeentity(path, content);
        boolean result =  assis.createCode(530, 530);
        if (result) {
            System.out.println("二维码生成成功！");

            List<Map<String, Object>> queryAll = infoService.queryAll();
    		request.setAttribute("info", queryAll);
            request.setAttribute("share", "1");
    		request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            System.out.println("二维码生成失败！");
        }
        
        
	}

	/**
	 * 删除图片
	 * @param request
	 * @param response
	 * @throws ClassNotFoundException
	 * @throws FileNotFoundException
	 * @throws SQLException
	 * @throws IOException
	 * @throws ServletException
	 */
	private void del(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException, ServletException {
		// TODO Auto-generated method stub
		String[] checkBoxArr = request.getParameterValues("checkbox");
		System.out.println("要删除的IDs :");
		for (String id : checkBoxArr) {
			System.out.print(id + "\t");
		}

		infoService.del(checkBoxArr);
		this.queryAll(request, response);
	}

	/**
	 * 查询所有
	 * @param request
	 * @param response
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ServletException
	 * @throws IOException
	 */
	private void queryAll(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		// TODO Auto-generated method stub
		List<Map<String, Object>> queryAll = infoService.queryAll();
		request.setAttribute("info", queryAll);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * 下载图片
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void download(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("imgpath");

		String path = this.getServletContext().getRealPath("/") + "WEB-INF/images/";

		File file = new File(path + name);
		FileInputStream fileInputStream = new FileInputStream(file);

		response.setContentType("image/jpg");
		response.setHeader("Access-Control-Allow-Origin", "*");

		IOUtils.copy(fileInputStream, response.getOutputStream());

	}

	/**
	 * 上传图片
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws ServletException
	 */
	private void upload(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");

		String saveName = null;
		String filePath = request.getParameter("up");
		String path = this.getServletContext().getRealPath("/") + "WEB-INF/images";
		System.out.println("图片的路径 : " + path);

		File file = new File(filePath);

		if ((file.isFile()) && (file.exists())) {
			String name = file.getName();
			System.out.println("本次上传的名字为..." + name);
			String suffix = name.substring(name.lastIndexOf(".") + 1);
			System.out.println("本次上传的后缀为..." + suffix);
			String id = UUID.randomUUID().toString();
			saveName = id + "." + suffix;

			DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
			ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
			servletFileUpload.setHeaderEncoding("utf-8");

			FileInputStream fileInputStream = new FileInputStream(file);
			File file2 = new File(path + "/" + saveName);
			FileUtils.copyInputStreamToFile(fileInputStream, file2);
		}
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String time = sdf.format(date);
		
		infoService.save(saveName,time);
		this.queryAll(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
