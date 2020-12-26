<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>e-charts应用举例之通过饼状图显示公司员工的学历信息</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery/jquery.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/echarts/echarts.js"></script>
</head>
<body>
	<div id="main"
		style="width: 600px; height: 400px; border: 2px solid red;"></div>
	<script type="text/javascript">
		var renshuData = [];//声明一个人数的数组对象，主要用来装人数的
		var xueliData = [];//声明一个学历的数组对象，主要是用来装具体是什么学历的
		<c:forEach var="map" varStatus="i" items="${list_xueli}">
		renshuData.push("${map.renshu}");
		xueliData.push("${map.xueli}");
		</c:forEach>

		// 1.基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));
		// 指定图表的配置项和数据
		var option = {
			title : {
				text : 'XX公司员工学历信息图', //标题
				subtext : '这个是二级标题---就是方便阅读--进一步解释大标题的', //父标题
				x : 'center'
			},
			tooltip : {
				trigger : 'item',
				//折线（区域）图、柱状（条形）图、K线图 : {a}（系列名称），{b}（类目值），{c}（数值）, {d}（无）
				//饼图、仪表盘、漏斗图: {a}（系列名称），{b}（数据项名称），{c}（数值）, {d}（百分比）
				formatter : "{a} <br/>{b} : {c} ({d}%)"
			},
			legend : {
				orient : 'vertical',
				left : 'left',
				data : xueliData
			},
			series : [ {
				name : '访问来源',
				type : 'pie',
				//饼图的半径，数组的第一项是内半径，第二项是外半径(相对于容器)。
				radius : '55%', //[0, '75%'] 
				//饼图的中心（圆心）坐标，数组的第一项是横坐标，第二项是纵坐标。
				//支持设置成百分比，设置成百分比时第一项是相对于容器宽度，第二项是相对于容器高度。
				center : [ '50%', '60%' ],//[400, 300]
				data : [ {
					value : renshuData[0],
					name : xueliData[0],
					itemStyle : {
						color : 'red'
					}
				}, {
					value : renshuData[1],
					name : xueliData[1],
					itemStyle : {
						color : 'blue'
					}
				}, {
					value : renshuData[2],
					name : xueliData[2],
					itemStyle : {
						color : 'green'
					}
				}, {
					value : renshuData[3],
					name : xueliData[3],
					itemStyle : {
						color : 'pink'
					}
				} ]
			} ]

		};
		// 3.使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
	</script>
</body>
</html>