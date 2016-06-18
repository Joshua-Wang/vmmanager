<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Object user = request.getSession().getAttribute("user");
if(user != null){
%>
	<script>
		window.location.href="Service";
	</script>
<%
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user_login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="JavaScript">
		function user_check()
		{
			targetForm=document.forms[0];
			targetForm.action="Login!userCheck";
			targetForm.submit();
		}
			
	</script>
  </head>
  
 <body align="center">
 <s:fielderror cssStyle="Color:red"></s:fielderror>
<form id="form1" name="form1" method="post" action="Login">
  <table width="50%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="3"><div align="center"></div></td>
    </tr>
    <tr>
      <td width="30%">&nbsp;</td>
      <td colspan="2">&nbsp;</td>
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
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><label></label></td>
      <td width="31%"><label>
        
        <div align="left">
          <input type="submit" name="Submit" value="提交" onclick="user_check()"/>
        </div>
      </label></td>
      <td width="46%"><label>
        <input type="reset" name="Submit2" value="重置" />
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
  </table>
</form>
</body>
</html>
