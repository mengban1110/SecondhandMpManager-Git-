<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>后台管理系统---激活</title>
		<meta name="description" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="robots" content="all,follow">

		<!-- Bootstrap CSS-->
		<link href="https://cdn.bootcss.com/twitter-bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
		<link rel="stylesheet" href="../resource/background/loginRegister/css/style.default.css" id="theme-stylesheet">
		<link href="https://cdn.bootcss.com/twitter-bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet">

		<!-- Bootstrap JS-->
		<script type="text/javascript" src="../resource/background/loginRegister/js/jquery.js"></script>
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

		<!-- 激活页面 -->
		<div class="page login-page">
			<div class="container d-flex align-items-center">
				<div class="form-holder has-shadow">
					<div class="row">

						<!-- 顶部/左部 -->
						<div class="col-lg-6">
							<div class="info d-flex align-items-center">
								<div class="content">
									<div class="logo">
										<h1>欢迎激活</h1>
									</div>
									<p>二手手机交易后台管理系统</p>
								</div>
							</div>
						</div>

						<!-- 表单提交 -->
						<div class="col-lg-6 bg-white">
							<div class="form d-flex align-items-center">
								<div class="content">
									<div class="form-group">
										<!-- 用户名 -->
										<input id="register-name" class="input-material" type="text" name="registerName" placeholder="请输入用户名/姓名">
										<div class="invalid-feedback">
											用户名必须在2~10位之间
										</div>
									</div>
									<div class="form-group">
										<!-- 激活码 -->
										<input id="register-key" class="input-material" type="text" name="registerKey" placeholder="请输入激活码">
										<div class="invalid-feedback">
											请输入正确的激活码
										</div>
									</div>
									<div class="form-group">
										<!-- 激活按钮 -->
										<button style="background-color: rgb(132,120,239); border: 0;" id="regbtn" type="button" name="registerSubmit"
										 class="btn btn-primary">激活</button>
									</div>
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
				var flagKey = false;
				/*验证用户名*/
				var name, passWord, passWords;
				$("#register-name").change(function() {
					name = $("#register-name").val();
					if (name.length < 2 || name.length > 10) {
						$("#register-name").removeClass("form-control is-valid")
						$("#register-name").addClass("form-control is-invalid");
						flagName = false;
					} else {
						$("#register-name").removeClass("form-control is-invalid")
						$("#register-name").addClass("form-control is-valid");
						flagName = true;
					}
				})
				/*验证激活码*/
				$("#register-key").change(function() {
					code = $("#register-key").val();
					if (code.length <= 0 || code.length > 4) {
						$("#register-key").removeClass("form-control is-valid")
						$("#register-key").addClass("form-control is-invalid");
						flagKey = false;
					} else {
						$("#register-key").removeClass("form-control is-invalid")
						$("#register-key").addClass("form-control is-valid");
						flagKey = true;
					}
				})
				/* 激活按钮 */
				$("#regbtn").click(function() {
					if (flagName && flagKey) {
						localStorage.setItem("name", name);
						doAjax();
					} else {
						if (!flagName) {
							$("#register-name").addClass("form-control is-invalid");
						}
						if (!flagKey) {
							$("#register-key").addClass("form-control is-invalid");
						}
						$("#success").hide();
						$("#error").hide();
						
						$("#error").show();
						
						$("#message").text("请按规则提交参数!");
						$('#myModal').modal();
					}
				})
			}

			/**
			 * ajax
			 */
			function doAjax() {

				var url = "<%=request.getContextPath() %>/manager/loginandregister.do?method=activity";

				$.ajax({
					url: url,
					type: 'POST',
					async: false,
					data: {
						registerName: $("#register-name").val(),
						registerKey: $("#register-key").val()
					},
					dataType: 'json',
					success: function(data) { //1 激活成功 2激活码不存在 3激活码已使用
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
		</script>
	</body>

</html>
