<%@ page language="java" contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.io.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <%@ include file="/jsp/common/header.jsp"%>
    <div class="row">
    	<div class="col-md-offset-2 col-md-3">
    		<img src="${film.photo}"/>
    	</div>
    	<div class="col-md-offset-1 col-md-4">
    		<div class="row">
    			片名：${film.name}
    		</div>
    		<div class="row">
    			导演：${film.director}
    		</div>
    		<div class="row">
    			主演：${film.actor}
    		</div>
    		<div class="row">
    			导演：${film.director}
    		</div>
    		<div class="row">
    			时长：${film.time}分钟
    		</div>
    		<div class="row" >
    			剧情：${film.description}
    		</div>
    	</div>
    </div>
    <div class="row">
    	
    </div>
    <%@ include file="/jsp/common/footer.jsp"%>
  </body>
</html>
