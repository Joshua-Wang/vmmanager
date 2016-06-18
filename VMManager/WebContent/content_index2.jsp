<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'content_index2.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="CSS/content2.css">
  </head>
  
  <body>
  		<div class="container">
    	<h4 style="color:blue;text-align:center;">管理员您好，虚拟机管理系统主要包括以下三部分内容。</h4>
	    	<div class="content">
	    	    	<img src="images/conf1.png">
	    	    	<p>
	    	    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    	    	虚拟机管理模块包括六大功能，通过这个模块管理员可以可视化的管理云平台，包括实例管理、镜像管理等。
	  				</p>
	  		</div>
	  		<div class="content">
	    	    	<img src="images/conf2.png"><br>
	    	    	<p>
	    	    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    	    	服务管理模块处理用户请求，管理员可以查看用户的注册信息，审核并授权用户申请等。
	  				</p>
	  		</div>
	  		<div class="content">
	    	    	<img src="images/conf3.png"><br>
	    	    	<p>
	    	    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    	    	帐号管理模块处理管理员帐号信息，管理员可以添加、删除管理员等。
	  				</p>
	  		</div>
  		</div>
  </body>
</html>
