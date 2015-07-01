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
<script type="text/javascript">
	function init_makePlan(){
		initStage();
		ajax_getTodayPlan();
	}
	
	function initStage(){
		for (var i=1;i<=5;i++){
			for (var j=1;j<=5;j++){
				changeState(i,j,"未计划",0);
			}
		}
	}
	
	function ajax_getTodayPlan(){
		$.ajax({  
        url:"json/ajaxFilmAction_getTodayPlan.action",  
        type:"POST",  
        data: {"playTime":$("#playTime").val()},
        dataType:"json",  
        success:function(data){
        	for (var i=0;i<data.plans.length;i++){
        		var x=data.plans[i];
        		changeState(x.roomId,x.timeId,data.films[i].name,x.state+1);
        	}
        }  
    });
	}
	
	function ajax_accessPlan(roomId,timeId){
	$.ajax({  
        url:"json/ajaxFilmAction_accessPlan.action",  
        type:"POST",  
        data: {"roomId":roomId,"timeId":timeId,"playTime":$("#playTime").val()},
        dataType:"json",  
        success:function(data){
            changeState(data.vo.roomId,data.vo.timeId,data.vo.filmName,2);
        }  
    });
}
	
	function changeState(roomId,timeId,name,state){
        	myid=roomId+"+"+timeId;
            var targetObject=document.getElementById(myid);
            targetObject.innerHTML=name;
        if (state==0){
			//修改a中的链接
        	var targetAObject=document.getElementById("a"+roomId+"+"+timeId);
        	targetAObject.setAttribute("onclick","");
		
			//修改td的颜色
        	var targetTdObject=document.getElementById("td"+roomId+"+"+timeId);
        	targetTdObject.className="";
        	
        	//修改图标
        	var targetIObject=document.getElementById("i"+roomId+"+"+timeId);
        	targetIObject.className="icon-ban-circle";
		}    
            
		if (state==1){
			//修改a中的链接
        	var targetAObject=document.getElementById("a"+roomId+"+"+timeId);
        	targetAObject.setAttribute("onclick","ajax_accessPlan("+roomId+","+timeId+")");
		
			//修改td的颜色
        	var targetTdObject=document.getElementById("td"+roomId+"+"+timeId);
        	targetTdObject.className="danger";
        	
        	//修改图标
        	var targetIObject=document.getElementById("i"+roomId+"+"+timeId);
        	targetIObject.className="icon-check-empty";
		}
		if (state==2){
			//修改a中的链接
        	var targetAObject=document.getElementById("a"+roomId+"+"+timeId);
        	targetAObject.setAttribute("onclick","");
		
			//修改td的颜色
        	var targetTdObject=document.getElementById("td"+roomId+"+"+timeId);
        	targetTdObject.className="active";
        	
        	//修改图标
        	var targetIObject=document.getElementById("i"+roomId+"+"+timeId);
        	targetIObject.className="icon-check";
		}
	}
</script>
</head>

<body onload="init_makePlan()">
	<%@ include file="/jsp/common/manageHeader.jsp"%>
	<div class="row"></div>
	<div class="row" style="margin-top:80px">

		<div class="col-md-offset-4 col-md-4">
			<label>日期：</label> <input id="playTime" type="text"
				value="${vo.dateString}" name="HBegtime" style="width: 150px"
				class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
				onFocus="WdatePicker({onpicked:function() {init_makePlan();},minDate:'${vo.dateString}',skin:'whyGreen',startDate:'${vo.dateString}',dateFmt:'yyyy-MM-dd'})" />

		</div>

	</div>
	<div class="row" style="margin-top:20px">
		<div class="col-md-offset-2 col-md-8">
			<table class="table table-bordered">
				<tr>
					<td></td>
					<c:forEach var="times" items="${vo.timequantums}">
						<td class="info">${times.begin}:00--${times.end}:00</td>

					</c:forEach>
				</tr>
				<c:forEach var="rooms" items="${vo.rooms}">
					<tr>
						<td class="success">${rooms.roomId}号厅</td>
						<c:forEach var="times" items="${vo.timequantums}">
							<td id="td${rooms.roomId}+${times.id}"><c:if
									test="${user.visitCount==1}">
      								 This is your first visit .
								</c:if> <a id="a${rooms.roomId}+${times.id}" class="btn"
								href="javascript:void(0)"
								onclick="addFilm(${rooms.roomId},${times.id})"> <i
									id="i${rooms.roomId}+${times.id}" class="icon-plus-sign-alt"></i>
									<span id="${rooms.roomId}+${times.id}">未添加</span> </a>
							</td>
						</c:forEach>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	
	<%@ include file="/jsp/common/footer.jsp"%>
</body>
</html>
