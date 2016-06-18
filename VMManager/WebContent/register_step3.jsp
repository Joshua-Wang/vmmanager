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
    
    <title>My JSP 'register_step3.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	function step3(){
				targetForm = document.forms[0];
				targetForm.action="Register!finish_step3";
				targetForm.submit();
			}

	function step3_back()
	{
		targetForm = document.forms[0];
		targetForm.action="Register!step3_back";
		targetForm.submit();
	}
	</script>
  </head>
  
  <body align="center">
  <s:fielderror cssStyle="Color:red">
  </s:fielderror>
<form id="form1" name="form1" method="post" action="Register">
  <table width="50%" height="185" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3">Register Step3: 登录设置</td>
    </tr>
    <tr>
      <td width="40%">&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td>用户名：</td>
      <td colspan="2"><label>
        <input name="username" type="text" id="username" />
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td colspan="2"><label></label></td>
    </tr>
    <tr>
      <td>密码：</td>
      <td colspan="2"><label>
        <input name="password" type="password" id="password" />
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td colspan="2"><label></label></td>
    </tr>
    <tr>
      <td>确认密码：</td>
      <td colspan="2"><label>
        <input name="confirm_password" type="password" id="confirm_password" />
      </label></td>
    </tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td width="19%"><label>
        <input type="submit" name="Submit" value="提交" onclick="step3()"/>
      </label></td>
      <td width="48%"><label>
        <input type="submit" name="Submit2" value="返回" onclick="step3_back()"/>
      </label></td>
    </tr>
     <tr>
      <td>&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td colspan="2"><a href="Iaas_apply.jsp">继续注册主机服务...</a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
  </table>
</form>
</body>
</html>
