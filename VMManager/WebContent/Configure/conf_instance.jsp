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
    
    <title>My JSP 'configure_instance.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="CSS/table.css">
		<script language="JavaScript" src="js/jquery-1.6.js"></script>
	<script language="JavaScript">
	
		function reboot(){
			var index = getIndex();
			if (index == null){
				alert("请选择重启的实例！");
			}else {
					$.ajax({
						url:"Instance!reboot?id="+index,
						data:index,
						success:alert("Rebooting ..."),
					});
			}
		}
		
		function terminate(){
			var index = getIndex();
			if (index == null){
				alert("请选择终止的实例！");
			}else {
					$.ajax({
						url:"Instance!shut?id="+index,
						data:index,
						success:alert("Shutting down ..."),
					});
			}
		}
		
		function getIndex(){
			var obj=document.getElementsByName("ins");
			for(var i=0;i<obj.length;i++){
				if (obj[i].checked == true){
		   			return i;
		   		}
			}
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
    <table width="700" height="61" border="0" align="center" cellpadding="3" cellspacing="3">
  		<tr>&nbsp;</tr>
  		<tr>
  			<td>&nbsp;</td>
  			<form action="Instance!show">
  				<td><input type="submit" value="刷新" style="background:#E6EAE9;"/></td>
  				<td><input type="submit" value="重启" style="background:#E6EAE9;" onclick="reboot()"/></td>	
  				<td><input type="submit" value="终止" style="background:#E6EAE9;" onclick="terminate()"/></td>
  			</form>
  		</tr>
  		<tr>
  			<td>&nbsp;</td>
  			<th scope="row" abbr="Model" class="spec">InstanceID</th>
  			<th scope="row" abbr="Model" class="spec">EMI</th>
  			<th scope="row" abbr="Model" class="spec">PublicIP</th>
  			<th scope="row" abbr="Model" class="spec">PrivateIP</th>
  			<th scope="row" abbr="Model" class="spec">State</th>
  			<th scope="row" abbr="Model" class="spec">Type</th>
  			<th scope="row" abbr="Model" class="spec">CreatTime</th>
  		</tr>
  		<s:iterator id="index" value="instancelist">
  			<tr>
  			<td><input type="checkbox" id="#index" name="ins" onclick="check(this)"/></td>
			<td><s:property value="#index.instanceid"/></td>
			<td><s:property value="#index.EMI"/></td>
			<td><s:property value="#index.public_dns"/></td>
			<td><s:property value="#index.private_dns"/></td>
			<td><s:property value="#index.state"/></td>
			<td><s:property value="#index.type"/></td>
			<td><s:property value="#index.creat_time"/></td>
			</tr>
		</s:iterator>
  </table>
  </body>
</html>
