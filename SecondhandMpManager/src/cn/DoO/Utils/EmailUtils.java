package cn.DoO.Utils;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;

/**
 * 邮件发送工具类
 * 
 * @author 梦伴
 *
 */
public class EmailUtils {
	// 自己的邮箱
	public static String sendEmailAccount = "a421028879@163.com";
	// 邮箱授权码
	public static String sendEmailPwd = "EKYLXGFWRLKHKZWZ";
	// 收件人邮箱
	public static String receiveMailAccount = "421028879@qq.com";

	/**
	 * @desc 1.自定义方法--发送简单的包含文件的邮件
	 * @param sendMail：发送者的邮箱
	 * @param receiveMail：收件人的邮箱
	 * @throws MessagingException
	 * @throws UnsupportedEncodingException
	 */
	public static void createMimeMessage(String sendMail, String receiveMail)
			throws UnsupportedEncodingException, MessagingException {
		Session session = getSession();

		// 3. 创建一封邮件
		MimeMessage message = new MimeMessage(session);

		// 4.发件人
		message.setFrom(new InternetAddress(sendMail, "发件人的昵称：马师傅", "UTF-8"));

		// 5.收件人
		message.setRecipient(RecipientType.TO, new InternetAddress(receiveMail, "接受者：xx用户", "UTF-8"));
		message.setRecipient(RecipientType.CC, new InternetAddress(sendEmailAccount, "抄送给自己的", "utf-8"));
		// 6.设定主题
		message.setSubject("河北盛达科技有限公司财务审批", "UTF-8");

		// 7.设定正文
		message.setContent("正文...请审批", "text/html;charset=utf-8");

		saveAndSendEmail(session, message);

	}

	/**
	 * @desc 4.将发送邮件的第8-13步封装为一个函数
	 * @param session
	 * @param message
	 * @throws MessagingException
	 * @throws NoSuchProviderException
	 */
	public static void saveAndSendEmail(Session session, MimeMessage message)
			throws MessagingException, NoSuchProviderException {
		// 8.设定发送的时间
		message.setSentDate(new Date());

		// 9.保存设置
		message.saveChanges();

		// 10.根据session获取邮件发送对象transport
		Transport transport = session.getTransport();

		// 11.连接上SMTP邮件发送的服务器基站
		transport.connect(sendEmailAccount, sendEmailPwd);

		// 12.发送邮件
		transport.sendMessage(message, message.getAllRecipients());

		// 13.关闭连接
		transport.close();
	}

	/**
	 * @desc 3.将前两步的代码封装为一个方法，目的是为了获取到session对象，进而实现发送邮件
	 * @return
	 */
	public static Session getSession() {
		// 1. 创建参数配置, 用于连接邮件服务器的参数配置
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "smtp");// 使用的协议（JavaMail规范要求）
		props.setProperty("mail.smtp.host", "smtp.163.com"); // 发件人的邮箱的 SMTP
																// 服务器地址
		props.setProperty("mail.smtp.auth", "true"); // 需要请求认证

