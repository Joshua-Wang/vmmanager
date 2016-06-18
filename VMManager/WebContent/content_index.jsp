<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="CSS/content.css">
  </head>
  
  <body>
	<div class="text">
		<h3>欢迎访问VMManager云服务管理系统</h3>
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VMManager系统为您提供虚拟主机服务。
    	为申请主机服务，首先您需要注册成为系统用户，见菜单栏“注册”。
    	注册成功以后您可以登录系统，并可以申请主机（操作系统和主机大小可选）。
    	申请完主机服务以后，在申请时长以内您拥有对主机的控制权，可以启动、关闭、使用主机服务。
    	祝您使用愉快！
	</div>
	<div>
		<div class="img"><img alt="Cloud Computing" src="images/content1.jpg" width="200" height="150"></div>
		<div class="img"><img alt="Cloud Computing" src="images/content2.jpg" width="200" height="150"></div>
	</div>
  </body>
</html>
