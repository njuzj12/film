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
</script>
</head>

<body>
	<%@ include file="/jsp/common/waiterHeader.jsp"%>
	<div class="row"
		style="margin-top:50px; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(169, 169, 169);">
		<div class="col-md-offset-2 col-md-1">
			<div class="title">
				<h2 style="margin-top:0; ">个人资料</h2>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-offset-3 col-md-2">
			<p>姓名:${user.name }</p>
			<p>年龄:${user.age}</p>
			<p>Id:${user.userId}</p>
		</div>
		<div class="col-md-offset-2 col-md-2">
			<p>性别:${user.sex}</p>
			<p>居住地:${user.place}</p>
		</div>
	</div>
	<div class="row"
		style="margin-top:50px; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(169, 169, 169);">
		<div class="col-md-offset-2 col-md-1">
			<div class="title">
				<h2 style="margin-top:0; ">账户信息</h2>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-offset-3 col-md-3">
			<p>状态:<span style="font-weight:bold">${user.status }</p>
			<p>余额:<span id="money">${user.money }</span></p>
			<p>积分:<span id="score">${user.score }</span></p>
		</div>
		<div class="col-md-offset-1 col-md-2">
			<p>过期日期：${user.timeCount }</p>
			<p>等级:${user.level}</p>
			<p>优惠:${user.discount}折</p>
			
		</div>
	</div>
	 <div class="row"
		style="margin-top:50px; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(169, 169, 169);">
		<div class="col-md-offset-2 col-md-1">
			<div class="title">
				<h2 style="margin-top:0; ">消费记录</h2>
			</div>
		</div>
	</div>
    <div class="row" style="margin-top:20px">
		<div class="col-md-offset-2 col-md-8">
			<table class="table table-bordered">
				<tr>
					<td class="info">电影名称</td>
					<td class="info">消费金额</td>
					<td class="info">支付方式</td>
					<td class="info">余额</td>
					<td class="info">时间</td>
				</tr>
				<c:forEach var="record" items="${recharges}">
					<tr>
						<td style="font-weight: bolder;">${record.filmName }</td>
						<td style="color: #999;">${record.consumeMoney }</td>
						<td >${record.payType}</td>
						<td >${record.balance }元</td>
						<td>${record.createTime } </td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	 <div class="row"
		style="margin-top:50px; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(169, 169, 169);">
		<div class="col-md-offset-2 col-md-1">
			<div class="title">
				<h2 style="margin-top:0; ">消费记录</h2>
			</div>
		</div>
	</div>
    <div class="row" style="margin-top:20px">
		<div class="col-md-offset-2 col-md-8">
			<table class="table table-bordered">
				<tr>
					<td class="info">充值金额</td>
					<td class="info">余额</td>
					<td class="info">时间</td>
				</tr>
				<c:forEach var="record" items="${records}">
					<tr>
						<td style="font-weight: bolder;">${consumes.rechargeNum }</td>
						<td >${record.balance }元</td>
						<td>${record.createTime } </td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<%@ include file="/jsp/common/footer.jsp"%>
</body>
</html>
