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

<title>My JSP 'confirmRecharge.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<%@ include file="/jsp/common/refer.jsp"%>

<script type="text/javascript">
	function manageSubmit() {
		$.ajax({
			url : "json/ajaxUserAction_manageLogin.action",
			type : "POST",
			data : {},
			dataType : "json",
			success : function(data) {
				window.location.href = "manageaction_showPlan.action";
			}
		});

	}
</script>
</head>

<body>
	<%@ include file="/jsp/common/manageHeader.jsp"%>
	<div class="row" style="margin-top:80px">
		<div class="col-md-offset-2 col-md-5">
			<img style="max-width:600px" src="images/common/manage.jpg" />
		</div>
		<div class=" col-md-3">

			<div class="form-group">
				<label for="账号">账号</label> <input type="text" class="form-control"
					id="exampleInputEmail1" name="userId" placeholder="输入账号">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">密码</label> <input type="password"
					class="form-control" id="exampleInputPassword1" name="password"
					placeholder="输入密码">
			</div>
			<button type="button" onclick="manageSubmit()"
				class="btn btn-default">登陆</button>

		</div>
	</div>
	<%@ include file="/jsp/common/footer.jsp"%>
</body>
</html>
