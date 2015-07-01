<%@ page language="java" contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ page import="java.io.*"%>
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
	$().ready(function() {
		$("#signupForm").validate({
			rules : {
				firstname : "required",
				email : {
					required : true,
					email : true
				},
				password : {
					required : true,
					minlength : 5
				},
				confirm_password : {
					required : true,
					minlength : 5,
					equalTo : "#password"
				}
			},
			messages : {
				firstname : "请输入姓名",
				email : {
					required : "请输入Email地址",
					email : "请输入正确的email地址"
				},
				password : {
					required : "请输入密码",
					minlength : jQuery.format("密码不能小于{0}个字 符")
				},
				confirm_password : {
					required : "请输入确认密码",
					minlength : "确认密码不能小于5个字符",
					equalTo : "两次输入密码不一致不一致"
				}
			}
		});
	});
	alert(1);
</script>
</head>

<body>
	<%@ include file="/jsp/common/header.jsp"%>
	<form id="signupForm" method="get" action="useraction_recharging.action">
		<p>
			<label for="firstname">Firstname</label> <input id="firstname"
				name="firstname" />
		</p>
		<p>
			<label for="email">E-Mail</label> <input id="email" name="email" />
		</p>
		<p>
			<label for="password">Password</label> <input id="password"
				name="password" type="password" />
		</p>
		<p>
			<label for="confirm_password">确认密码</label> <input
				id="confirm_password" name="confirm_password" type="password" />
		</p>
		<p>
			<input class="submit" type="submit" value="Submit" />
		</p>
	</form>
	<%@ include file="/jsp/common/footer.jsp"%>
</body>
</html>
