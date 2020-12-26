<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery/jquery.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/echarts/echarts.js"></script>
<meta charset="UTF-8">
<title>e-charts应用举例之通过柱状图显示公司的全年--季度财务统计报告</title>
</head>
<body>
	<div id="main" style="width: 100%; height: 800px;"></div>
	<script type="text/javascript">
		var shouruData = []; //数组对象：存放12个月的收入金额
		var zhichuData = []; //数组对象：存放12个月的支出金额
		var yusuanData = []; //数组对象：存放12个月的预算金额
		<c:forEach items="${list_shouru}" var="shouru">
		shouruData.push(parseInt("${shouru.jiner}"));
		</c:forEach>

		<c:forEach items="${list_zhichu}" var="zhichu">
		zhichuData.push(parseInt("${zhichu.jiner}"));
		</c:forEach>

		<c:forEach items="${list_yusuan}" var="yusuan">
		yusuanData.push(parseInt("${yusuan.jiner}"));
		</c:forEach>

		//1.基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById("main"));

		// 2.指定图表的配置项和数据
		var option = {
			title : {
				//主标题文本，'\n'指定换行  
				text : 'XX公司2020年的财务统计报告',
				//主标题文本超链接  
				link : 'http://www.baidu.com',
				//副标题文本，'\n'指定换行  
				subtext : 'www.stepday.com',
				//副标题文本超链接  
				sublink : 'http://www.stepday.com/myblog/?Echarts',
				//水平安放位置，默认为左侧，可选为：'center' | 'left' | 'right' | {number}（x坐标，单位px）  
				x : '180px',
				//垂直安放位置，默认为全图顶端，可选为：'top' | 'bottom' | 'center' | {number}（y坐标，单位px）  
				y : '20px'
			},

			tooltip : {
				//触发类型，默认（'item'）数据触发，可选为：'item'(数据触发，其实就是提示窗显示数据) | 'axis'(轴线触发，其实就是提示窗显示轴线)
				trigger : 'axis'
			},
			legend : {
				//显示策略，可选为：true（显示） | false（隐藏），默认值为true  
				show : true,
				//水平安放位置，默认为全图居中，可选为：'center' | 'left' | 'right' | {number}（x坐标，单位px）  
				x : 'center',
				//垂直安放位置，默认为全图顶端，可选为：'top' | 'bottom' | 'center' | {number}（y坐标，单位px）  
				y : 'top',
				data : [ '收入', '预算', '支出' ]
			},

			xAxis : {
				type : 'category',
				data : [ "第一季度", "第二季度", "第三季度", "第四季度" ],
				name : '季度'
			},
			yAxis : {
				show : true, //是否显示 y 轴,默认显示，但是设置为false就不显示了
				type : 'value', ////坐标轴类型。'value' 数值轴，适用于连续数据。'category' 类目轴，适用于离散的类目数据，为该类型时必须通过 data 设置类目数据
				name : '金额（元）'
			},
			series : [ {
				name : '收入',
				type : 'bar',
				markPoint : {
					data : [ {
						type : 'max',
						name : '最大值'
					}, {
						type : 'min',
						name : '最小值'
					} ]
				},
				markLine : {
					data : [ {
						type : 'average',
						name : '平均值'
					} ]
				},
				data : shouruData
			}, {
				name : '预算',
				type : 'bar',
				markPoint : {
					data : [ {
						type : 'max',
						name : '最大值'
					}, {
						type : 'min',
						name : '最小值'
					} ]
				},
				markLine : {
					data : [ {
						type : 'average',
						name : '平均值'
					} ]
				},
				data : yusuanData
			}, {
				name : '支出',
				type : 'bar',
				markPoint : {
					data : [ {
						type : 'max',
						name : '最大值'
					}, {
						type : 'min',
						name : '最小值'
					} ]
				},
				markLine : {
					data : [ {
						type : 'average',
						name : '平均值'
					} ]
				},

				data : zhichuData
			} ]
		};

		// 3.使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
	</script>

</body>
</html>
