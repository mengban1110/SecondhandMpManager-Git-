package cn.DoO.Controller.Manager.LoginRegister;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;

import cn.DoO.Controller.Manager.LoginRegister.JsonPojo.JsonUtils;
import cn.DoO.Controller.Manager.LoginRegister.JsonPojo.Message;
import cn.DoO.Utils.CodeUtils;
import cn.DoO.Utils.EmailUtils;

/**
 * 登录或注册 function接口
 * 
 * @author 梦伴
 * 
 */
public class LoginRegisterServlet extends HttpServlet {

	// service对象
	LoginRegisterService loginRegisterService = new LoginRegisterServiceImpl();

	// session对象
	HttpSession session;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		try {
			if ("login".equals(method)) {// 登录
				this.login(request, response);
			} else if ("register".equals(method)) {// 注册
				this.register(request, response);
			} else if ("activity".equals(method)) {// 激活
				this.activity(request, response);
			} else {
				// 3.实例化json储存对象
				Message message = new Message();

				// 4.设置json数据
				message.setMsg("请求错误");
				message.setCode(4);

				// 将json结果写入respon并返回
				JsonUtils.writeJson(response, message);
			}
		} catch (ClassNotFoundException e) {
			System.out.println("类错误");
		} catch (SQLException e) {
			System.out.println("sql异常");
		} catch (MessagingException e) {
			System.out.println("邮件发送异常");
		}
	}

	/**
	 * 激活
	 * 
	 * @param request
	 * @param response
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 * @throws IOException
	 * @throws JsonMappingException
	 * @throws JsonGenerationException
	 */
	private void activity(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, JsonGenerationException, JsonMappingException, IOException {
		response.setContentType("text/html;charset=utf-8");// 修改为utf-8

		// 1.接值
		String nickname = request.getParameter("registerName");
		String code = request.getParameter("registerKey");

		// 2.调用接口验证用户输入的验证码是否存在于数据库当中
		Map<String, Object> map = loginRegisterService.activity(code);

		// 3.实例化json储存对象
		Message message = new Message();

		if (map == null) {// 如果map的值为null，说明用户输入的验证码不存在于数据库当中，则直接设置json值并返回给前端页面

			// 4.设置json数据
			message.setMsg("此激活码不存在");
			message.setCode(2);
			message.setName(nickname);

			// 将json结果写入respon并返回
			JsonUtils.writeJson(response, message);

		} else {// 如果map的值不为null，说明用户输入的验证码存在于数据库当中，则把用户输入的昵称存入数据库当中

			if ("1".equals(String.valueOf(map.get("manager_status")))) {
				// 4.设置json数据
				message.setMsg("此激活码已使用!");
				message.setCode(3);

				// 将json结果写入respon并返回
				JsonUtils.writeJson(response, message);

				return;
			}

			// 5.调用接口实现将用户输入的昵称写入到数据库
			loginRegisterService.saveManagername(nickname, code);
			System.out.println("成功写入到数据库");

			// 6.设置json数据
			message.setMsg("恭喜您,激活成功");
			message.setCode(1);
			message.setName(nickname);

			// 将json结果写入respon并返回
			JsonUtils.writeJson(response, message);
		}

	}

	/**
	 * 注册
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws SQLException
	 * @throws FileNotFoundException
	 * @throws ClassNotFoundException
	 * @throws MessagingException
	 */
	private void register(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, FileNotFoundException, SQLException, IOException, MessagingException {
		response.setContentType("text/html;charset=utf-8");// 修改为utf-8

		// 1.接受添加页面的注册信息
		String username = request.getParameter("registerUsername");
		String password = request.getParameter("registerPassword");
		String email = request.getParameter("registerEmail");
		String code = CodeUtils.createdCode();// 调用注册码工具类产生注册码

		// 2.调用接口验证用户输入的邮箱是否存在于数据库当中
		Map<String, Object> map = loginRegisterService.queryByEamil(email);

		// 3.实例化json储存对象
		Message message = new Message();

		boolean flag = false;

		if (map == null) {// 如果数据库中没有用户所输入的邮箱，则把用户输入的信息存入数据库并发送邮件，设置json值并返回给前端页面

			// 5.发送邮件 线程发邮件 否则会响应时间过长 体验差
			try {
				EmailUtils.createMimeMessage(request, email, code);
			} catch (UnsupportedEncodingException | MessagingException e) {

				message.setMsg("系统异常 邮件发送失败");
				message.setCode(3);

				// 将json结果写入respon并返回
				JsonUtils.writeJson(response, message);

				return;
			}
			// 4.存值
			loginRegisterService.register(username, password, email, code);// 将该新用户的信息添加到数据库中
			System.out.println("存值成功");

			// 6.设置json数据
			message.setMsg("邮件发送成功");
			message.setCode(1);

			// 将json结果写入respon并返回
			JsonUtils.writeJson(response, message);

		} else {// 如果数据库中有用户所输入的邮箱，则直接设置json值并返回给前端页面

			// 6.设置json数据
			message.setMsg("此用户已经被注册,注册失败");
			message.setCode(2);

			// 将json结果写入respon并返回
			JsonUtils.writeJson(response, message);
		}

	}

	/**
	 * 登录
	 * 
	 * @param request
	 * @param response
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 * @throws IOException
	 */
	private void login(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, IOException {
		System.out.println("LoginRegisterServlet--->login()");
		response.setContentType("text/html;charset=utf-8");// 修改为utf-8

		// 获取账号密码参数
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println("name:" + username);
		System.out.println("pass:" + password);

		// 登录结果
		Map<String, Object> map = loginRegisterService.login(username, password);

		// json储存对象
		Message message = new Message();

		if (map == null) {
			System.out.println("登录失败");

			// 设置json数据
			message.setMsg("登录失败,账号密码错误");
			message.setCode(2);

			// 将json结果写入respon并返回
			JsonUtils.writeJson(response, message);

		} else {
			if ("2".equals(String.valueOf(map.get("manager_status")))) {// 判断是否被激活
				message.setMsg("登录失败,该账户未激活!");
				message.setCode(3);

				// 设置json数据
				JsonUtils.writeJson(response, message);
				return;
			}
			System.out.println("登录成功了");

			// 设置session值
			session = request.getSession();
			session.setAttribute("user", map);
			String sessionId = session.getId();
			System.out.println("sessionId:" + sessionId);

			// 查询nickname
			Map<String, Object> manager = loginRegisterService.queryByname(username);

			// 设置json数据
			message.setMsg("登录成功");
			message.setCode(1);
			message.setName(String.valueOf(manager.get("manager_nickname")));

			// 将json结果写入respon并返回
			JsonUtils.writeJson(response, message);

		}
	}

}
