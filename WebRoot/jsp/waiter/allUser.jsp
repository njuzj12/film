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
				<h2 style="margin-top:0; ">用户信息</h2>
			</div>
		</div>
	</div>
    <div class="row" style="margin-top:20px">
		<div class="col-md-offset-2 col-md-8">
			<table class="table table-bordered">
				<tr>
					<td class="info">用户ID</td>
					<td class="info">用户名</td>
					<td class="info">用户状态</td>
					<td class="info">用户等级</td>
					<td class="info">操作</td>
				</tr>
				<c:forEach var="user" items="${users}">
					<tr>
						<td style="font-weight: bolder;">${user.userId }</td>
						<td >${user.name}</td>
						<td>${user.status } </td>
						<td>${user.level} </td>
						<td><a href="waiteraction_showUser.action?userId=${user.userId }" style="background-color: #fff; border: 1px solid #d9d9d9; color: #ff8400;"><span>查看详情</span></a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<%@ include file="/jsp/common/footer.jsp"%>
</body>
</html>
