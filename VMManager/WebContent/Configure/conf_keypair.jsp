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
    
    <title>My JSP 'conf_keypair.jsp' starting page</title>
    
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
		function add(){
			var name = window.prompt("请输入密钥名称：","mykey");
			if (name){
				$.ajax({
					url:"Keypair!add?keyname="+name,
					data:name,
					success:alert("添加成功，请刷新查看！"),
				});
			}
		}
		
		function show(){
			window.location.reload();
		}
	
		function del(){
			var delindex = getIndex();
			if (delindex == null){
				alert("请选择要删除的密钥！");
			}else {
					$.ajax({
						url:"Keypair!delete?keyid="+delindex,
						data:delindex,
						success:alert("删除成功，请刷新查看！"),
					});
			}
		}
		
		function getIndex(){
			var obj=document.getElementsByName("key");
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
   <table width="594" height="61" border="0" align="center" cellpadding="0" cellspacing="2">
  		<tr>&nbsp;</tr>
  		<tr>
  			<td>&nbsp;</td>
  			<form action="Keypair!show">
  				<td><input type="submit" value="刷新" style="background:#E6EAE9;"/></td>
  				<td>
  					<input type="submit" value="创建" style="background:#E6EAE9;" onclick="add()"/>&nbsp;
  					<input type="submit" value="删除" style="background:#E6EAE9;" onclick="del()"/>
  				</td>	
  			</form>
  		</tr>
  		<tr>
  			<td>&nbsp;</td>
  			<th scope="row" abbr="Model" class="spec">Name</th>
  			<th scope="row" abbr="Model" class="spec">Fingerprint</th>
  		</tr>
  		<s:iterator id="index" value="keypairlist">
  			<tr>
  			<td><input type="checkbox" id="#index" name="key" onclick="check(this)"/></td>
			<td><s:property value="#index.name"/></td>
			<td><s:property value="#index.fingerprint"/></td>
			</tr>
		</s:iterator>
  </table>
  </body>
</html>
