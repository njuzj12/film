<%@ page language="java" contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true"%>
    <nav class="navbar navbar-default navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Film</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li <%if (request.getParameter("module").equals("index")) {
				out.print("class='active'");
			}%>><a href="/cineplex/filmaction_home.action">首页 <span class="sr-only">(current)</span></a></li>
        <li <%if (request.getParameter("module").equals("activity")) {
				out.print("class='active'");
			}%>><a href="/cineplex/useraction_joinActivity.action">我的活动</a></li>
        <li <%if (request.getParameter("module").equals("consume")) {
				out.print("class='active'");
			}%>><a href="/cineplex/useraction_consumeRecord.action">我的消费记录</a></li>
        <li <%if (request.getParameter("module").equals("recharge")) {
				out.print("class='active'");
			}%>><a href="/cineplex/useraction_rechargeRecord.action">我的充值记录</a></li>
		<li <%if (request.getParameter("module").equals("recharging")) {
				out.print("class='active'");
			}%>><a href="/cineplex/useraction_recharging.action">充值</a></li>
      </ul>
      <ul id="header_logout" class="nav navbar-nav navbar-right" >
        <li><a href="jsp/user/login.jsp">登陆</a></li>
        <li><a href="jsp/user/register.jsp">注册</a></li>
      </ul>
      <ul id="header_login" class="nav navbar-nav navbar-right" style="display:none">
        <li class="dropdown" >
          <a id="header_login_name" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">未登陆 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li <%if (request.getParameter("module").equals("account")) {
				out.print("class='active'");
			}%>><a href="/cineplex/useraction_myAccount.action">我的信息</a></li>
            <li class="divider"></li>
            <li><a href="javascript:void(0);" onclick="logout()">退出</a></li>
          </ul>
        </li>
       </ul>
       <%
       		String name=null;
       		if (request.getSession().getAttribute("loged")!=null){
       			if ((Integer)(request.getSession().getAttribute("loged"))==1){
       				name=request.getSession().getAttribute("name").toString();
       			}
       		}
        %>
        
        <input style="visibility:hidden" id="header_name" value="<%=name %>"/>
        <script type="text/javascript">
        	proprocess();
        </script>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>