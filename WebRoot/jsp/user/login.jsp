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

<title>My JSP 'login.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<%@ include file="/jsp/common/refer.jsp" %>
<script>
	function login_init(){
		var signal=document.getElementById("signalLabel");
		if (signal!=null){
			window.location.href="filmaction_home.action"
		}
		
	}
	
</script>
</head>

<body onload="login_init()">
	 <jsp:include page="/jsp/common/header.jsp" flush="true">
				<jsp:param name="module" value="index" />
			</jsp:include>
	<%
		int status=-1;
		if (request.getAttribute("status")!=null){
			status=(Integer)request.getAttribute("status");
		} 
		if (status==1){
			String pagefrom=null;
			if (request.getAttribute("pagefrom")==null){
				pagefrom="/filmaction_home.action";
			}else {
				pagefrom=request.getAttribute("pagefrom").toString();
			}
	%>
		 <label id="signalLabel"></label>
	<%
		}
	%>
	<div class="row" style="margin-top:80px">
		<div class="col-md-offset-1 col-md-5">
			<img style="max-width:600px" src="http://bfsu.sinaapp.com/wp-content/themes/bfsu/i/homepix/home1.jpg"/>
		</div>
		<div class="col-md-offset-1 col-md-3">
			<form method="post" action="useraction_login.action">
				<div class="form-group">
					<label for="账号">账号</label> <input
						type="text" class="form-control" id="exampleInputEmail1" name="userId"
						placeholder="输入账号">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">密码</label> <input
						type="password" class="form-control" id="exampleInputPassword1" name="password"
						placeholder="输入密码">
				</div>
				<%
					if (status==0){
						
				 %>
				<div class="checkbox">
					<label> <%=request.getAttribute("message") %> </label>
				</div>
				<%} %>
				<button type="submit" class="btn btn-default" title="按下回车登录">登陆</button>
			</form>
		</div>
	</div>
</body>
</html>
