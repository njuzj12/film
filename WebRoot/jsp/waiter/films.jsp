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
<script>
	function donotDisplay(){
		var types=document.getElementsByName("typeName");
		for (var i=0;i<types.length;i++){
			types[i].style.display="none";
		}
	}
	
	function displayType(typeName){
		donotDisplay();
		var targetType=document.getElementById(typeName);
		targetType.style.display="block";
	}
</script>
</head>

<body>
	<%@ include file="/jsp/common/waiterHeader.jsp"%>
	<div class="row"
		style="margin-top:20px; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(169, 169, 169);">
		<div class="col-md-offset-2 col-md-1">
			<div class="title">
				<h2 style="margin-top:0; ">
					正在热映<span>${fn:length(homevo.films)}</span>部
				</h2>
			</div>
		</div>
		<div class="col-md-offset-1 col-md-5">
			<div class="type" style="line-height: 48px;">
				<a class="on" onclick="displayType('all')">全部<span>|</span>
				</a> <a onclick="displayType('xiju')">喜剧<span>|</span> </a> <a
					onclick="displayType('maoxian')">冒险<span>|</span> </a> <a
					onclick="displayType('dongzuo')">动作<span>|</span> </a> <a 
					onclick="displayType('kongbu')">恐怖<span>|</span> </a> <a 
					onclick="displayType('aiqing')">爱情<span>|</span> </a> <a 
					onclick="displayType('jiating')">家庭<span>|</span> </a> <a 
					onclick="displayType('lunli')">伦理</a>
			</div>
		</div>
	</div>

	<div id="all" name="typeName" class="row" style="margin-top:60px" >
		<c:forEach var="films" items="${homevo.films}">
			<div class="col-md-offset-1 col-md-2">

				<a href="waiteraction_filmInfo.action?film=${films.filmId}"
					title="${films.name}"> <img src="${films.photo}"
					alt="${films.name}" style="max-width:200px;max-height:280px;">
				</a>

			</div>
			<div class=" col-md-2">
				<p>
					<a
						style="color: #333;font-size:20px;font-family: helvetica, 微软雅黑, 'microsoft yahei', verdana, lucida, arial, sans-serif, 黑体;"
						href="waiteraction_filmInfo.action?film=${films.filmId}">${films.name}</a>
				</p>
				<p>${films.time}分钟 &nbsp&nbsp&nbsp ${films.type}</p>
				<p style="height: 178px; overflow:hidden;  text-overflow: ellipsis;"
					class="homeInfo">${films.description}</p>
				<p>
					<a href="waiteraction_filmInfo.action?film=${films.filmId}"
						class="ticket">选座购票</a>
				</p>
			</div>
		</c:forEach>
	</div>
	
	<div id="xiju" name="typeName" class="row" style="margin-top:60px; display:none" >
		<c:forEach var="films" items="${homevo.xiju}">
			<div class="col-md-offset-1 col-md-2">

				<a href="waiteraction_filmInfo.action?film=${films.filmId}"
					title="${films.name}"> <img src="${films.photo}"
					alt="${films.name}" style="max-width:200px;max-height:280px;">
				</a>

			</div>
			<div class=" col-md-2">
				<p>
					<a
						style="color: #333;font-size:20px;font-family: helvetica, 微软雅黑, 'microsoft yahei', verdana, lucida, arial, sans-serif, 黑体;"
						href="waiteraction_filmInfo.action?film=${films.filmId}">${films.name}</a>
				</p>
				<p>${films.time}分钟 &nbsp&nbsp&nbsp ${films.type}</p>
				<p style="height: 178px; overflow:hidden;  text-overflow: ellipsis;"
					class="homeInfo">${films.description}</p>
				<p>
					<a href="waiteraction_filmInfo.action?film=${films.filmId}"
						class="ticket">选座购票</a>
				</p>
			</div>
		</c:forEach>
	</div>
	
	<div id="maoxian" name="typeName" class="row" style="margin-top:60px; display:none" >
		<c:forEach var="films" items="${homevo.maoxian}">
			<div class="col-md-offset-1 col-md-2">

				<a href="waiteraction_filmInfo.action?film=${films.filmId}"
					title="${films.name}"> <img src="${films.photo}"
					alt="${films.name}" style="max-width:200px;max-height:280px;">
				</a>

			</div>
			<div class=" col-md-2">
				<p>
					<a
						style="color: #333;font-size:20px;font-family: helvetica, 微软雅黑, 'microsoft yahei', verdana, lucida, arial, sans-serif, 黑体;"
						href="waiteraction_filmInfo.action?film=${films.filmId}">${films.name}</a>
				</p>
				<p>${films.time}分钟  &nbsp&nbsp&nbsp ${films.type}</p>
				<p style="height: 178px; overflow:hidden;  text-overflow: ellipsis;"
					class="homeInfo">${films.description}</p>
				<p>
					<a href="waiteraction_filmInfo.action?film=${films.filmId}"
						class="ticket">选座购票</a>
				</p>
			</div>
		</c:forEach>
	</div>
	
	<div id="dongzuo" name="typeName" class="row" style="margin-top:60px; display:none" >
		<c:forEach var="films" items="${homevo.dongzuo}">
			<div class="col-md-offset-1 col-md-2">

				<a href="waiteraction_filmInfo.action?film=${films.filmId}"
					title="${films.name}"> <img src="${films.photo}"
					alt="${films.name}" style="max-width:200px;max-height:280px;">
				</a>

			</div>
			<div class=" col-md-2">
				<p>
					<a
						style="color: #333;font-size:20px;font-family: helvetica, 微软雅黑, 'microsoft yahei', verdana, lucida, arial, sans-serif, 黑体;"
						href="waiteraction_filmInfo.action?film=${films.filmId}">${films.name}</a>
				</p>
				<p>${films.time}分钟  &nbsp&nbsp&nbsp ${films.type}</p>
				<p style="height: 178px; overflow:hidden;  text-overflow: ellipsis;"
					class="homeInfo">${films.description}</p>
				<p>
					<a href="waiteraction_filmInfo.action?film=${films.filmId}"
						class="ticket">选座购票</a>
				</p>
			</div>
		</c:forEach>
	</div>
	
	<div id="kongbu" name="typeName" class="row" style="margin-top:60px; display:none" >
		<c:forEach var="films" items="${homevo.kongbu}">
			<div class="col-md-offset-1 col-md-2">

				<a href="waiteraction_filmInfo.action?film=${films.filmId}"
					title="${films.name}"> <img src="${films.photo}"
					alt="${films.name}" style="max-width:200px;max-height:280px;">
				</a>

			</div>
			<div class=" col-md-2">
				<p>
					<a
						style="color: #333;font-size:20px;font-family: helvetica, 微软雅黑, 'microsoft yahei', verdana, lucida, arial, sans-serif, 黑体;"
						href="waiteraction_filmInfo.action?film=${films.filmId}">${films.name}</a>
				</p>
				<p>${films.time}分钟  &nbsp&nbsp&nbsp ${films.type}</p>
				<p style="height: 178px; overflow:hidden;  text-overflow: ellipsis;"
					class="homeInfo">${films.description}</p>
				<p>
					<a href="waiteraction_filmInfo.action?film=${films.filmId}"
						class="ticket">选座购票</a>
				</p>
			</div>
		</c:forEach>
	</div>
	
	<div id="aiqing" name="typeName" class="row" style="margin-top:60px; display:none" >
		<c:forEach var="films" items="${homevo.aiqing}">
			<div class="col-md-offset-1 col-md-2">

				<a href="waiteraction_filmInfo.action?film=${films.filmId}"
					title="${films.name}"> <img src="${films.photo}"
					alt="${films.name}" style="max-width:200px;max-height:280px;">
				</a>

			</div>
			<div class=" col-md-2">
				<p>
					<a
						style="color: #333;font-size:20px;font-family: helvetica, 微软雅黑, 'microsoft yahei', verdana, lucida, arial, sans-serif, 黑体;"
						href="waiteraction_filmInfo.action?film=${films.filmId}">${films.name}</a>
				</p>
				<p>${films.time}分钟  &nbsp&nbsp&nbsp ${films.type}</p>
				<p style="height: 178px; overflow:hidden;  text-overflow: ellipsis;"
					class="homeInfo">${films.description}</p>
				<p>
					<a href="waiteraction_filmInfo.action?film=${films.filmId}"
						class="ticket">选座购票</a>
				</p>
			</div>
		</c:forEach>
	</div>
	
	<div id="jiating" name="typeName" class="row" style="margin-top:60px; display:none" >
		<c:forEach var="films" items="${homevo.jiating}">
			<div class="col-md-offset-1 col-md-2">

				<a href="waiteraction_filmInfo.action?film=${films.filmId}"
					title="${films.name}"> <img src="${films.photo}"
					alt="${films.name}" style="max-width:200px;max-height:280px;">
				</a>

			</div>
			<div class=" col-md-2">
				<p>
					<a
						style="color: #333;font-size:20px;font-family: helvetica, 微软雅黑, 'microsoft yahei', verdana, lucida, arial, sans-serif, 黑体;"
						href="waiteraction_filmInfo.action?film=${films.filmId}">${films.name}</a>
				</p>
				<p>${films.time}分钟  &nbsp&nbsp&nbsp ${films.type}</p>
				<p style="height: 178px; overflow:hidden;  text-overflow: ellipsis;"
					class="homeInfo">${films.description}</p>
				<p>
					<a href="waiteraction_filmInfo.action?film=${films.filmId}"
						class="ticket">选座购票</a>
				</p>
			</div>
		</c:forEach>
	</div>
	
	<div id="lunli" name="typeName" class="row" style="margin-top:60px; display:none" >
		<c:forEach var="films" items="${homevo.lunli}">
			<div class="col-md-offset-1 col-md-2">

				<a href="waiteraction_filmInfo.action?film=${films.filmId}"
					title="${films.name}"> <img src="${films.photo}"
					alt="${films.name}" style="max-width:200px;max-height:280px;">
				</a>

			</div>
			<div class=" col-md-2">
				<p>
					<a
						style="color: #333;font-size:20px;font-family: helvetica, 微软雅黑, 'microsoft yahei', verdana, lucida, arial, sans-serif, 黑体;"
						href="waiteraction_filmInfo.action?film=${films.filmId}">${films.name}</a>
				</p>
				<p>${films.time}分钟  &nbsp&nbsp&nbsp ${films.type}</p>
				<p style="height: 178px; overflow:hidden;  text-overflow: ellipsis;"
					class="homeInfo">${films.description}</p>
				<p>
					<a href="waiteraction_filmInfo.action?film=${films.filmId}"
						class="ticket">选座购票</a>
				</p>
			</div>
		</c:forEach>
	</div>
	<%@ include file="/jsp/common/footer.jsp"%>
</body>
</html>
