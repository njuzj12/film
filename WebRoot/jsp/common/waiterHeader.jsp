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
        <li ><a href="waiteraction_makePlan.action">制定计划<span class="sr-only">(current)</span></a></li>
        <li><a href="waiteraction_makeActivity.action">制定活动</a></li>
        <li><a href="waiteraction_allUser.action">查看用户</a></li>
        <li><a href="waiteraction_films.action">购票</a></li>
      </ul>
      <ul id="header_logout" class="nav navbar-nav navbar-right" >
        <li><a href="waiteraction_logout.action">退出</a></li>
      </ul>
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>