<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="refresh"
	content="3;url=<%=request.getContextPath()%>/index.jsp">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	var i = 3;
	function getTime() {
		document.getElementById('num').innerHTML = "<font color='red'>" + i + "</font>";
		i -= 1;
		var x = setTimeout(() => {
			getTime();
		}, 1000);
		if (i<=0) {
			clearTimeout(x);
		}
	}
	window.onload = getTime;
</script>
<body>
	<br>
	<center>
		<h2>
			${message }<br> 注意! 页面将在<span id="num" style="">3</span>秒后跳转至主页
		</h2>
	</center>
</body>
</html>