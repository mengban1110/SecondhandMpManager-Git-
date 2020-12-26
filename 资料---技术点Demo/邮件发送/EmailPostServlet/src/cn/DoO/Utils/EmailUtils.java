package cn.DoO.Utils;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;

import com.sun.org.apache.bcel.internal.generic.NEW;

public class EmailUtils {

	public static String sendEmailAccount = "qq2662252561@163.com";
	public static String sendEmailPassword = "NVMYUQDRZGBNJNZA";
	public static String receiveEmailAccount = "2662252561@qq.com";

	/**
	 * 设置邮件session
	 * 
	 * @return
	 */
	public static Session getSession() {
		// TODO Auto-generated method stub
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "smtp");// 使用的协议
		props.setProperty("mail.smtp.host", "smtp.163.com");// 发件人的邮箱的SMTP服务器地址
		props.setProperty("mail.smtp.auth", "true");// 需要请求认证

		Session session = Session.getInstance(props);
		session.setDebug(true);
		return session;
	}

	public static void createMimeMessage(HttpServletRequest request, String email, String ucode)
			throws UnsupportedEncodingException, MessagingException {
		// TODO Auto-generated method stub

		// 获取项目路径
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
				+ "/";

		// 获取session
		Session session = EmailUtils.getSession();
		// 创建一封邮件
		MimeMessage message = new MimeMessage(session);

		// 设置发件人
		message.setFrom(new InternetAddress(sendEmailAccount, "DreamofOriginal", "UTF-8"));
		// 设置收件人
		message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(email, "new account", "UTF-8"));
		// 设置抄送人
		message.setRecipient(MimeMessage.RecipientType.CC, new InternetAddress(sendEmailAccount, "DreamofOriginal", "UTF-8"));
		// 设置邮件主题
		message.setSubject("DoOServletTest : " + new Date(), "UTF-8");

		String context = "<div>" + new Date() + " please use this code t activity your account: " + ucode + "<a href='" + basePath + "jsps/manage/user/validation.jsp'>"
				+ basePath + "jsps/manage/user/validation.jsp" + "</a>" + "</div>";
		message.setContent(context, "text/html;charset=UTF-8");

		saveAndSendEmail(session, message);

	}
	
	/**
	 * 发送带图片的邮件
	 * @param receiver
	 * @param emailSubject
	 * @param emailText
	 * @param imageUrl
	 * @throws UnsupportedEncodingException
	 * @throws MessagingException
	 */
	public static void createMimeMessage(String receiver, String emailSubject, String emailText, String imageUrl) throws UnsupportedEncodingException, MessagingException {
		// TODO Auto-generated method stub
		Session session = EmailUtils.getSession();
		
		MimeMessage message = new MimeMessage(session);
		message.setFrom(new InternetAddress(sendEmailAccount, "DreamofOriginal", "UTF-8"));
		message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiver, "new account", "UTF-8"));
		message.setRecipient(MimeMessage.RecipientType.CC, new InternetAddress(sendEmailAccount, "DreamofOriginal", "UTF-8"));
		message.setSubject(emailSubject,"UTF-8");
		
		MimeBodyPart txt = new MimeBodyPart();
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
		
		saveAndSendEmail(session, message);
	}
	
	
	public static void createMimeMessage2(String receiver, String emailSubject, String emailText, String fileUrl) throws UnsupportedEncodingException, MessagingException {
		// TODO Auto-generated method stub
		Session session = EmailUtils.getSession();
		MimeMessage message = new MimeMessage(session);
		message.setFrom(new InternetAddress(sendEmailAccount,"DreamofOriginal","UTF-8"));
		message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiver, "new account", "UTF-8"));
		message.setRecipient(MimeMessage.RecipientType.CC, new InternetAddress(sendEmailAccount,"DreamofOriginal","UTF-8"));
		message.setSubject(emailSubject,"UTF-8");
		
		MimeBodyPart txt = new MimeBodyPart();
		txt.setContent(emailText, "text/html;charset=UTF-8");
		
		MimeBodyPart attachment = new MimeBodyPart();
		DataHandler dh = new DataHandler(new FileDataSource(fileUrl));
		attachment.setDataHandler(dh);
		attachment.setFileName(MimeUtility.encodeText(dh.getName()));
		
		MimeMultipart mm = new MimeMultipart();
		mm.addBodyPart(txt);
		mm.addBodyPart(attachment);
		mm.setSubType("mixed");
		
		message.setContent(mm);
		
		saveAndSendEmail(session, message);
	}

	/**
	 * 发送邮件
	 * 
	 * @param session
	 * @param message
	 * @throws MessagingException
	 */
	public static void saveAndSendEmail(Session session, MimeMessage message) throws MessagingException {
		// TODO Auto-generated method stub
		message.setSentDate(new Date());

		message.saveChanges();

		Transport transport = session.getTransport();

		transport.connect(sendEmailAccount, sendEmailPassword);

		transport.sendMessage(message, message.getAllRecipients());

		transport.close();
	}

	

	

}
