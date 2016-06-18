<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user_top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  	<link href="CSS/styles_rg.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
	  		
	  		<div class="navigation">
	  			<div id="nav-menu">
				    <a href="content_index.jsp" target="mainFrame">首页</a>
					<a href="user_login.jsp" target="mainFrame">登录</a>
					<a href="register_step1.jsp" target="mainFrame">注册</a>
					<a href="Iaas_apply.jsp" target="mainFrame">服务申请</a>
					<a href="contact.jsp" target="mainFrame">联系我们</a>
				</div>
				<div id="nav-logo">
				<img alt="Roadmap" src="images/vmmanager1.3.png">
				</div>
				<!-- <div class="clear"><span></span></div> -->
			</div>
			<div style="border-top:1px solid #CCC;margin-top:15px;"></div>
  </body>
</html>
