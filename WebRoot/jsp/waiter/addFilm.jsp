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
	
</script>
</head>

<body>
	<%@ include file="/jsp/common/waiterHeader.jsp"%>
	<div class="row"
		style="margin-top:50px; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(169, 169, 169);">
		<div class="col-md-offset-2 col-md-1">
			<div class="title">
				<h2 style="margin-top:0; ">添加电影</h2>
			</div>
		</div>
	</div>
	<div class="row" style="margin-top:20px">
		<div class="col-md-offset-4 col-md-4">
			<form class="form-signin" name="registerForm" method="post" action="addFilmAction.action" enctype="multipart/form-data">
				<div class="form-group">
					<label for="inputName" class="sr-only">name</label> <input
						type="text" name="name" class="form-control" placeholder="昵称"
						required>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">director</label> <input
						type="text" name="director" class="form-control" placeholder="导演"
						required>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">actor</label> <input
						type="text" name="actor" class="form-control" placeholder="演员"
						required>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">type</label> <input
						type="text" name="type" class="form-control"
						placeholder="类型">
				</div>
				<div class="form-group">
					<label for="myHobby" class="sr-only">description</label> <input
						type="text" name="description" class="form-control" placeholder="描述">
				</div>
				<div class="form-group">
					<label for="exampleInputFile" class="sr-only">file</label>
					<p class="help-block">上传海报</p>
					<input type="file" name="file">
				</div>
				<button class="btn btn-lg btn-primary btn-block" type="submit">添加</button>
			</form>
		</div>
	</div>
	<%@ include file="/jsp/common/footer.jsp"%>
</body>
</html>
