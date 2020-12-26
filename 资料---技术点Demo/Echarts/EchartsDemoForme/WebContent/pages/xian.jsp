<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/echarts/echarts.js"></script>
<title>e-charts应用举例之通过折线图显示学生的周作业完成情况</title>
</head>
<body>
<div id="main" style="width: 800px;height:400px;"></div>

<script type="text/javascript">
	
	 var wanchengData=[];//数组对象：存放一周的完成作业的每天的人数
	 var meiyouData=[];//数组对象：存放一周的没有完成作业的每天的人数
	 <c:forEach items="${list_zhexian}" var="zhexian">
	 wanchengData.push(parseInt("${zhexian.wanchen}"));
	 meiyouData.push(parseInt("${zhexian.meiyou}"));
     </c:forEach>
	
	
	
	var myChart = echarts.init(document.getElementById('main'));
		option = {
			    title : {
			        text: 'Java02班一周作业验收情况统计走势图',
			        subtext: '二级标题'
			    },
			    tooltip : {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['已完成','未完成']
			    },
			    toolbox: {
			        show : true,
			        x:'520',
			        y:'top',
			        feature : {
			            mark : {show: true},
			            dataView : {show: true, readOnly: true,title:"数据视图",lang: ['数据视图', '关闭', '刷新'],},
			            magicType : {show: true, type: ['bar','line','stack'],title: {
			                line: '切换为折线图',
			                bar: '切换为柱状图',
			                stack: '切换为堆叠',
			                tiled: '切换为平铺'
			            }},
			            restore : {show: true,title:"还原",},
			            saveAsImage : {show: true,title:"保存为图片",}
			        }
			    },
			    calculable : true,
			    xAxis : [
			        {
			            type : 'category',
			            boundaryGap : false,
			            data : ['周一','周二','周三','周四','周五','周六','周日']
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value',
			            axisLabel : {
			             formatter: '{value}人 '
			            }
			        }
			    ],
			    series : [
			        {
			            name:'已完成',
			            type:'line',
			            data:wanchengData,
			            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均值'}
			                ]
			            }
			        },
			        {
			            name:'未完成',
			            type:'line',
			            data:meiyouData,
			            markPoint : {
			                data : [
			                        {type : 'max', name: '最大值'},
			                        {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name : '平均值'}
			                ]
			            }
			        }
			    ]
			};
			//3.设定并显示                    
		 myChart.setOption(option);
	</script>



</body>
</html>