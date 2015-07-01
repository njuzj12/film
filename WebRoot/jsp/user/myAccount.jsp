<%@ page language="java" contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ page import="java.io.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>

<title>My JSP 'myAccount.jsp' starting page</title>

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
				<h2 style="margin-top:0; ">个人资料</h2>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-offset-3 col-md-2">
			<p>姓名:<input id="name" style="width:150px;border:0" type="text" name="name" value="${user.name }" ></p>
			<p>年龄:<input id="age" style="width:60px;border:0" type="text" name="name" value="${user.age}" ></p>
			<p>Id:${user.userId}</p>
		</div>
		<div class="col-md-offset-2 col-md-2">
			<p>性别:<select id="sex">
  					<option value ="0" <c:if test="${user.sex=='未选择'}">selected</c:if>>未选择</option>
  					<option value ="1" <c:if test="${user.sex=='男'}">selected</c:if>>男</option>
  					<option value="2" <c:if test="${user.sex=='女'}">selected</c:if>>女</option>
				</select></p>
			<p>居住地:<input id="place" style="width:60px;border:0" type="text" name="name" value="${user.place}" ></p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-offset-8 col-md-2">
			<a href="javascript:void(0); " onclick="modifyInfo()" class="button button-action button-pill">保存</a>
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
			<p>状态:<span style="font-weight:bold">${user.status }&nbsp&nbsp&nbsp<a href="javascript:void(0)" onclick="cancelUser()"><i class=" icon-remove-circle icon-large"></i>取消资格</a> </span></p>
			<p>余额:<span id="money">${user.money }</span> &nbsp&nbsp&nbsp<a href="/cineplex/useraction_recharging.action"><i class="icon-shopping-cart icon-large"></i>去充值</a></p>
			<p>积分:<span id="score">${user.score }</span> &nbsp&nbsp&nbsp<a href="javascript:void(0)" onclick="changeToMoney()"><i class="icon-money icon-large"></i>兑换余额</a> （<a href="/cineplex/jsp/user/rules.jsp" target="_blank">积分规则</a>）</p>
		</div>
		<div class="col-md-offset-1 col-md-2">
			<p>过期日期：${user.timeCount }</p>
			<p>等级:${user.level}</p>
			<p>优惠:${user.discount}折</p>
			
		</div>
	</div>
	<%@ include file="/jsp/common/footer.jsp"%>
</body>
</html>
