<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Object admin = request.getSession().getAttribute("admin");
if(null == admin){
%>
	<script>
		alert("您还没有登录，系统正在跳转回登录界面...");
		window.location.href="admin_login.jsp"
	</script>
<%
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'admin_frame.jsp' starting page</title>
    
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
				<frame noresize src="Service!new_register">
				<frameset cols="22%,78%">
					<frame noresize src="admin_navigator.jsp">
					<frame noresize src="content_index2.jsp" name="mainFrame">
				</frameset>
		
				<frame noresize src="user_bottom.jsp">
	 </frameset>
	 <frame src="about:blank"></frame> 
 </frameset>	
</html>
