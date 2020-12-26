package cn.DoO.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.DoO.Utils.CodeUtils;
import cn.DoO.Utils.EmailUtils;

public class EmailController extends HttpServlet {

	IEmailController EmailControllerService = new EmailControllerService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String method = request.getParameter("method");
		try {
			if ("register".equals(method)) {
				this.register(request, response);
			} else if ("validation".equals(method)) {
				this.validation(request, response);
			} else if ("sendImage".equals(method)) {
				this.sendImage(request, response);
			} else if ("sendFile".equals(method)) {
				this.sendFile(request, response);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void sendFile(HttpServletRequest request, HttpServletResponse response) throws MessagingException, ServletException, IOException {
		// TODO Auto-generated method stub
		// 1.接值
		String receiver = request.getParameter("receiver");
		String emailText = request.getParameter("emailText");
		String fileUrl = request.getParameter("fileUrl");
		String emailSubject = request.getParameter("emailSubject");
		System.out.println(" receiver:" + receiver);
		System.out.println(" emailText:" + emailText);
		System.out.println(" fileUrl:" + fileUrl);
		System.out.println(" emailSubject:" + emailSubject);

		// 2.发送带附件的邮件
		EmailUtils.createMimeMessage2(receiver, emailSubject, emailText, fileUrl);

		// 3.转向
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	private void sendImage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, MessagingException {
		// TODO Auto-generated method stub
		String receiver = request.getParameter("receiver");// 收件人
		String emailText = request.getParameter("emailText");// 邮件内容
		String imageUrl = request.getParameter("imageUrl");// 图片地址
		String emailSubject = request.getParameter("emailSubject");// 邮件主题
		System.out.println(" receiver:" + receiver);
		System.out.println(" emailText:" + emailText);
		System.out.println(" imageUrl:" + imageUrl);
		System.out.println(" emailSubject:" + emailSubject);
		// 2.发送带图片的邮件
		EmailUtils.createMimeMessage(receiver, emailSubject, emailText, imageUrl);

		// 3.转向
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	private void validation(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		System.out.println("EmailController--->validation()...");

		String ucode = request.getParameter("ucode");
		Map<String, Object> map = EmailControllerService.queryCode(ucode);
		if (map == null) {
			String errorMessage = "验证码错误";
			request.setAttribute("error", errorMessage);
			request.getRequestDispatcher("/jsps/manage/user/error.jsp").forward(request, response);
		} else {
			EmailControllerService.updateUstate(ucode);
			request.setAttribute("message", "恭喜您,激活成功!");
			request.getRequestDispatcher("/jsps/manage/user/success.jsp").forward(request, response);
		}

	}

	private void register(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException,
			FileNotFoundException, SQLException, IOException, MessagingException, ServletException {
		// TODO Auto-generated method stub
		System.out.println("EmailController--->register()...");

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String code = CodeUtils.createCode();

		EmailControllerService.register(username, password, email, code);

		EmailUtils.createMimeMessage(request, email, code);

		request.setAttribute("message", "恭喜您,注册成功,我们已经发了一封带注册信息的电子邮件,请注意查收");

		request.getRequestDispatcher("/jsps/manage/user/success.jsp").forward(request, response);

	}

}