		// 2. 根据配置创建会话对象, 用于和邮件服务器交互
		Session session = Session.getInstance(props);
		session.setDebug(true); // 设置为debug模式, 可以查看详细的发送 log
		return session;
	}

	/**
	 * @desc 2.发送带有验证码的邮件
	 * @param request
	 * @param email
	 * @param ucode
	 * @throws MessagingException
	 * @throws UnsupportedEncodingException
	 * @throws Exception
	 */
	public static void createMimeMessage(HttpServletRequest request, String email, String ucode)
			throws UnsupportedEncodingException, MessagingException {

		// 1.获取项目的路径
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
				+ "/";

		// 2.获取session
		Session session = EmailUtils.getSession();

		// 3. 创建一封邮件
		MimeMessage message = new MimeMessage(session);

		// 4. From: 发件人（昵称有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改昵称）
		message.setFrom(new InternetAddress(sendEmailAccount, "DreamofOriginal", "UTF-8"));

		// 5. To: 收件人（可以增加多个收件人、抄送、密送）
		// CC:抄送人，BCC:密送
		message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(email, "Hello new Manager", "UTF-8"));

		// 6. Subject: 邮件主题（标题有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改标题）
		message.setSubject("二手机交易市场---后台管理系统---激活 ", "UTF-8");

		// 7. Content: 邮件正文
		String context = "<div>激活验证码:<a href='" + basePath + "Pages/activity/activity.jsp'>" + basePath
				+ "Pages/activity/activity.jsp</a>，且验证码为：" + ucode + "</div>";
		message.setContent(context, "text/html;charset=UTF-8");

		// 8.保存和发送邮件
		saveAndSendEmail(session, message);
	}

	/**
	 * @desc 5.发送带有图片的邮件
	 * @param receiver
	 * @param emailSubject
	 * @param emailText
	 * @param imageUrl
	 * @throws MessagingException
	 * @throws UnsupportedEncodingException
	 */
	public static void createMimeMessage(String receiver, String emailSubject, String emailText, String imageUrl)
			throws UnsupportedEncodingException, MessagingException {

		Session session = EmailUtils.getSession();
		// 3. 创建一封邮件
		MimeMessage message = new MimeMessage(session);

		// 4. From: 发件人（昵称有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改昵称）
		message.setFrom(new InternetAddress(sendEmailAccount, "DreamofOriginal", "UTF-8"));

		// 5. To: 收件人（可以增加多个收件人、抄送、密送）
		// CC:抄送人，BCC:密送
		message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiver, "Hello new Manager", "UTF-8"));
		message.setRecipient(MimeMessage.RecipientType.CC, new InternetAddress(sendEmailAccount, "抄送给自己的", "utf-8"));

		// 6. Subject: 邮件主题（标题有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改标题）
		message.setSubject(emailSubject, "UTF-8");

		// 7. Content: 邮件正文（可以使用html标签）（内容有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改发送内容）
		MimeBodyPart txt = new MimeBodyPart();
		// 要显示图片就用content不要用text datahandler指向的资源 要加上cid:前缀 不然不显示
		txt.setContent("" + emailText + ":这是一张图片\n<img src='cid:c.png' />", "text/html;charset=UTF-8");
		MimeBodyPart img = new MimeBodyPart();
		DataHandler dh = new DataHandler(new FileDataSource(imageUrl));
		img.setDataHandler(dh);
		img.setContentID("c.png");
		MimeMultipart multipart = new MimeMultipart();
		multipart.addBodyPart(txt);
		multipart.addBodyPart(img);
		multipart.setSubType("related");
		message.setContent(multipart);

		// 8.保存和发送
		saveAndSendEmail(session, message);

	}

	/**
	 * @desc 6.发送带附件的邮件
	 * @param receiver
	 * @param emailSubject
	 * @param emailText
	 * @param fileUrl
	 * @throws MessagingException
	 * @throws UnsupportedEncodingException
	 */
	public static void createMimeMessage2(String receiver, String emailSubject, String emailText, String fileUrl)
			throws UnsupportedEncodingException, MessagingException {

		Session session = EmailUtils.getSession();
		// 3. 创建一封邮件
		MimeMessage message = new MimeMessage(session);

		// 4. From: 发件人（昵称有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改昵称）
		message.setFrom(new InternetAddress(sendEmailAccount, "DreamofOriginal", "UTF-8"));

		// 5. To: 收件人（可以增加多个收件人、抄送、密送）
		message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiver, "Hello new Manager", "UTF-8"));

		// 6. Subject: 邮件主题（标题有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改标题）
		message.setSubject(emailSubject, "UTF-8");

		// 7.处理附件（文本+附件）
		// 7.1先将文本的内容加入到mimebodypart中
		MimeBodyPart txt = new MimeBodyPart();
		txt.setContent(emailText, "text/html;charset=UTF-8");

		// 7.2设定附件
		MimeBodyPart attachment = new MimeBodyPart();
		// 1）读取本地文件
		DataHandler dh2 = new DataHandler(new FileDataSource(fileUrl));
		// 2）将附件数据添加到"节点"
		attachment.setDataHandler(dh2);
		// 3）设置附件的文件名（需要编码）
		attachment.setFileName(MimeUtility.encodeText(dh2.getName()));

		// 7.3设置正文为：（文本/文本+图片）和 附件 的关系（合成一个大的混合"节点" / Multipart ）
		MimeMultipart mm = new MimeMultipart();
		mm.addBodyPart(txt);
		mm.addBodyPart(attachment); // 如果有多个附件，可以创建多个多次添加
		mm.setSubType("mixed"); // 混合关系
		message.setContent(mm);

		saveAndSendEmail(session, message);
	}

}
