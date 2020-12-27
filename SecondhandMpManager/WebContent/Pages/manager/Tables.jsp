<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta http-equiv="x-ua-compatible" content="ie=edge">
		<title>二手手机交易市场管理系统</title>

		<!-- 字体 CSS -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
		<!-- Bootstrap CSS -->
		<link href="<%=request.getContextPath()%>/Pages/resource/background/manager/css/bootstrap.min.css" rel="stylesheet">
		<!-- 模板自定义 CSS -->
		<link href="<%=request.getContextPath()%>/Pages/resource/background/manager/css/mdb.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/Pages/resource/background/manager/css/style.min.css" rel="stylesheet">

		<style>
			#img{
				width: 30px;
				height: 30px;
			}
			.map-container{
				overflow:hidden;
				padding-bottom:56.25%;
				position:relative;
				height:0;
			}
			.map-container iframe{
				left:0;
				top:0;
				height:100%;
				width:100%;
				position:absolute;
			}
			table{
				
			}
			th{
				text-align: center;
			}
			input{
				width: 100%;
				text-align: center;
			}
			
			
			.kuang {
			    border: solid rgb(156, 156, 156) 1px;
			    width: 900px;
			    height: auto;
			    margin: 100px auto;
			}
			
			.brand,
			.ram,
			.color,
			.condition,
			.price,
			.submitzz{
			    font-size: 10px;
			    color: rgb(0, 0, 0);
			
			}
			
			.title {
			    width: 80px;
			}
			
			h6 {
			    margin: 10px;
			}
			
			.xuxian {
			    border-top: 1px solid rgb(156, 156, 156);
			}
			
			.list {
			    width: auto;
			    line-height: 30px;
			}
			
			li {
			    display: inline-block;
			    margin: 4px 10px;
			}
		</style>

	</head>

	<script type="text/javascript">
		//判断用户是否选择了要删除的记录，如果是，则提示“是否删除”；否则提示“请选择要删除的记录”
		function checkdel(delid, formname) {
			var flag = false;
			for (var i = 0; i < delid.length; i++) {
				if (delid[i].checked) {
					flag = true;
					break;
				}
			}
			if (!flag) {
				alert("请选择要删除的记录！");
				return false;
			} else {
				if (confirm("确定要删除吗？")) {
					formname.submit();
				}
			}
		}
	</script>

	<body class="grey lighten-3">

		<!--Main Navigation-->
		<header>

			<!-- Navbar -->
			<nav class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar">
				<div class="container-fluid">

					<!-- Brand -->
					<a class="navbar-brand waves-effect" href="#" target="_blank">
						<strong class="blue-text">DreamofOriginal</strong>
					</a>

					<!-- Collapse -->
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
					 aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<!-- Links -->
					<div class="collapse navbar-collapse" id="navbarSupportedContent">

						<!-- Left -->
						<ul class="navbar-nav mr-auto">
							<li class="nav-item">
								<a class="nav-link waves-effect" href="<%=request.getContextPath()%>/Pages/manager/Dashboard.jsp">数据统计
									<span class="sr-only">(current)</span>
								</a>
							</li>
							<li class="nav-item active">
								<a class="nav-link waves-effect" href="<%=request.getContextPath()%>/manager/mpinfo.do?method=queryAll">商品信息</a>
							</li>
							<li class="nav-item">
								<a class="nav-link waves-effect" href="<%=request.getContextPath()%>/Pages/manager/AddTables.jsp">添加商品</a>
							</li>
							<li class="nav-item">
								<a class="nav-link waves-effect" href="<%=request.getContextPath()%>/Pages/manager/Orders.jsp">订单处理</a>
							</li>
							<li class="nav-item">
								<a class="nav-link waves-effect" href="<%=request.getContextPath()%>/Pages/manager/BugSender.jsp">问题反馈</a>
							</li>
							<li class="nav-item">
								<a class="nav-link waves-effect" href="<%=request.getContextPath()%>/Pages/manager/Myself.jsp">个人中心</a>
							</li>
							<li class="nav-item">
								<a class="nav-link waves-effect" href="#">退出登录</a>
							</li>
						</ul>

						<!-- Right -->
						<ul class="navbar-nav nav-flex-icons">
							<li class="nav-item">
								<a href="#" class="nav-link waves-effect" target="_blank">
									<i class="fab fa-facebook-f"></i>
								</a>
							</li>
							<li class="nav-item">
								<a href="#" class="nav-link waves-effect" target="_blank">
									<i class="fab fa-twitter"></i>
								</a>
							</li>
							<li class="nav-item">
								<a href="http://www.dreamoforiginal.cn/" class="nav-link border border-light rounded waves-effect" target="_blank">
									<i class="fab fa-github mr-2"></i>DoO WebSite
								</a>
							</li>

						</ul>

					</div>

				</div>
			</nav>
			<!-- Navbar -->





			<!-- 左侧导航链接 -->
			<div class="sidebar-fixed position-fixed">

				<a class="logo-wrapper waves-effect" style="right: 3.125rem;">
					<img src="<%=request.getContextPath()%>/Pages/resource/background/manager/img/DreamofOriginal.jpg">
				</a>

				<div class="list-group list-group-flush">
					<a href="<%=request.getContextPath()%>/Pages/manager/Dashboard.jsp" class="list-group-item list-group-item-action waves-effect">
						<i class="fas fa-chart-pie mr-3"></i>数据统计
					</a>
					<a href="<%=request.getContextPath()%>/manager/mpinfo.do?method=queryAll" class="list-group-item list-group-item-action waves-effect active">
						<i class="fas fa-table mr-3"></i>商品信息
					</a>
					<a href="<%=request.getContextPath()%>/Pages/manager/AddTables.jsp" class="list-group-item list-group-item-action waves-effect">
						<i class="fas fa-map mr-3"></i>添加商品
					</a>
					<a href="<%=request.getContextPath()%>/Pages/manager/Orders.jsp" class="list-group-item list-group-item-action waves-effect">
						<i class="fas fa-money-bill-alt mr-3"></i>订单处理
					</a>
					<a href="<%=request.getContextPath()%>/Pages/manager/BugSender.jsp" class="list-group-item list-group-item-action waves-effect">
						<i class="fas fa-check mr-3"></i>问题反馈
					</a>
					<a href="<%=request.getContextPath()%>/Pages/manager/Myself.jsp" class="list-group-item list-group-item-action waves-effect">
						<i class="fas fa-user mr-3"></i>个人中心
					</a>
					<a href="#" class="list-group-item list-group-item-action waves-effect">
						<i class="fas fa-sign-in-alt mr-3"></i>退出登录
					</a>
				</div>

			</div>

		</header>




		<!-- 首页图 -->
		<main class="pt-5 mx-lg-5">
			<!-- 顶部空格 -->
			<div class="container-fluid mt-5">
			</div>

			<div class="kuang">
				<div class="brand">
					<table>
						<tr>
							<td class="title">
								<h6>品牌：</h6>
							</td>
							<td>
								<div class="list">
									<ul id="list1" class="nav nav-pills">
									</ul>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<hr class="xuxian">
				<div class="ram">
					<table>
						<tr>
							<td class="title">
								<h6>内存：</h6>
							</td>
							<td>
								<div class="list">
									<ul id="list2" class="nav nav-pills">
									</ul>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<hr class="xuxian">
				<div class="color">
					<table>
						<tr>
							<td class="title">
								<h6>颜色：</h6>
							</td>
							<td>
								<div class="list">
									<ul id="list3" class="nav nav-pills">
									</ul>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<hr class="xuxian">
				<div class="condition">
					<table>
						<tr>
							<td class="title">
								<h6>手机成色：</h6>
							</td>
							<td>
								<div class="list">
									<ul id="list4" class="nav nav-pills">
									</ul>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<hr class="xuxian">
				<div class="price">
					<table>
						<tr>
							<td class="title">
								<h6>价格：</h6>
							</td>
							<td>
								<div class="list">
									<ul id="list5" class="nav nav-pills">
									</ul>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<hr class="xuxian">
				<div class="submitzz">
					<table>
						<tr>
							<td class="title">
								<h6></h6>
							</td>
							<td>
								<input type="button" value="查询" class="btn btn-default" style="float: right;margin-left: 630px;" onclick="Ajax()">
							</td>
						</tr>
					</table>
				</div>
				
			</div>

			<form action="<%=request.getContextPath()%>/manager/mpinfo.do?method=del" method="post" name="formzz">
				<table class="table table-hover">
					<thead class="thead">
						<tr>
							<th>#</th>
							<th>品牌</th>
							<th>型号</th>
							<th>内存</th>
							<th>颜色</th>
							<th>成色</th>
							<th>价格</th>
							<th>手机购买日期</th>
							<th>状态</th>
							<th>修改</th>
							<th>选择</th>
						</tr>
					</thead>

					<tbody class="tbody">
						<c:forEach items="${queryAllList }" var="queryAllMap" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td><img src="<%=request.getContextPath()%>/Pages/resource/phonelogo/${queryAllMap.MpInfo_brand }.jpg" id="img"></td>
								<td><input type="text" value="${queryAllMap.brand_name }" /></td>
								<td><input type="text" value="${queryAllMap.ram_name }" /></td>
								<td><input type="text" value="${queryAllMap.color_name }" /></td>
								<td><input type="text" value="${queryAllMap.condition_name }" /></td>
								<td><input type="text" value="${queryAllMap.MpInfo_price }" /></td>
								<td><input type="text" value="${queryAllMap.MpInfo_buyTime }" /></td>
								<td><input type="text" value="${queryAllMap.infostatus_name }" /></td>
								<td><input type="button" class="btn btn-default" style="margin-top: -10px; height: 36px;" name="" id="${queryAllMap.MpInfo_id }" value="修改" /></td>
								<td><input type="checkbox" name="checkboxzz" id="" value="${queryAllMap.MpInfo_id }" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br>
				<input type="button" class="btn btn-default" style="float: right;margin-left: 1455px;" value="删除" onclick="checkdel(checkboxzz,formzz)" />
			</form>

			<br>
			<br>
			<br>
			<br>
		</main>
		<!--Main layout-->



		<!-- JQuery -->
		<script type="text/javascript" src="<%=request.getContextPath()%>/Pages/resource/background/manager/js/jquery-3.4.1.min.js"></script>
		<!-- Bootstrap 提醒工具类 -->
		<script type="text/javascript" src="<%=request.getContextPath()%>/Pages/resource/background/manager/js/popper.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script type="text/javascript" src="<%=request.getContextPath()%>/Pages/resource/background/manager/js/bootstrap.min.js"></script>
		<!-- MDB core JavaScript -->
		<script type="text/javascript" src="<%=request.getContextPath()%>/Pages/resource/background/manager/js/mdb.min.js"></script>
		<!-- Initializations -->
		<script type="text/javascript">
			// Animations initialization
			new WOW().init();
		</script>

	</body>

</html>
