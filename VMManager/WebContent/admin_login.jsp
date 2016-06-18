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
    
    <title>My JSP 'user_login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="CSS/login.css">

	<script language="JavaScript">
		function admin_check()
		{
			targetForm=document.forms[0];
			targetForm.action="Login!adminCheck";
			targetForm.submit();
		}
			
	</script>
  </head>
  
 <body>
 <div class="container">
 	<div class="img">
 		<img src="images/admin1.png" width="300px" height="200px">
 	</div>
 	<div class="form">
<form id="form1" name="form1" method="post" action="Login">
  <table width="40%" border="0" align="center" cellpadding="0" cellspacing="0">
    
    <tr>
      <td width="20%">&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3"><div align="left"><h4>云平台管理员登录</h4></div></td>
    </tr>
    <tr>
      <td>用户名：</td>
      <td colspan="2"><label>
        <input name="admin_username" type="text" id="username" />
      </label></td>
    </tr>
    <tr>
      <td>密码：</td>
      <td colspan="2"><label>
        <input name="admin_password" type="password" id="password" />
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
        
        <div>
          <input type="submit" name="Submit" value="提交" onclick="admin_check()"/>
        </div>
      </label></td>
      <td width="46%"><label>
        <input type="reset" name="Submit2" value="重置" />
      </label></td>
    </tr>
    <tr>
      <td colspan=3><s:fielderror cssStyle="Color:red; margin-top:10px;"></s:fielderror></td>
    </tr>
  </table>
</form>
 	</div>
 </div>
 
</body>
</html>
