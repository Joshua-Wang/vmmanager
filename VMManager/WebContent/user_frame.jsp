<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user_frame.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <frameset cols="*,900,*" border=0>
	  <frame src="about:blank"></frame>
	  <frameset rows="20%,65%,15%">
				<frame src="user_top.jsp">
		
				<frameset cols="23%,77%" border=0>
					<frame noresize src="user_left.jsp">
					<frame noresize src="content_index.jsp" name="mainFrame">
				</frameset> 
				<frame noresize src="user_bottom.jsp" style="padding:0;">
		 
	 </frameset>
	 <frame src="about:blank"></frame> 
 </frameset>	
 <!-- <iframe src="user_bottom.jsp" style="padding:0;"></iframe> -->
</html>
