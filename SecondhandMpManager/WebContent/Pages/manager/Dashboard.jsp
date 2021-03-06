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
		<link href="<%=request.getContextPath()%>/Pages/resource/background/manager/css/bootstrap.min.css" rel="stylesheet">
		<!-- 模板自定义 CSS -->
		<link href="<%=request.getContextPath()%>/Pages/resource/background/manager/css/mdb.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/Pages/resource/background/manager/css/style.min.css" rel="stylesheet">

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

		<!-- 顶部顶部顶部 -->
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
							<li class="nav-item active">
								<a class="nav-link waves-effect" href="Dashboard.jsp">数据统计
									<span class="sr-only">(current)</span>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link waves-effect" href="<%=request.getContextPath()%>/Pages/manager/Dashboard.jsp">商品信息</a>
							</li>
							<li class="nav-item">
								<a class="nav-link waves-effect" href="<%=request.getContextPath()%>/manager/mpinfo.do?method=queryAll">添加商品</a>
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
			<!-- 顶部顶部顶部 -->


			<!-- 左侧导航链接 -->
			<div class="sidebar-fixed position-fixed">

				<a class="logo-wrapper waves-effect" style="right: 3.125rem;">
					<img src="<%=request.getContextPath()%>/Pages/resource/background/manager/img/DreamofOriginal.jpg">
				</a>

				<div class="list-group list-group-flush">
					<a href="<%=request.getContextPath()%>/Pages/manager/Dashboard.jsp" class="list-group-item waves-effect active">
						<i class="fas fa-chart-pie mr-3"></i>数据统计
					</a>
					<a href="<%=request.getContextPath()%>/manager/mpinfo.do?method=queryAll" class="list-group-item list-group-item-action waves-effect">
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
			<!-- 左侧导航链接 -->

		</header>



		<!-- 首页图 -->
		<main class="pt-5 mx-lg-5">
			<!-- 顶部空格 -->
			<div class="container-fluid mt-5">
			</div>

			<!--行1 -->
			<div class="row wow fadeIn">

				<!--列1-->
				<div class="col-md-9 mb-4">
					<div class="card">
						<div class="card-body">
							<!-- 柱状图柱状图柱状图 -->
							<canvas id="myChart"></canvas>
						</div>
					</div>
				</div>
				<!--列1-->


				<!--列2-->
				<div class="col-md-3 mb-4">
					<div class="card mb-4">
						<div class="card-header text-center">
							网站快报
						</div>
					</div>

					<div class="card mb-4">
						<div class="card-body">
							<!-- 信息消息框 -->
							<div class="list-group list-group-flush">
								<a class="list-group-item list-group-item-action waves-effect">注册用户
									<span class="badge badge-danger badge-pill pull-right" id="accountCount">124
									</span>
								</a>
								<a class="list-group-item list-group-item-action waves-effect">脏机拦截
									<span class="badge badge-primary badge-pill pull-right">10
									</span>
								</a>
								<a class="list-group-item list-group-item-action waves-effect">在售总数
									<span class="badge badge-danger badge-pill pull-right">77
									</span>
								</a>
								<a class="list-group-item list-group-item-action waves-effect">交易总数
									<span class="badge badge-primary badge-pill pull-right">29
									</span>
								</a>
								<a class="list-group-item list-group-item-action waves-effect ">交易总额
									<span class="badge badge-danger badge-pill pull-right">58798
									</span>
								</a>

							</div>
						</div>

					</div>
				</div>
				<!--列2-->

			</div>
			<!--行1-->



			<!--行2-->
			<div class="row wow fadeIn">

				<!--列1-->
				<div class="col-lg-6 col-md-6 mb-4">
					<div class="card">
						<div class="card-header">在售手机-品牌占比</div>
						<!-- 饼状图 -->
						<div class="card-body">
							<canvas id="doughnutChart"></canvas>
						</div>
					</div>
				</div>
				<!--列1-->


				<!--列2-->
				<div class="col-md-6 mb-4">

					<div class="card">

						<div class="card-header text-center">
							在售手机-销售排行
						</div>
						<!-- 图表 -->
						<div class="card-body">

							<table class="table table-hover">
								<thead class="blue lighten-4">
									<tr>
										<th>#</th>
										<th>手机品牌</th>
										<th>销售数量</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">1</th>
										<td>华为</td>
										<td>7</td>
									</tr>
									<tr>
										<th scope="row">2</th>
										<td>苹果</td>
										<td>4</td>
									</tr>
									<tr>
										<th scope="row">3</th>
										<td>三星</td>
										<td>3</td>
									</tr>
								</tbody>
							</table>

						</div>
					</div>
				</div>
				<!--列2-->

			</div>
			<!--行2-->

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

		<!-- Charts -->
		<script>
			// 表类型 line,bar,radar,polarArea,pie,doughnut

			// 柱状图
			var ctx = document.getElementById("myChart").getContext('2d');
			var myChart = new Chart(ctx, {
				type: 'bar', //表格类型
				data: {
					labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"], //底部介绍
					datasets: [{
						label: '总数', //显示总数
						data: [12, 19, 3, 5, 2, 3], //数据
						backgroundColor: [ //柱状图背景颜色
							'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)'
						],
						borderColor: [ //柱状图边框颜色
							'rgba(255,99,132,1)',
							'rgba(54, 162, 235, 1)',
							'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)',
							'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)'
						],
						borderWidth: 1 //柱状图边框宽度
					}]
				},
				options: {
					responsive: true, //动态响应
					legend: { //柱状图颜色介绍
						display: false,
						position: 'bottom'
					},
					scales: {
						yAxes: [{ //y轴数据显示相关设置
							ticks: {
								beginAtZero: true //是否从零开始
							}
						}]
					},
					title: { //表格标题
						display: true,
						text: "在售手机-品牌数量"
					},
				}
			});

			//饼状图
			var ctxD = document.getElementById("doughnutChart").getContext('2d');
			var myLineChart = new Chart(ctxD, {
				type: 'doughnut', //表格类型
				data: {
					labels: ["Red", "Green", "Yellow", "Grey", "Dark Grey"], //底部介绍
					datasets: [{
						data: [300, 50, 100, 40, 120], //数据
						backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360"], //背景颜色
						hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774"] //展示颜色
					}]
				},
				options: {
					responsive: true //动态响应
				}
			});
		</script>


	</body>

</html>