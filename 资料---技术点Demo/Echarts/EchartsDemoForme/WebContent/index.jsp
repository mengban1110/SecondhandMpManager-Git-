<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<a href="<%=request.getContextPath()%>/info.do?method=zhu">柱状</a>
		<a href="<%=request.getContextPath()%>/info.do?method=bing">饼状</a>
		<a href="<%=request.getContextPath()%>/info.do?method=zhe">线状</a>
	</body>
</html>
