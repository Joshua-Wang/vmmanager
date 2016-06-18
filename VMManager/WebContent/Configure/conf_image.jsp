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
    
    <title>My JSP 'conf_images.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="CSS/table.css">
	<script language="JavaScript">
		function del(){
			targetForm = document.forms[0];
			targetForm.action="Image!delete";
			targetForm.submit();
		}
		
		function check(object){
			var obj=document.getElementsByTagName("input");
			for(var i=0;i<obj.length;i++){
				if(obj[i].getAttribute("type")=="checkbox")
			   		obj[i].checked=false;
			}
			object.checked=true;
		}
	</script>
  </head>
  
  <body>
    <table width="594" height="61" border="0" align="center" cellpadding="2" cellspacing="2">
  		<tr>
  			<td>&nbsp;</td>
  			<form action="Image!show">
  				<td><input type="submit" value="刷新" style="background:#E6EAE9;"/></td>
  			</form>
  		</tr>
  		<tr>
  			<td>&nbsp;</td>
  			<th scope="row" abbr="Model" class="spec">ID</th>
  			<th scope="row" abbr="Model" class="spec">Manifest</th>
  			<th scope="row" abbr="Model" class="spec">State</th>
  			<th scope="row" abbr="Model" class="spec">Owner</th>
  			<th scope="row" abbr="Model" class="spec">Visibility</th>
  			<th scope="row" abbr="Model" class="spec">Architecture</th>
  		</tr>
  		<s:iterator id="index" value="imagelist">
  			<tr>
  			<td><input type="checkbox" id="#index" name="img" onclick="check(this)"/></td>
			<td><s:property value="#index.iamgeid"/></td>
			<td><s:property value="#index.manifest"/></td>
			<td><s:property value="#index.availble"/></td>
			<td><s:property value="#index.owner"/></td>
			<td><s:property value="#index.visibility"/></td>
			<td><s:property value="#index.architecture"/></td>
			</tr>
		</s:iterator>
  </table>
  </body>
</html>
