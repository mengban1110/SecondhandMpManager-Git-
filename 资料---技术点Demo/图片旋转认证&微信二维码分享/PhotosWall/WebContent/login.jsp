<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>登录</title>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/RVerify.css" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/RVerify.js"></script>
	</head>
	<script type="text/javascript">
		//结果
		var result = false;

		function config() {
			RVerify.configure({
				tolerance: 10,
				duration: 500,
				mask: 0.5,
				title: "图片旋转认证Demo",
				text: "请旋转图片将图片摆正",
				extra: "View author on Github",
				album: [
					"http://localhost:8089/PhotosWall/images/test.jpeg",
				]
			})
		}

		/**
		 * 验证码判断结果
		 */
		function check() {
			RVerify.action(function(res) {
				console.log(res);
				if (res == 1) {
					result = true;
					formz.submit();
				}
			});
		}

		/**
		 * 验证码判断入口
		 * @param {Object} formz
		 */
		function PhotoRotateCheck(formz) {
			alert(result);
			if (result == true) {
				formz.submit();
			} else {
				config();
				check();
			}
		}
	</script>
	<body>
		<form action="<%=request.getContextPath()%>/info.do?method=login" method="post" name="formz">
			登录:<input type="text" name="username" id="username" value="" /> <br>
			密码:<input type="password" name="password" id="password" value="" /> <br>
			<input type="button" value="登录" onclick="PhotoRotateCheck(formz)" />
		</form>
	</body>
</html>
