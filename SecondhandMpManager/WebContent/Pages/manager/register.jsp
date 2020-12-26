<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>后台管理系统---注册</title>
		<!-- jquery -->
		<script type="text/javascript" src="../resource/background/loginRegister/js/jquery.js"></script>

		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="robots" content="all,follow">

		<!-- 图片验证码 -->
		<link rel="stylesheet" href="../resource/imageCheck/css/RVerify.css" />
		<script type="text/javascript" src="../resource/imageCheck/js/RVerify.js"></script>

		<!-- Bootstrap CSS-->
		<link href="https://cdn.bootcss.com/twitter-bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet">
		<link href="https://cdn.bootcss.com/twitter-bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
		<link rel="stylesheet" href="../resource/background/loginRegister/css/style.default.css" id="theme-stylesheet">

		<!-- Bootstrap JS-->
		<script type="text/javascript" src="../resource/background/loginRegister/js/bootstrap-3.3.7-dist/js/npm.js"></script>
		<script type="text/javascript" src="../resource/background/loginRegister/js/bootstrap-3.3.7-dist/js/bootstrap.js"></script>

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

		<!-- 注册页面 -->
		<div class="page login-page">
			<div class="container d-flex align-items-center">
				<div class="form-holder has-shadow">
					<div class="row">

						<!-- 顶部/左部 -->
						<div class="col-lg-6">
							<div class="info d-flex align-items-center">
								<div class="content">
									<div class="logo">
										<h1>欢迎注册</h1>
									</div>
									<p>二手手机交易管理系统</p>
								</div>
							</div>
						</div>

						<!-- 表单 -->
						<div class="col-lg-6 bg-white">
							<div class="form d-flex align-items-center">
								<div class="content">
									<div class="form-group">
										<!-- 用户名 -->
										<input id="register-username" class="input-material" type="text" name="registerUsername" placeholder="请输入账号">
										<div class="invalid-feedback">
											用户名必须在2~10位之间
										</div>
									</div>
									<div class="form-group">
										<!-- 密码 -->
										<input id="register-password" class="input-material" type="password" name="registerPassword" placeholder="请输入密码">
										<div class="invalid-feedback">
											密码必须在6~10位之间
										</div>
									</div>
									<div class="form-group">
										<!-- 邮箱 -->
										<input id="register-email" class="input-material" type="text" name="registerEmail" placeholder="请输入邮箱">
										<div class="invalid-feedback">
											请输入正确的邮箱
										</div>
									</div>
									<div class="form-group">
										<!-- 注册按钮 -->
										<button style="background-color: rgb(132,120,239); border: 0;" id="regbtn" type="button" name="registerSubmit"
										 class="btn btn-primary btn-lg">注册</button>
									</div>
									<small>已有账号?</small>
									<a href="login.jsp" class="signup">&nbsp;点击登录</a>
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
		<script>
			window.onload = function() {
				/*错误class  form-control is-invalid
				正确class  form-control is-valid*/
				var flagName = false;
				var flagPas = false;
				var flagEmail = false;
				/*验证用户名*/
				var name, passWord, passWords;
				$("#register-username").change(function() {
					name = $("#register-username").val();
					if (name.length < 2 || name.length > 10) {
						$("#register-username").removeClass("form-control is-valid")
						$("#register-username").addClass("form-control is-invalid");
						flagName = false;
					} else {
						$("#register-username").removeClass("form-control is-invalid")
						$("#register-username").addClass("form-control is-valid");
						flagName = true;
					}
				})
				/*验证密码*/
				$("#register-password").change(function() {
					passWord = $("#register-password").val();
					if (passWord.length < 6 || passWord.length > 18) {
						$("#register-password").removeClass("form-control is-valid")
						$("#register-password").addClass("form-control is-invalid");
						flagPas = false;
					} else {
						$("#register-password").removeClass("form-control is-invalid")
						$("#register-password").addClass("form-control is-valid");
						flagPas = true;
					}
				})
				/*验证邮箱*/
				$('#register-email').change(function() {
					var reg1 =
						/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)/;
					if (reg1.test($('#register-email').val()) == false) {
						$("#register-email").removeClass("form-control is-valid")
						$("#register-email").addClass("form-control is-invalid");
						flagEmail = false;
					} else {
						$("#register-email").removeClass("form-control is-invalid")
						$("#register-email").addClass("form-control is-valid");
						flagEmail = true;
					}
				})
				/* 验证所有参数 */
				$("#regbtn").click(function() {
					if (flagName && flagPas && flagEmail) {
						localStorage.setItem("name", name);
						localStorage.setItem("passWord", passWord);
						PhotoRotateCheck(); //验证码校验
					} else {
						if (!flagName) {
							$("#register-username").addClass("form-control is-invalid");
						}
						if (!flagPas) {
							$("#register-password").addClass("form-control is-invalid");
						}
						if (!flagEmail) {
							$("#register-email").addClass("form-control is-invalid");
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

		<script type="text/javascript">
			/**
			 * ajax
			 */
			function doAjax() {
				var url = "<%=request.getContextPath() %>/manager/loginandregister.do?method=register";

				$.ajax({
					url: url,
					type: 'POST',
					async: false,
					data: {
						registerUsername: $("#register-username").val(),
						registerPassword: $("#register-password").val(),
						registerEmail: $("#register-email").val()
					},
					dataType: 'json',
					success: function(data) {//1 发送成功 2发送失败(已经注册) 3系统异常 发送失败
						if (data.code === 1) {
							$("#success").hide();
							$("#error").hide();
						
							$("#success").show();
						
							$("#message").text(data.msg);
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
		</script>
	</body>

</html>
