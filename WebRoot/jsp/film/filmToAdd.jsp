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
<link href="/cineplex/css/mystyle.css" rel="stylesheet" media="screen">
<%@ include file="/jsp/common/refer.jsp"%>
<script type="text/javascript">
	$(function() {

		$("#close-01").bind("click", function() {
			window.parent.closeFilmToAdd();
		});

		$("#confirm").bind("click", function() {
			window.parent.ajax_sendPlan($('#selectFilm option:selected').val());
		});
	});
</script>
</head>

<body>
<body style="background:#000;margin:0 auto;width:400px;">
	<div class="tk-01" style="width:400px">
		<div class="ask-qb" >
			<h3 style="margin:0">请选择一部电影</h3>
			<div class="close-01" id="close-01">X</div>
			<div class="clearfloat"></div>
		</div>
		<div class="ask_items">
			<div style="width:300px; height:30px;margin:0 auto;">
				<select
					id="selectFilm" style="width:300px; height:30px;margin:0 auto;font-size:16px;display:inline-block">
					<c:forEach var="film" items="${films}">
						<option value="${film.filmId}">${film.name}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="clearfloat"></div>
		<div class="hyp001">
			<div class="row">
				<div style="width:250px;margin:0 auto">
					<a id="confirm" class="btn btn-success" href="javascript:void(0)"> <i
						class="icon-ok icon-large"></i> 确定</a>
				</div>
			</div>
		</div>

	</div>

</body>

</html>
