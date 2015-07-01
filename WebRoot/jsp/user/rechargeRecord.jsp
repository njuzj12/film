<%@ page language="java" contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true"%>
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

  </head>
  
  <body>
    <%@ include file="/jsp/common/header.jsp"%>
     <div class="row"
		style="margin-top:50px; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(169, 169, 169);">
		<div class="col-md-offset-2 col-md-1">
			<div class="title">
				<h2 style="margin-top:0; ">充值记录</h2>
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
						<td style="font-weight: bolder;">${record.rechargeNum }</td>
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
