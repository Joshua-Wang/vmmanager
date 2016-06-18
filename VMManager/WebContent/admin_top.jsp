<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'admin_top.jsp' starting page</title>
    
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
	  					<p style="font: bold 1.3em sans-serif;color:#ffffff; margin: 6px 10px 0px 20px;float:left;">
				   		欢迎管理员<s:property value="#session.admin"/>登录！
  						</p>
  						<p style="font: 1em sans-serif;color:red; margin: 8px 10px 0 10px;float:left;">
				   		<s:property value="apply"/>
  						</p>
  						
				</div>
				<div id="nav-logo">
				<img alt="VMManager" src="images/vmmanager1.3.png">
				</div>
			</div>
			<div style="border-top:1px solid #CCC;margin-top:15px;"></div>  
  </body>
</html>
