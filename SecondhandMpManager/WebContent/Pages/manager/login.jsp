<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>后台管理系统---登录</title>

		<!-- 图片验证码 -->
		<link rel="stylesheet" href="../resource/imageCheck/css/RVerify.css" />
		<script type="text/javascript" src="../resource/imageCheck/js/RVerify.js"></script>
		<script type="text/javascript" src="../resource/background/loginRegister/js/jquery.js"></script>

		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="robots" content="all,follow">

		<!-- BootStrap -->
		<link href="https://cdn.bootcss.com/twitter-bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="../resource/background/loginRegister/css/style.default.css" id="theme-stylesheet">
	</head>

	<body>
		<!-- 成功弹窗 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">
							消息提示：
						</h4>
					</div>
					<div class="modal-body">
						<h5>
							<!-- 成功 -->
							<svg style="color: greenyellow; float:left; margin-top:20px; margin-left:10px" xmlns="http://www.w3.org/2000/svg"
							 width="50" height="50" fill="currentColor" class="bi bi-check" viewBox="0 0 16 16" id="success">
								<path fill-rule="evenodd" d="M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z" />
							</svg>
							<svg style="color: red; float:left; margin-top:20px; margin-left:10px" xmlns="http://www.w3.org/2000/svg" width="50"
							 height="50" fill="currentColor" class="bi bi-exclamation" viewBox="0 0 16 16" id="error">
								<path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z" />
							</svg>
							<br><span id="message">.................</span>
							<br>
						</h5>
					</div>
				</div>
			</div>
		</div>

		<div class="page login-page">
			<div class="container d-flex align-items-center">
				<div class="form-holder has-shadow">
					<div class="row">

						<div class="col-lg-6">
							<div class="info d-flex align-items-center">
								<div class="content">
									<div class="logo">
										<h1>欢迎登录</h1>
									</div>
									<p>二手手机交易后台管理系统</p>
								</div>
							</div>
						</div>

						<div class="col-lg-6 bg-white">
							<div class="form d-flex align-items-center">
								<div class="content">
									<form method="post" action="#" class="form-validate" id="loginFrom" name="formz">
										<!-- 账号 -->
										<div class="form-group">
											<input id="login-username" type="text" name="userName" required data-msg="请输入用户名" placeholder="用户名" value=""
											 class="input-material">
										</div>
										<!-- 密码 -->
										<div class="form-group">
											<input id="login-password" type="password" name="passWord" required data-msg="请输入密码" placeholder="密码" class="input-material">
										</div>
										<!-- 登录按钮 -->
										<button id="login" type="button" class="btn btn-primary" >登录</button>
										<!-- 自动登录/记住密码 -->
										<div style="margin-top: -40px;">
											<div class="custom-control custom-checkbox " style="float: right;">
												<input type="checkbox" class="custom-control-input" id="check2">
												<label class="custom-control-label" for="check2">自动登录</label>
											</div>
											<div class="custom-control custom-checkbox " style="float: right;">
												<input type="checkbox" class="custom-control-input" id="check1">
												<label class="custom-control-label" for="check1">记住密码&nbsp;&nbsp;</label>
											</div>
										</div>
									</form>
									<br />
									<br />
									<small>没有账号?</small>
									<a href="register.jsp" class="signup">&nbsp;点击注册</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- JavaScript files-->
		<script src="https://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/twitter-bootstrap/4.2.1/js/bootstrap.min.js"></script>
		<script src="https://cdn.bootcss.com/jquery-validate/1.17.0/jquery.validate.min.js"></script>
		<script src="../resource/background/loginRegister/js/front.js"></script>
		<script>
			/**
			 * ajax
			 */
			function doAjax() {
				var url = "<%=request.getContextPath() %>/manager/loginandregister.do?method=login";

				$.ajax({
					url: url,
					type: 'POST',
					async: false,
					data: {
						username: $("#login-username").val(),
						password: $("#login-password").val()
					},
					dataType: 'json',
					success: function(data) { //1 登录成功 2登录失败(账号或密码错误) 3账号未激活
						if (data.code === 1) {
							$("#success").hide();
							$("#error").hide();

							$("#success").show();

							$("#message").text(data.msg + "..." + data.name);
							$('#myModal').modal();
						} else if (data.code === 2) {
							$("#success").hide();
							$("#error").hide();

							$("#error").show();

							$("#message").text(data.msg);
							$('#myModal').modal();
						} else if (data.code === 3) {
							$("#success").hide();
							$("#error").hide();

							$("#error").show();

							$("#message").text(data.msg);
							$('#myModal').modal();
						}

					}
				});
			}

			/**
			 * 验证码初始化
			 */
			function config() {
				RVerify.configure({
					tolerance: 10,
					duration: 500,
					mask: 0.5,
					title: "图片旋转认证Demo",
					text: "请旋转图片将图片摆正",
					extra: "View author on Github",
					album: [
						"http://localhost:8080/SecondhandMpManager/Pages/resource/imageCheck/images/test.jpeg",
					]
				})
			}

			/**
			 * 验证码判断结果
			 */
			function check() {
				RVerify.action(function(res) {
					if (res == 1) {
						doAjax();
					}
				});
			}

			/**
			 * 验证码启动函数
			 */
			function PhotoRotateCheck() {
				config();
				check();
			}

			/**
			 * 校验入口
			 */
			window.onload = function() {
				/*错误class  form-control is-invalid
				正确class  form-control is-valid*/
				var flagName = false;
				var flagPas = false;
				/*验证用户名*/
				var name, passWord;
				$("#login-username").change(function() {
					name = $("#login-username").val();
					if (name.length < 2 || name.length > 10) {
						$("#login-username").removeClass("form-control is-valid")
						$("#login-username").addClass("form-control is-invalid");
						flagName = false;
					} else {
						$("#login-username").removeClass("form-control is-invalid")
						$("#login-username").addClass("form-control is-valid");
						flagName = true;
					}
				})
				/*验证密码*/
				$("#login-password").change(function() {
					passWord = $("#login-password").val();
					if (passWord.length < 6 || passWord.length > 18) {
						$("#login-password").removeClass("form-control is-valid")
						$("#login-password").addClass("form-control is-invalid");
						flagPas = false;
					} else {
						$("#login-password").removeClass("form-control is-invalid")
						$("#login-password").addClass("form-control is-valid");
						flagPas = true;

					}
				})
				/* 验证所有参数 */
				$("#login").click(function() {
					if (flagName && flagPas) {
						localStorage.setItem("name", name);
						localStorage.setItem("passWord", passWord);
						PhotoRotateCheck();
					} else {
						if (!flagName) {
							$("#login-username").addClass("form-control is-invalid");
						}
						if (!flagPas) {
							$("#login-password").addClass("form-control is-invalid");
						}
						$("#success").hide();
						$("#error").hide();

						$("#error").show();

						$("#message").text("请按规则提交参数!");
						$('#myModal').modal();
					}
				})
			}
		</script>

	</body>

</html>
