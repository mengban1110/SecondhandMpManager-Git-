<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>发送邮件Demo</title>
</head>
<body>
	<a href="<%=request.getContextPath()%>/jsps/manage/user/user_add.jsp">新用户注册...</a><br>
	<a href="<%=request.getContextPath()%>/jsps/manage/user/sendEmailWithImage.jsp">发送带图片的邮件...</a><br>
	<a href="<%=request.getContextPath()%>/jsps/manage/user/sendEmailWithFile.jsp">发送带附件的邮件...</a><br>
</body>
</html>