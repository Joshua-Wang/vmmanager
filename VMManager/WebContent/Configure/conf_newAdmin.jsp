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
    
    <title>My JSP 'conf_newAdmin.jsp' starting page</title>
    
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
  
   <body align="center">
  <s:fielderror cssStyle="Color:red">
  </s:fielderror>
<form id="form1" name="form1" method="post" action="Admin!add">
  <table width="50%" height="185" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
    <th colspan="3" scope="col" abbr="Configurations">新增管理员</th>
    </tr>
    <tr>
      <td>用户名：</td>
      <td colspan="2"><label>
        <input name="username" type="text" id="username" />
      </label></td>
    </tr>
    <tr>
      <td>密码：</td>
      <td colspan="2"><label>
        <input name="password" type="password" id="password" />
      </label></td>
    </tr>
    <tr>
      <td>确认密码：</td>
      <td colspan="2"><label>
        <input name="confirm_password" type="password" id="confirm_password" />
      </label></td>
    <tr>
      <td>&nbsp;</td>
      <td width="19%"><label>
        <input type="submit" name="Submit" value="提交" style="background:#E6EAE9;"/>
      </label></td>
      <td width="48%"><label>
        <input type="reset" name="Submit2" value="取消" style="background:#E6EAE9;"/>
      </label></td>
    </tr>
  </table>
</form>
</body>
</html>
