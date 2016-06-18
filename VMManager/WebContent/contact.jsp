<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'contact.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body >
  <p align="center"><img alt="Roadmap" src="images/contactus.jpg" width="400" height="250"></p>
 		<table align="center">
			   	<tr><td>电话：86-10-62661012</td></tr>	
			   	<tr><td>Email：qonecloudservice(at)nfs.iscas.ac.cn</td></tr>
			   	<tr><td>单位地址：北京市中关村南四街4号</td></tr>
        </table>
  </body>
</html>
