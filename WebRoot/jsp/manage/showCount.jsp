<%@ page language="java" contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ page import="java.io.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'confirmRecharge.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<%@ include file="/jsp/common/refer.jsp"%>
<script>
	function showCount_init() {
		document.getElementById("btnToClick").click();
	}

	function repaint() {
		document.getElementById("canvasWrapper").removeChild(
				document.getElementById("myChart"));
		var myChart = document.createElement("canvas");
		myChart.id = "myChart";
		myChart.style.width = 400 + "px";
		myChart.style.height = 400 + "px";
		document.getElementById("canvasWrapper").appendChild(myChart);
	}

	function userAge() {
		repaint();
		
		var data = {
			labels : [ "20岁以下", "20-30", "30-40", "40-50", "50-60", "60-70",
					"70岁以上" ],
			datasets : [ {
				fillColor : "rgba(220,220,220,0.5)",
				strokeColor : "rgba(220,220,220,1)",
				data : [ ${userAge[0]}, ${userAge[1]}, ${userAge[2]}, ${userAge[3]}, ${userAge[4]}, ${userAge[5]}, ${userAge[6]} ]
			}]
		}
		var ctx = document.getElementById("myChart").getContext("2d");
		var myNewChart = new Chart(ctx).Bar(data);
		document.getElementById("chartName").innerHTML = "会员年龄";
	}

	function userAgePercent() {
		repaint();
		var data = [ {
			value : 30,
			color : "#F38630",
			label : "20岁以下"
		}, {
			value : 50,
			color : "#E0E4CC",
			label : "20-50岁"
		}, {
			value : 100,
			color : "#69D2E7",
			label : "50岁以上"
		} ]
		//Get the context of the canvas element we want to select
		var ctx = document.getElementById("myChart").getContext("2d");
		var myNewChart = new Chart(ctx).Pie(data);
		document.getElementById("chartName").innerHTML = "会员年龄比例";
	}

	function sexPercent() {
		repaint();
		var data = [ {
			value : 30,
			color : "#F38630",
			label : "男"
		}, {
			value : 50,
			color : "#E0E4CC",
			label : "女"
		} ]
		//Get the context of the canvas element we want to select
		var ctx = document.getElementById("myChart").getContext("2d");
		var myNewChart = new Chart(ctx).Pie(data);
		document.getElementById("chartName").innerHTML = "性别比例";
	}

	//使用柱状图
	function placeDistribute() {
		repaint();
		var data = {
			labels : [ "北京", "上海", "深圳", "南京", "其他城市" ],
			datasets : [ {
				fillColor : "rgba(220,220,220,0.5)",
				strokeColor : "rgba(220,220,220,1)",
				data : [ 65, 59, 90, 81, 56 ]
			}]
		}
		var ctx = document.getElementById("myChart").getContext("2d");
		var myNewChart = new Chart(ctx).Bar(data);
		document.getElementById("chartName").innerHTML = "居住地分布";
	}

	function consumer() {
		repaint();
		var data = {
			labels : [ "2014年10月", "2014年11月", "2014年12月", "2015年1月", "2015年1月", "2015年2月"],
			datasets : [ {
				fillColor : "rgba(220,220,220,0.5)",
				strokeColor : "rgba(220,220,220,1)",
				pointColor : "rgba(220,220,220,1)",
				pointStrokeColor : "#fff",
				data : [ 65, 59, 90, 81, 56, 55, 40 ]
			}]
		}
		var ctx = document.getElementById("myChart").getContext("2d");
		var myNewChart = new Chart(ctx).Line(data);
		document.getElementById("chartName").innerHTML = "近6个月消费情况（会员人均消费）";
	}

	function card() {
		repaint();
		var data = {
			labels : [ "未激活", "已激活", "暂停", "停止"],
			datasets : [ {
				fillColor : "rgba(220,220,220,0.5)",
				strokeColor : "rgba(220,220,220,1)",
				data :${userStatus}
			}]
		}
		var ctx = document.getElementById("myChart").getContext("2d");
		var myNewChart = new Chart(ctx).Bar(data);
		document.getElementById("chartName").innerHTML = "卡情况";
	}
</script>
</head>

<body onload="showCount_init()">
	<%@ include file="/jsp/common/manageHeader.jsp"%>
	<div class="row" style="margin-top:30px">
		<div class="col-md-offset-2 col-md-8">
			<label
				style="font-size:20px;color:#006600;border-left-width:2px;border-left-style:solid;border-left-color:#CC6633">会员统计</label>
		</div>
	</div>
	<div class="row" style="margin-top:20px">
		<div id="canvasWrapper" class="col-md-offset-4 col-md-8">
			<canvas id="myChart" width="400" height="400"></canvas>
		</div>
	</div>
	<div class="row" style="margin-top:30px">
		<div class="col-md-offset-5 col-md-8">
			<label id="chartName">会员年龄</label>
		</div>
	</div>
	<div class="row" style="margin-top:30px">
		<div class="col-md-offset-3 col-md-8">
			<button id="btnToClick" type="button" class="btn btn-default"
				onclick="userAge()">会员年龄</button>
			<button type="button" class="btn btn-default"
				onclick="userAgePercent()">会员年龄比例</button>
			<button type="button" class="btn btn-default" onclick="sexPercent()">性别比例</button>
			<button type="button" class="btn btn-default"
				onclick="placeDistribute()">居住地分布</button>
			<button type="button" class="btn btn-default" onclick="consumer()">消费</button>
			<button type="button" class="btn btn-default" onclick="card()">卡情况</button>
		</div>
	</div>
	<div class="row" style="margin-top:30px">
		<div class="col-md-offset-2 col-md-8">
			<label
				style="font-size:20px;color:#006600;border-left-width:2px;border-left-style:solid;border-left-color:#CC6633">会员喜好</label>
		</div>
	</div>
	<div class="row" style="margin-top:30px">
		<div class="col-md-offset-4 col-md-8">
			<label>上个月观看类型最多的电影是：<span
				style="font-size:16px;color:#FF0033">喜剧</span>
			</label>
		</div>
	</div>
	<div class="row" style="margin-top:30px">
		<div class="col-md-offset-4 col-md-8">
			<label>上个月<span style="font-size:16px;color:#FF0033">18:00-20:00</span>这个时间段的观看人数最多</label>
		</div>
	</div>
	<%@ include file="/jsp/common/footer.jsp"%>
</body>
</html>
