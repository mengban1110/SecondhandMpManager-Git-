<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<link href="../resource/background/manager/css/bootstrap.min.css" rel="stylesheet">
		<!-- 模板自定义 CSS -->
		<link href="../resource/background/manager/css/mdb.min.css" rel="stylesheet">
		<link href="../resource/background/manager/css/style.min.css" rel="stylesheet">

		<style>
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
		</style>

	</head>




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
							<li class="nav-item">
								<a class="nav-link waves-effect" href="<%=request.getContextPath()%>/manager/mpinfo.do?method=queryAll">商品信息</a>
							</li>
							<li class="nav-item active">
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
					<img src="../resource/background/manager/img/DreamofOriginal.jpg">
				</a>

				<div class="list-group list-group-flush">
					<a href="<%=request.getContextPath()%>/Pages/manager/Dashboard.jsp" class="list-group-item waves-effect list-group-item-action">
						<i class="fas fa-chart-pie mr-3"></i>数据统计
					</a>
					<a href="<%=request.getContextPath()%>/manager/mpinfo.do?method=queryAll" class="list-group-item list-group-item-action waves-effect">
						<i class="fas fa-table mr-3"></i>商品信息
					</a>
					<a href="<%=request.getContextPath()%>/Pages/manager/AddTables.jsp" class="list-group-item list-group-item-action waves-effect active">
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

		</main>
		<!--Main layout-->










		<!-- JQuery -->
		<script type="text/javascript" src="../resource/background/manager/js/jquery-3.4.1.min.js"></script>
		<!-- Bootstrap 提醒工具类 -->
		<script type="text/javascript" src="../resource/background/manager/js/popper.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script type="text/javascript" src="../resource/background/manager/js/bootstrap.min.js"></script>
		<!-- MDB core JavaScript -->
		<script type="text/javascript" src="../resource/background/manager/js/mdb.min.js"></script>
		<!-- Initializations -->
		<script type="text/javascript">
			// Animations initialization
			new WOW().init();
		</script>

		<!-- Charts -->
		<script>
			// Line
			var ctx = document.getElementById("myChart").getContext('2d');
			var myChart = new Chart(ctx, {
				type: 'bar',
				data: {
					labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
					datasets: [{
						label: '# of Votes',
						data: [12, 19, 3, 5, 2, 3],
						backgroundColor: [
							'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)'
						],
						borderColor: [
							'rgba(255,99,132,1)',
							'rgba(54, 162, 235, 1)',
							'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)',
							'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)'
						],
						borderWidth: 1
					}]
				},
				options: {
					scales: {
						yAxes: [{
							ticks: {
								beginAtZero: true
							}
						}]
					}
				}
			});

			//pie
			var ctxP = document.getElementById("pieChart").getContext('2d');
			var myPieChart = new Chart(ctxP, {
				type: 'pie',
				data: {
					labels: ["Red", "Green", "Yellow", "Grey", "Dark Grey"],
					datasets: [{
						data: [300, 50, 100, 40, 120],
						backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360"],
						hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774"]
					}]
				},
				options: {
					responsive: true,
					legend: false
				}
			});





			//doughnut
			var ctxD = document.getElementById("doughnutChart").getContext('2d');
			var myLineChart = new Chart(ctxD, {
				type: 'doughnut',
				data: {
					labels: ["Red", "Green", "Yellow", "Grey", "Dark Grey"],
					datasets: [{
						data: [300, 50, 100, 40, 120],
						backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360"],
						hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774"]
					}]
				},
				options: {
					responsive: true
				}
			});
		</script>


	</body>

</html>
