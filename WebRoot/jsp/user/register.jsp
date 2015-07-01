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

<title>My JSP 'register.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<%@ include file="/jsp/common/refer.jsp"%>
<script type="text/javascript">
	
		
</script>
</head>

<body onload="ready_register()">
	<%@ include file="/jsp/common/header.jsp"%>
	<div class="row" style="margin-top:80px">
		<div class="col-md-offset-4 col-md-4">
			<form id="signupForm" action="useraction_register.action"
				method="post">
				<div class="form-group">
					<label for="账号">名称</label> <input type="text" class="form-control"
						id="name" placeholder="输入名称" name="name">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">密码</label> <input
						type="password" class="form-control" id="password"
						placeholder="输入密码" name="password">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">重复密码</label> <input
						type="password" class="form-control" id="confirm_password"
						placeholder="再次输入密码" name="confirm_password">
				</div>
				<button type="submit" class="btn btn-default">注册</button>
			</form>
		</div>
	</div>
</body>
</html>
