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
    
    <title>My JSP 'register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function step1(){
				targetForm = document.forms[0];
				targetForm.action="Register!finish_step1";
				targetForm.submit();
			}
	</script>
  </head>
  
  <body align="center">
  <s:fielderror cssStyle="Color:red"></s:fielderror>
<form id="form1" name="form1" method="post" action="Register">
  <table width="50%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="40%">&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3">Register Step1:公司基本信息： </td>
    </tr>
    <tr>
      <td width="40%">&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td>公司名称：</td>
      <td colspan="2"><label>
        <input name="company_name" type="text" id="company_name" />
      </label></td>
    </tr>
    <tr>
      <td>公司规模：</td>
      <td colspan="2"><label>
        <select name="company_size" id="company_size">
          <option value="1">100人以下</option>
          <option value="2" selected="selected">100~200人</option>
          <option value="3">200~500人</option>
          <option value="4">500人以上</option>
        </select>
      </label></td>
    </tr>
    <tr>
      <td>公司地址：</td>
      <td colspan="2"><label>
        <input name="company_location" type="text" id="company_location" />
      </label></td>
    </tr>
    <tr>
      <td>公司邮编：</td>
      <td colspan="2"><label>
        <input name="company_postcode" type="text" id="company_postcode" />
      </label></td>
    </tr>
    <tr>
      <td>联系电话：</td>
      <td colspan="2"><label>
        <input name="company_phone" type="text" id="company_phone" />
      </label></td>
    </tr>
    <tr>
      <td width="40%">&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td width="22%"><label>
        <input type="submit" value="下一步" onclick="step1()"/>
      </label></td>
      <td width="48%"><label>
        <input type="reset" name="Submit2" value="重置" />
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td colspan="2">&nbsp;</td>
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
