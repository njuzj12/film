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

	function dayCount() {
		repaint();
		var arr = new Array();
		var arr2 = new Array();
		for(var i=1;i<=31;i++){
 			arr.push(i);
 			arr2.push(Math.floor(Math.random()*100));
		}
		var data = {
			
			labels :arr,
			datasets : [ {
				fillColor : "rgba(220,220,220,0.5)",
				strokeColor : "rgba(220,220,220,1)",
				data : arr2
			}]
		}
		var ctx = document.getElementById("myChart").getContext("2d");
		var myNewChart = new Chart(ctx).Bar(data);
		document.getElementById("chartName").innerHTML = "日总人数";
	}


	function roomPercent() {
		repaint();
		var data = {
			labels : [ "1号厅", "2号厅", "3号厅", "4号厅", "5号厅"],
			datasets : [ {
				fillColor : "rgba(220,220,220,0.5)",
				strokeColor : "rgba(220,220,220,1)",
				pointColor : "rgba(220,220,220,1)",
				pointStrokeColor : "#fff",
				data : [ 93,24,60, 56, 80]
			}]
		}
		var ctx = document.getElementById("myChart").getContext("2d");
		var myNewChart = new Chart(ctx).Bar(data);
		document.getElementById("chartName").innerHTML = "各厅上座率";
	}

	function filmPercent() {
		repaint();
		var data = {
			labels : [ "灰姑娘", "超能陆战队", "狼图腾", "封门诡影", "帕丁顿熊"],
			datasets : [ {
				fillColor : "rgba(220,220,220,0.5)",
				strokeColor : "rgba(220,220,220,1)",
				pointColor : "rgba(220,220,220,1)",
				pointStrokeColor : "#fff",
				data : [ '65', '59', '90', '81', '56']
			}]
		}
		var ctx = document.getElementById("myChart").getContext("2d");
		var myNewChart = new Chart(ctx).Bar(data);
		document.getElementById("chartName").innerHTML = "各影片上座率";
	}

	function buyTicket() {
		repaint();
		var data = [ {
			value : 35,
			color : "#F38630",
			label : "现金购票"
		}, {
			value : 68,
			color : "#E0E4CC",
			label : "卡购票"
		} ]
		//Get the context of the canvas element we want to select
		var ctx = document.getElementById("myChart").getContext("2d");
		var myNewChart = new Chart(ctx).Pie(data);
		document.getElementById("chartName").innerHTML = "购票情况";
	}
</script>
</head>

<body onload="showCount_init()">
	<%@ include file="/jsp/common/manageHeader.jsp"%>
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
				onclick="dayCount()">日总人数</button>
			<button type="button" class="btn btn-default"
				onclick="roomPercent()">各厅上座率</button>
			<button type="button" class="btn btn-default" onclick="filmPercent()">各影片上座率</button>
			<button type="button" class="btn btn-default"
				onclick="buyTicket()">购票情况</button>
		</div>
	</div>

	<%@ include file="/jsp/common/footer.jsp"%>
</body>
</html>
