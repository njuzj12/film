<%@ page language="java" contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ page import="java.io.*"%>
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

<title>My JSP 'recharge.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<%@ include file="/jsp/common/refer.jsp"%>
</head>

<body onload="ready_recharge()">
	<%@ include file="/jsp/common/header.jsp"%>
	<div class="container" style="margin-top:80px">
		<div class="row">
			<div class="col-md-offset-3 col-md-4">
				<p class="mediumFont">账户充值</p>
			</div>
		</div>
		<div class="col-md-offset-4 col-md-4">
			<div class="form-group">
				<label for="recharge">充值金额（元）</label> <input type="text"
					class="form-control" id="recharge" name="recharge"
					placeholder="输入金额">
			</div>
			<div class="form-group">
				<label for="bankId">银行账号</label> <input type="text"
					class="form-control" id="bankId" name="bankId" placeholder="输入账号">
			</div>
			<div class="form-group">
				<label for="bankPass">银行密码</label> <input type="password"
					class="form-control" id="bankPass" name="password"
					placeholder="输入密码">
			</div>
		</div>
	</div>
	<div class="row" style="margin-top:40px">
		<div class="col-md-offset-4 col-md-4">
			<a href="javascript:void(0);" onclick="recharge()"
				class="button button-highlight button-pill button-large">确认充值</a>
		</div>
	</div>
	</div>
	<%@ include file="/jsp/common/footer.jsp"%>
</body>
</html>
