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
    
    <title>My JSP 'conf-resource.jsp' starting page</title>
    
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
  	
    <table  id="mytable" width="594" height="61" align="center" cellpadding="0" cellspacing="2">
    	<tr>
    		 <th scope="col" abbr="Configurations">云平台资源查看</th>
    	</tr>
    	<!-- <tr>
    		<td><form action="Resource!show"><input type="submit" value="刷新"/></form></td>
    	</tr> -->
  		<s:iterator id="index" value="resourcelist">	
  			<tr>
			<td><s:property value="#index.avai"/></td>
			<td><s:property value="#index.vmtype"/></td>
			<td><s:property value="#index.free"/></td>
			</tr>
		</s:iterator>
  </table>
  </body>
</html>
