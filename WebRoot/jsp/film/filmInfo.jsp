<%@ page language="java" contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ page import="java.io.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'confirmRecharge.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<%@ include file="/jsp/common/refer.jsp"%>

</head>

<body>
	<jsp:include page="/jsp/common/header.jsp" flush="true">
				<jsp:param name="module" value="buy" />
			</jsp:include>
	<div class="row">
		<div class="col-md-offset-2 col-md-2">
			<img src="${film.photo}" />
		</div>
		<div class="col-md-offset-1 col-md-4">
			<p>
				<a
					style="color: #333;font-size:20px;font-family: helvetica, 微软雅黑, 'microsoft yahei', verdana, lucida, arial, sans-serif, 黑体;"
					href="filmaction_filmInfo.action?film=${film.filmId}">${film.name}</a>
			</p>
			<p>导演：${film.director}</p>
			<p>主演：${film.actor}</p>
			<p>时长：${film.time}分钟</p>
			<p>类型：${film.type}</p>
			<p>价格：${film.price}元</p>
			<p>剧情:</p>
			<p style="height: 178px;  overflow:hidden;  text-overflow: ellipsis;"
				class="homeInfo">${film.description}</p>
		</div>
	</div>
	<div class="row"
		style="margin-top:50px; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(169, 169, 169);">
		<div class="col-md-offset-2 col-md-1">
			<div class="title">
				<h2 style="margin-top:0; ">近期上映计划</h2>
			</div>
		</div>
	</div>
	<div class="row" style="margin-top:80px">
	<ul class="nav nav-pills" style="width:700px; margin-left:400px;margin-top:-50px;margin-bottom:50px;">
	 	 <li>
   		 <a href="#">购票流程</a>
 		 </li>
 		 <li>
   		 <a href="#" role="button">选择影片 >></a>
 		 </li>
 		 <li  class="active">
   		 <a href="#" role="button">选择放映计划 >></a>
 		 </li>
 		 <li>
   		 <a href="#" role="button">选择座位 >></a>
 		 </li>
 		 <li>
   		 <a href="#" role="button">确认付款 </a>
 		 </li>
	</ul>
		<div class="col-md-offset-4 col-md-4">
			<label>选择日期：</label> <input id="playTime" type="text"
				value="${dateString}" name="HBegtime" style="width: 150px"
				class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
				onFocus="WdatePicker({onpicked:function() {},minDate:'${dateString}',skin:'whyGreen',startDate:'${dateString}',dateFmt:'yyyy-MM-dd'})" />
		</div>
	</div>
	
	<div class="row" style="margin-top:20px">
		<div class="col-md-offset-2 col-md-8">
			<table class="table table-bordered">
				<tr>
					<td class="info">开始时间</td>
					<td class="info">结束时间</td>
					<td class="info">放映厅</td>
					<td class="info">余票</td>
					<td class="info">操作</td>
				</tr>
				<c:forEach var="plan" items="${plans}">
					<tr>
						<td style="font-weight: bolder;">${plan.start }:00</td>
						<td style="color: #999;">${plan.end }:00</td>
						<td >${plan.roomId}号厅</td>
						<td >${plan.remainTicket }张</td>
						<td> <a href="filmaction_chooseSeat.action?planId=${plan.planId }" target="blank" style="background-color: #fff; border: 1px solid #d9d9d9; color: #ff8400;"><span>选座购票</span></a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<%@ include file="/jsp/common/footer.jsp"%>
</body>
</html>
