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
		var choose=1;
		function useRemain(){
			document.getElementById("payFilm_useRemain").className="payFilm_a_choose";
			document.getElementById("payFilm_bank").className="payFilm_a";
			document.getElementById("payFilm_remain").style.display="block";
			document.getElementById("payFilm_form").style.display="none";
			choose=1;
		}
		
		function useBank(){
			document.getElementById("payFilm_useRemain").className="payFilm_a";
			document.getElementById("payFilm_bank").className="payFilm_a_choose";
			document.getElementById("payFilm_remain").style.display="none";
			document.getElementById("payFilm_form").style.display="block";
			choose=2;
		}
		
		function payFilm_submit(){
			if (choose==1){
				if (${book.price }>${user.money }){
					alert("余额不足");
				} else {
					$.ajax({  
        				url:"json/ajaxUserAction_pay.action",  
        				type:"POST",  
        				data: {"choose":choose,"bookId":${book.bookId}},
        				dataType:"json",  
        				success:function(data){
        					if (data.message=="failure"){
        						alert("支付失败");
        					} else {
        						window.location.href="useraction_consumeRecord.action";
        					}
        				}
        			});
        		}  
			}
			if (choose==2) {
				$.ajax({  
        			url:"json/ajaxUserAction_pay.action",  
        			type:"POST",  
        			data: {"choose":choose,"bookId":${book.bookId},"bankId":$("#bankId").val(),"password":$("#bankPass").val()},
        			dataType:"json",  
        			success:function(data){
        				if (data.message=="failure"){
        					alert("支付失败");
        				} else {
        					window.location.href="useraction_consumeRecord.action";
        				}
        			}
    			});
			}
		}
	</script>
</head>

<body>
	<%@ include file="/jsp/common/header.jsp"%>
	<div class="row"
		style="margin-top:50px; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(169, 169, 169);">
		<div class="col-md-offset-2 col-md-1">
			<div class="title">
				<h2 style="margin-top:0; ">支付</h2>
			</div>
		</div>
	</div>
	<div class="row" style="margin-top:30px">
		<div class="col-md-4 col-md-offset-4">
			<p>
				支付金额：<span style="font-weight: bold; color: #ff8400;">${book.price
					}</span>元
			</p>
			<a id="payFilm_useRemain" onclick="useRemain()"
				href="javascript:void(0)" class="payFilm_a_choose"><span
				class="payFilm_span">使用余额</span>
			</a> <a id="payFilm_bank" onclick="useBank()" href="javascript:void(0)"
				class="payFilm_a"><span class="payFilm_span">使用银行卡</span>
			</a>

			<p id="payFilm_remain" style="margin-top:20px">
				账号余额：<span style="font-weight: bold; color: #ff8400;">${user.money}</span>元
			</p>

			<form id="payFilm_form" style="display:none; margin-top:20px"
				method="post" action="useraction_login.action">
				<div class="form-group">
					<label for="bankId">银行卡号</label> <input type="text"
						class="form-control" id="bankId" name="bankId" placeholder="输入账号"
						autocomplete="off">
				</div>
				<div class="form-group">
					<label for="bankPass">密码</label> <input type="password"
						class="form-control" id="bankPass" name="password"
						placeholder="输入密码" autocomplete="off">
				</div>
			</form>
			<a onclick="payFilm_submit()" class="btn btn-success" href="#"> <i
				class="icon-shopping-cart icon-large"></i>确定购买</a>
		</div>
	</div>
	<%@ include file="/jsp/common/footer.jsp"%>
</body>
</html>
