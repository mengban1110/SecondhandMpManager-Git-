<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath() %>/manage/EmailController.do?method=register"
			method="post" onsubmit="return checkForm()">
		<table>
			<tr>
				<td>用户名 : </td>
				<td><input type="text" name="username" value="DoO" /></td>
			</tr>
			<tr>
				<td>密码 : </td>
				<td><input type="text" name="password" value="wushang816" /></td>
			</tr>	
			<tr>
				<td>邮箱 : </td>
				<td><input type="text" id="ema" name="email" value="mengban1110@gmail.com" /></td>
			</tr>
			<tr>
				<td colspan="2"><input style="float: right;" type="submit" value="提交" /></td>
			</tr>	
		</table>
	</form>
</body>
</html>