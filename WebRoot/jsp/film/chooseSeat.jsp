<%@ page language="java" contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ page import="java.io.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
	var seatNum=0;
	
	function selectSeat(i,j){
		var seat=document.getElementById("seat"+i+"and"+j);
		seat.className="a-seat-selected";
		seat.setAttribute("onclick","cancel("+i+","+j+")");
		//<span class="seatBeChoose">4排3列</span>
		var span=document.createElement("span");
		span.className="seatBeChoose";
		span.innerHTML=(i+1)+"排"+(j+1)+"列";
		span.setAttribute("row",i);
		span.setAttribute("column",j);
		span.id="spanseat"+i+"and"+j;
		span.setAttribute("name","choosed");
		var seatBeChoose=document.getElementById("seatBeChoose");
		seatBeChoose.appendChild(span);
		seatNum++;
		var amount=seatNum*${plan.price};
		var span_amount=document.getElementById("amount");
		span_amount.innerHTML=amount+"元";
		var discountamount=amount*${plan.discount}/10;
		var span_discountamount=document.getElementById("discountamount");
		span_discountamount.innerHTML=discountamount+"元";
	}
	
	function cancel(i,j){
		var seat=document.getElementById("seat"+i+"and"+j);
		seat.className="a-seat-enabled";
		seat.setAttribute("onclick","selectSeat("+i+","+j+")");
		var spanseat=document.getElementById("spanseat"+i+"and"+j);
		var seatBeChoose=document.getElementById("seatBeChoose");
		seatBeChoose.removeChild(spanseat);
		seatNum--;
		var amount=seatNum*${plan.price};
		var span_amount=document.getElementById("amount");
		span_amount.innerHTML=amount+"元";
		var discountamount=amount*${plan.discount}/10;
		var span_discountamount=document.getElementById("discountamount");
		span_discountamount.innerHTML=discountamount+"元";
	}
	
	function chooseSeatSubmit(){
		if (seatNum==0){
			alert("清选择座位");
		} else {
		var choosed=document.getElementsByName("choosed");
		var arrayRow = new Array();
		var arrayColumn = new Array();
		for (var i=0;i<choosed.length;i++){
			//alert(choosed[i].getAttribute("row"));
			arrayRow.push(choosed[i].getAttribute("row"));
			arrayColumn.push(choosed[i].getAttribute("column"));
		}
		var price=seatNum*${plan.price}*${plan.discount}/10;
		$.ajax({  
        	url:"json/ajaxFilmAction_pay.action",  
        	type:"POST",  
        	data: {"row":arrayRow.join(","),"column":arrayColumn.join(","),"seatNum":seatNum,"planId":${plan.planId},"price":price},
        	dataType:"json",  
        	success:function(data){
        		//alert(data.message);
        		if (data.message=="failure"){
        			alert("提交失败");
        		} else {
        			window.location.href="useraction_payFilm.action?bookId="+data.bookId;
        		}
        	}  
    	});
    	}
	}
</script>
</head>

<body>
	<%@ include file="/jsp/common/header.jsp"%>

	<div class="row" style="margin-top:20px;">
		<div class="seats col-md-offset-2 col-md-6">
			<div class="row">
				<div class="col-md-offset-2 col-md-8">
					<h3
						style="background: #fff; border-radius: 5px; line-height: 38px; height: 38px;text-align: center; border: 1px solid #c8c8c8; margin: 25px 28px 0;">${plan.roomId}号厅银幕</h3>
				</div>
			</div>
			<div class="row">
				<ul
					style="margin: 18px 0 46px 150px; overflow: hidden; height: 20px; width: auto;">
					<li class="seat seat-enabled"><span style="height:20px">可选</span>
					</li>
					<li class="seat seat-selected"><span style="height:20px">已选</span>
					</li>
					<li class="seat seat-occupied"><span style="height:20px">已售</span>
					</li>
				</ul>
			</div>
			<div class="row">
				<table style="margin-left:150px">
					<c:forEach begin="0" end="${plan.row-1 }" var="i">
						<tr>
							<td>${i+1}</td>
							<c:forEach begin="0" end="${plan.column-1 }" var="j">
								<td style="padding: 4px;"><c:if test="${plan.seat[i][j]}">
										<a class="a-seat-occupied"></a>
									</c:if> <c:if test="${!plan.seat[i][j]}">
										<a href="javascript:void(0)" id="seat${i}and${j}"
											onclick="selectSeat(${i},${j})" class="a-seat-enabled"></a>
									</c:if></td>
							</c:forEach>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="seatinfo-box col-md-4 ">
			<p style="margin-top:50px">
				<span style="color: #999;">片名:</span> <span
					style="font-weight: normal; color: #000;">${plan.filmName}</span>
			</p>
			<p>
				<span style="color: #999;">影厅：</span>${plan.roomId}号厅
			</p>
			<p>
				<span style="color: #999;">日期：</span>${plan.playTime}
			</p>

			<p>
				<span style="color: #999;">时间：</span>${plan.start}:00--${plan.end}:00
			</p>
			<p>
				<span style="color: #999;">单价：</span>${plan.price}元
			</p>
			<p>
				<span style="color: #999;">原价：</span><span
					 id="amount">0元</span>
			</p>
			<p>
				<span style="color: #999;">折扣后：</span><span
					style="font-weight: bold; color: #ff8400;" id="discountamount">0元</span>
			</p>
			<p id="seatBeChoose">
				<span style="color: #999;"> 座位：</span>
			</p>
			<a href="javasript:void(0)" class="b-rbtn" onclick="chooseSeatSubmit()"><span
				class="b-rbtn-span">我要支付</span> </a>

		</div>
	</div>
	<form action=""></form>
	<%@ include file="/jsp/common/footer.jsp"%>
</body>
</html>
