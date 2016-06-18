<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Object user = request.getSession().getAttribute("user");
if(null == user){
%>
	<script>
		alert("您需要登录才可以访问该页面，系统正在跳转回登录界面...");
		window.location.href="user_login.jsp"
	</script>
<%
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Iaas_apply.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

    <style type="text/css">
<!--
.STYLE4 {font-size: 14px}
-->
    </style>
</head>
  
  <body align="center">
  <s:fielderror cssStyle="Color:red"></s:fielderror>
<form id="form1" name="form1" method="post" action="Service!save">
  <table border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="145">&nbsp;</td>
      <td colspan="2">&nbsp;</td>
      <td width="78">&nbsp;</td>
      <td width="69">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2">申请主机服务：</td>
      <td><a href="javascript:window.open('Iaas_introduction.jsp','Introduction', 'height=500,width=700,top=110,left=260,status=no,toolbar=no,menubar=no,location=no,scrollbars=no');window.location.reload()"><span class="STYLE4">服务介绍</span></a></td>
      <td clospan="2"><a href="Service"><span class="STYLE4">返回主界面</span></a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td colspan="4">&nbsp;</td>
    </tr>
    <tr>
      <td>操作系统：</td>
      <td colspan="2"><label>
        <select name="select">
          <option value="Ubuntu">Ubuntu</option>
          <option value="CenterOS">CenterOS</option>
        </select>
      </label></td>
      <td>&nbsp;</td>
      <td><span class="STYLE4"></span></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td colspan="4">&nbsp;</td>
    </tr>
    <tr>
      <td>主机类型：</td>
      <td colspan="2"><label>
        <select name="select2">
          <option value="Small">Small</option>
          <option value="Medium">Medium</option>
          <option value="Large">Large</option>
          <option value="XLarge">XLarge</option>
          <option value="XXLarge">XXLarge</option>
        </select>
      </label></td>
 		<td>&nbsp;</td>
 		<td><span class="STYLE4"></span></td>   
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td valign="middle">计费方式：</td>
      <td colspan="2" valign="baseline"><label></label>
        <select name="select3">
          <option value="按月计费">按月计费</option>
          <option value="按季度计费">按季度计费</option>
          <option value="按年计费">按年计费</option>
        </select>
      <label></label></td>
      <td>&nbsp;</td>
      <td><span class="STYLE4"></span></td>
    </tr>

    <tr>
      <td>&nbsp;</td>
      <td colspan="4">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td width="93"><label>
        <input type="submit" name="Submit" value="提交" />
      </label></td>
      <td width="94"><label>
        <input type="reset" name="Submit2" value="重置" />
      </label></td>
      <td></td>
      <td><label></label></td>
    </tr>
  </table>
</form>
</body>
</html>
