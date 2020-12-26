<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<form action="<%=request.getContextPath()%>/pages/history.do?method=edit&id=${id}" method="post">
			<table border="1px" bordercolor="black">
				<tr>
					<th>visit</th>
					<th>bevisit</th>
					<th>visit_time</th>
				</tr>
				<%
					Map map = (Map)request.getAttribute("infoMapzz");
				%>
					<tr>
						<td><input type="text" name="visit" id="" value="<%=map.get("vname") %>" /></td>
						<td><input type="text" name="bevisit" id="" value="<%=map.get("bename") %>" /></td>
						<td><input type="text" name="time" id="" value="<%=map.get("time") %>" /></td>
					</tr>
			</table>
			<input type="submit" value="修改" />
		</form>
	</body>
</html>
