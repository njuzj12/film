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
    <jsp:include page="/jsp/common/header.jsp" flush="true">
				<jsp:param name="module" value="index" />
			</jsp:include>
     <div class="row"
		style="margin-top:50px; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(169, 169, 169);">
		<div class="col-md-offset-2 col-md-1">
			<div class="title">
				<h2 style="margin-top:0; ">积分规则</h2>
			</div>
		</div>
	</div>
	  <div class="row" style="margin-top:20px">
		<div class="col-md-offset-2 col-md-8">
			每充值1元可得1积分，积分可兑换成金额，10积分可兑换1元。
		</div>
	</div>
    <div class="row" style="margin-top:20px">
		<div class="col-md-offset-2 col-md-6">
			<table class="table table-bordered">
				<tr>
					<td class="info">累计充值（元）</td>
					<td class="info">等级</td>
					<td class="info">折数</td>
				</tr>
					<tr>
						<td>0--200</td>
					<td >白银</td>
					<td >无优惠</td>
					</tr>
					<tr>
						<td>200--500</td>
					<td >黄金</td>
					<td >9折</td>
					</tr>
					<tr>
						<td>500--1000</td>
					<td >白金</td>
					<td >8折</td>
					</tr>
					<tr>
						<td>1000以上</td>
					<td >钻石</td>
					<td >7折</td>
					</tr>
			</table>
		</div>
	</div>
    <%@ include file="/jsp/common/footer.jsp"%>
  </body>
</html>
