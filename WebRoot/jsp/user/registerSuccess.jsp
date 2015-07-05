<%@ page language="java" contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ page import="java.io.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'registerSuccess.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	<%@ include file="/jsp/common/refer.jsp" %>

  </head>
  
  <body>
  		<jsp:include page="/jsp/common/header.jsp" flush="true">
				<jsp:param name="module" value="index" />
			</jsp:include>
  		<div class="row" style="margin-top:80px">
  			<div class="col-md-offset-4 col-md-6" style="font-size:30px">恭喜！注册成功. 您的Id号为&nbsp&nbsp&nbsp&nbsp<span style="color:#c00"><%=request.getAttribute("userId") %></span></div>
  		</div>
  		<div class="row" style="margin-top:20px">
  			<div class="col-md-offset-4 col-md-4">你的账号尚未激活，某些功能无法使用，请充值来激活账户</div>
  		</div>
    	<div class="row" style="margin-top:80px">
    		<div class="col-md-offset-4 col-md-4">
    			<a href="useraction_recharging.action" class="button button-glow button-rounded button-raised button-primary" style="margin-right:100px">立即激活</a>
    			<a href="filmaction_home.action" class=" button button-glow button-rounded button-royal">随便逛逛</a>
    			
    		</div>
    	</div>
    	<%@ include file="/jsp/common/footer.jsp"%>
  </body>
</html>
