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
    
    <title>My JSP 'conf_viewAdmin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" type="text/css" href="CSS/table.css">
  </head>
  
  <body>
  	<table align="center"cellpadding="8" cellspacing="5">
  		<tr>
  			<th scope="col" abbr="Configurations">ID</th>
  			<th scope="col" abbr="Configurations">用户名</th>
  			<th scope="col" abbr="Configurations">密码</th>
  			<th scope="col" abbr="Configurations">操作</th>
  		</tr>
  		<s:iterator id="index" value="adminlist">
  			<tr>
			<td><s:property value="#index.id"/></td>
			<td><s:property value="#index.name"/></td>
			<td><s:property value="#index.password"/></td>
			<td><a href="Admin!delete?id=<s:property value="#index.id"/>">删除</a></td>
			</tr>
		</s:iterator>
  	</table>
  </body>
</html>
