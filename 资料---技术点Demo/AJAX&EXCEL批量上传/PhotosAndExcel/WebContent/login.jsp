<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<title>来访宾客记录</title>
	</head>
	<script src="jquery.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		function doajax(){
			var visit = $("#visit").val();
			var bevisit = $("#bevisit").val();
			var url = encodeURI("<%=request.getContextPath()%>/pages/history.do?method=queryAll_ajax&bevisit="+bevisit);
			$.ajax({
				url: url,
				type: 'POST',
				dataType: 'JSON',
				timeout: 1000, //超时时间设置， 单位毫秒
				async: true,
				success: function(data) {
					if(data.name == null){
						alert("暂无此受访人!");
						$("#submite").attr("disabled","disabled");
					}else{
						$("#submite").removeAttr("disabled");
						alert(data.name);
						alert(data.sex);
						alert(data.phone);
					}
				},
				error: function() {
					console.log('请求失败');
				},
			});
			
			
		}
	</script>
	<body>
		<form action="<%=request.getContextPath()%>/pages/history.do?method=queryAllandAdd" method="post">
			来访人id:<input type="text" name="id" id="id" value=""/>
			来访人:<input type="text" name="visit" id="visit" value=""/>
			被访人:<input type="text" name="bevisit" id="bevisit" value="" onblur="doajax()"/>
			<input type="submit" id="submite" value="访问" />
		</form>
	</body>
</html>


