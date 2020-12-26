<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<title>访问记录...后台</title>
	</head>
	<script src="../jquery.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		var checkFlag = true;

		function check(checkBox) {
			for (var i = 0; i < checkBox.length; i++) {
				if (checkFlag == true) {
					checkBox[i].checked = true;
				} else {
					checkBox[i].checked = false;
				}
			}
			checkFlag = checkFlag ? false : true;
		}


		function del(checkBox, form) {
			var delFlag = false;
			for (var i = 0; i < checkBox.length; i++) {
				if (checkBox[i].checked == true) {
					delFlag = true;
					break;
				}
			}
			if (delFlag == true) {
				alert("删除提交...");
				form.submit();
			} else {
				alert("请先选择要删除的对象!...");
			}
		}

		function makeExcel() {
			var url = "<%=request.getContextPath()%>/pages/history.do?method=makeExcel";
			window.location.href = url;
		}

		function go() {
			var bevisit = $("#queryBeVisit").val();
			alert(bevisit)
			var url = "<%=request.getContextPath()%>/pages/history.do?method=query_ss&bevisit=" + bevisit;
			alert(url)
			window.location.href = encodeURI(url);
		}
	</script>
	<body>
		<form action="<%=request.getContextPath()%>/pages/history.do?method=del&id=<%=request.getAttribute(" id")%>"
			method="post" name="form">
			<table border="1px" bordercolor="black">
				<tr>
					<th>visit</th>
					<th>bevisit</th>
					<th>visit_time</th>
					<th>operate</th>
				</tr>
				<c:forEach items="${infoList }" var="infoMap">
					<tr>
						<td>${infoMap.vname }</td>
						<td>${infoMap.bename }</td>
						<td>${infoMap.time }</td>
						<td>
							<input type="checkbox" name="checkBox" id="" value="${infoMap.id }" />
							<a href="<%=request.getContextPath()%>/pages/history.do?method=editPage&id=${infoMap.id }">修改</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<input type="button" name="" id="" value="全/反选" onclick="check(form.checkBox)" />
			<input type="button" name="" id="" value="删除(可批量)" onclick="del(form.checkBox,form)" />
			<input type="button" name="" id="" value="导出数据" onclick="makeExcel()" />
			<br>
			<input type="text" name="" id="queryBeVisit" value="受访人" />
			<input type="button" name="" id="" value="查询" onclick="go()" />
		</form>


	</body>
</html>
