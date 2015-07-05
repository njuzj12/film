<%@ page language="java" contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ page import="java.io.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script type="text/javascript">
	function activitySub(){
		alert("成功");
		window.location.href="http://localhost:8080/cineplex/filmaction_home.action";
	}
</script>
</head>

<body>
	 <jsp:include page="/jsp/common/header.jsp" flush="true">
				<jsp:param name="module" value="activity" />
			</jsp:include>
	<c:forEach var="question" items="${vo.questions}">
		<div class="row">
			<div class="col-md-4 col-md-offset-3">${question.title}</div>
		</div>
		<div class="row" style="margin-top:20px;">
			<div class="col-md-4 col-md-offset-4"><INPUT type="radio" name="R" value="A" >${question.a}</div>
			
		</div>
		<div class="row" style="margin-top:20px;">
			<div class="col-md-4 col-md-offset-4"><INPUT type="radio" name="R" value="B">${question.b}</div>
			 
		</div>
		<div class="row" style="margin-top:20px;">
			<div class="col-md-4 col-md-offset-4"><INPUT type="radio" name="R" value="C">${question.b}</div>
			
		</div>
	</c:forEach>
	<div class="col-md-offset-3 col-md-6">
			<button id="makeActivityButton" onclick="activitySub()" type="button" class="btn btn-success">确定</button>
		</div>
	<%@ include file="/jsp/common/footer.jsp"%>
</body>
</html>
