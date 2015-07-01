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
	function makeActivityInit() {
		$("#makeActivityButton").bind("click", function() {
			$.ajax({
				url : "json/ajaxFilmAction_makeActivity.action",
				type : "POST",
				data : {"filmId" : $('#selectFilm option:selected').val(),
					"title" : $("#title").val(),
					"aAns" : $("#aAns").val(),
					"bAns" : $("#bAns").val(),
					"cAns":$("#cAns").val()
				},
				dataType : "json",
				success : function(data) {
					alert(data.message);
					$("#title").val("");
					$("#aAns").val("");
					$("#bAns").val("");
					$("#cAns").val("");
				}
			});
		});
	}
</script>
</head>

<body onload="makeActivityInit()">
	<%@ include file="/jsp/common/waiterHeader.jsp"%>
	<div class="row">
		<div class="col-md-offset-3 col-md-6">
			<label for="inputHelpBlock">电影</label>
		</div>
	</div>
	<div class="row">
		<div class="col-md-offset-3 col-md-6">

			<select id="selectFilm"
				style="width:300px; height:30px;margin:0 auto;font-size:14px;display:inline-block"
				class="form-control">
				<c:forEach var="film" items="${films}">
					<option value="${film.filmId}">${film.name}</option>
				</c:forEach>
			</select>
		</div>

	</div>

	<div class="row" style="margin-top:30px">
		<div class="col-md-offset-3 col-md-6">
			<label for="inputHelpBlock">问题:</label>
			<textarea id="title" class="form-control" rows="3"></textarea>
		</div>
	</div>
	<div class="row">
		<div class="col-md-offset-3 col-md-6">
			<label for="inputHelpBlock">选项A</label> <input id="aAns" type="text"
				class="form-control">
		</div>
	</div>
	<div class="row">
		<div class="col-md-offset-3 col-md-6">
			<label for="inputHelpBlock">选项B</label> <input id="bAns" type="text"
				class="form-control">
		</div>
	</div>
	<div class="row">
		<div class="col-md-offset-3 col-md-6">
			<label for="inputHelpBlock">选项C</label> <input id="cAns" type="text"
				class="form-control">
		</div>
	</div>
	<div class="row" style="margin-top:20px">
		<div class="col-md-offset-3 col-md-6">
			<button id="makeActivityButton" type="button" class="btn btn-success">确定</button>
		</div>
	</div>

	<%@ include file="/jsp/common/footer.jsp"%>
</body>
</html>
