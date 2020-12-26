<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>图片墙</title>
	</head>
	<style type="text/css">
		table {
			width: 100%;
		}
		
		table tr,
		td,
		th {
			text-align: center;
		}
		
		img {
			width: 100px;
			height: 100px;
		}
		
		#search {
			text-align: center;
			margin: 50px 0px;
		}
		
		#search p {
			color: red;
		}
		
		#search #up {
			margin-right: -80px;
		}
		
		.alter {
			align-items: center;
			text-align: center;
			margin-bottom: 40px;
			display: none;
		}
		
		#message {
			margin-bottom: 10px;
		}
	</style>
	
	<script type="text/javascript">
		$(function() {
			// 返回 web 主机的域名，如：http://127.0.0.1:8080/testdemo/test.html?id=1&name=test
			var url = window.location.href;
			// 返回当前页面的路径和文件名，如：/testdemo/test.html
			var pathname = window.location.pathname;
			// 返回 web 主机的端口，如：8080
			var port = window.location.port;
			// 返回所使用的 web 协议，如：http:
			var protocol = window.location.protocol;
			// 获取参数，如：?id=1&name=test
			var search = window.location.search;
			// 获取指定参数值
			var id = getUrlParam('id'); // 1
			var name = getUrlParam('name'); // test
		});

		function getUrlParam(name) {
			// 取得url中?后面的字符
			var query = window.location.search.substring(1);
			// 把参数按&拆分成数组
			var param_arr = query.split("&");
			for(var i = 0; i < param_arr.length; i++) {
				var pair = param_arr[i].split("=");
				if(pair[0] == name) {
					return pair[1];
				}
			}
			return(false);
		}










		var checkFlag = true;

		function check(checkbox) {
			console.log(checkbox.length);
			for(var i = 0; i < checkbox.length; i++) {
				if(checkFlag == true) {
					checkbox[i].checked = true;
				} else {
					checkbox[i].checked = false;
				}
			}
			checkFlag = checkFlag ? false : true;
			console.log(checkFlag)
		}

		function upload() {
			var up = document.getElementById("up").value;
			alert("up:" + up);
			if(up.length <= 0) {
				alert("请选择有效文件进行导入");
				return false;
			}

			var url = "<%=request.getContextPath()%>/info.do?method=upload&up=" + up + "";
			alert("url:" + encodeURI(url));
			window.location.href = encodeURI(url);

		}

		function del(checkbox, formzz) {
			var delFlag = false;
			for(var i = 0; i < checkbox.length; i++) {
				if(checkbox[i].checked == true) {
					delFlag = true;
					break;
				}
			}
			if(delFlag == true) {
				alert("删除提交...");
				formzz.submit();
			} else {
				alert("请先选择要删除的对象!...");
			}
		}

		function share() {
			var url = "<%=request.getContextPath()%>/info.do?method=share";

			alert("url:" + encodeURI(url));
			window.location.href = encodeURI(url);
		}

		window.onload = function() {
			var result = <%=request.getAttribute("share")%>;
			if(result == 1) {
				var obj = document.getElementById("alterzz");
				obj.style.display = "block";

				var button = document.getElementById("but");
				button.style.backgroundColor = "#d4d4d4";
				button.setAttribute("disabled", true);
				button.value = "生成二维码.分享(已生成 禁止点击啦!)";

			} else {
				var obj = document.getElementById("alterzz");
				obj.style.display = "none";
			}
		}
	</script>

	<body>

		<div id="search">
			<p>
				<%=getServletContext().getAttribute("map") %>
			</p>
			<p>DreamofOriginal's photoswall <span>(当前登录人数 : <%=application.getAttribute("numSessions") %>)</span></p>
			<!-- 			<br>
			关键词搜索 : <input type="text" name="" id="" value="" />
			<input type="button" name="" id="" value="搜索" />
			<br> -->
			<br>
			<br>
			<input type="file" name="" id="up" value="" />
			<input type="button" name="" id="" value="上传" onclick="upload()" />
			<br>
			<br>
			<input type="button" name="" id="" value="删除(可批量)" onclick="del(formzz.checkbox,formzz)" />
			<input type="button" name="" id="" value="全选/反选" onclick="check(formzz.checkbox)" />
			<input type="button" name="" id="but" value="生成二维码.分享" onclick="share()" />
		</div>

		<div class="alter" id="alterzz">
			<div id="message">
				已经生成二维码啦! 使用微信扫一扫即可查看并分享给其他人!
			</div>
			<div>
				<img src="<%=request.getContextPath()%>/info.do?method=download&imgpath=code.png">
			</div>
		</div>

		<form action="<%=request.getContextPath()%>/info.do?method=del" method="post" name="formzz">
			<table border="1px" cellspacing="" cellpadding="">
				<tr>
					<th>操作</th>
					<th>图片</th>
					<!-- <th>关键词</th> -->
					<th>上传时间</th>
				</tr>

				<c:forEach items="${info }" var="map">
					<tr>
						<td><input type="checkbox" name="checkbox" id="checkbox" value="${map.id }" /></td>
						<td><img src="<%=request.getContextPath()%>/info.do?method=download&imgpath=${map.imgpath }"></td>
						<!-- <td>插画,艺术家,抽象</td> -->
						<td>${map.uploadtime }</td>
					</tr>
				</c:forEach>

			</table>
		</form>

	</body>

</html>