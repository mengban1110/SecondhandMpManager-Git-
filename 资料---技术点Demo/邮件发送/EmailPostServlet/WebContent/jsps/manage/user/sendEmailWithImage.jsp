<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发送带有图片的email</title>
</head>
<body>
	<form
		action="<%=request.getContextPath()%>/manage/EmailController.do?method=sendImage"
		method="post">
		<table>
			<tr>
				<td>收件人：</td>
				<td><input type="text" name="receiver"
					value="2662252561@qq.com" /></td>
			</tr>
			<tr>
				<td>邮件主题：</td>
				<td><input type="text" name="emailSubject" value="TestMyServletPostImage" /></td>
			</tr>

			<tr>
				<td>内容：</td>
				<td><textarea name="emailText" rows="20" cols="70"></textarea></td>
			</tr>

			<tr>
				<td>图片</td>
				<td><input type="file" value="上传图片" name="imageUrl" /></td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="发送"
					style="float: right" /></td>
			</tr>

		</table>
	</form>
</body>
</html>