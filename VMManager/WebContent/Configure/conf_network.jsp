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
    
    <title>My JSP 'conf_network.jsp' starting page</title>
    
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
		function check(object){
			var obj=document.getElementsByTagName("input");
			for(var i=0;i<obj.length;i++){
				if(obj[i].getAttribute("type")=="checkbox")
			   		obj[i].checked=false;
			}
			object.checked=true;
		}
		
		function release(){
			var index = getIndex();
			if (index == null){
				alert("请选择要释放的IP");
			}else{
					$.ajax({
						url:"Network!release?id="+index,
						data:index,
					});
			}
		}
		
		function allocate(){
			$.ajax({
				url:"Network!allocate",
				success:alert("分配成功，请刷新查看！"),
			});
		}
		
		function associate(){
			var index = getIndex();
			if (index == null){
				alert("请选择实例！");
			}else{
					var ip = window.prompt("请输入关联IP：","192.168.9.183");
					$.ajax({
						url:"Network!associate",
						data:"id="+index+"&address="+ip,
						success:function(data){
							setTimeout("window.location.reload()",3000);
						}
					});
			}
		}
		
		function disassociate(){
			var index = getIndex();
			if (index == null){
				alert("请选择实例！");
			}else{
					$.ajax({
						url:"Network!disassociate?id="+index,
						data:index,
					});
			}
		}
		
		function getIndex(){
			var obj=document.getElementsByName("ip");
			for(var i=0;i<obj.length;i++){
				if (obj[i].checked == true){
		   			return i;
		   		}
			}
		}
		
	</script>
  </head>
  
  <body>
     <table width="500" height="61" border="0" align="center" cellpadding="2" cellspacing="2">
  		<tr>&nbsp;</tr>
  		<tr>
  			<form action="Network!show">
  				<td colspan="5">
  					<input type="submit" value="刷新" style="background:#E6EAE9;"/>&nbsp;
  					<input type="submit" value="分配" style="background:#E6EAE9;" onclick="allocate()"/>&nbsp;
  					<input type="submit" value="关联" style="background:#E6EAE9;" onclick="associate()"/>&nbsp;
  					<input type="submit" value="分离" style="background:#E6EAE9;" onclick="disassociate()"/>&nbsp;
  				</td>	
  			</form>
  		</tr>
  		<tr>
  			<td>&nbsp;</td>
  			<th scope="row" abbr="Model" class="spec">Address</th>
  			<th scope="row" abbr="Model" class="spec">Instance_ID</th>
  			<th scope="row" abbr="Model" class="spec">Operation</th>
  		</tr>
  		<s:iterator id="index" value="iplist">
  			<tr>
  			<td><input type="checkbox" id="#index" name="ip" onclick="check(this)"/></td>
			<td><s:property value="#index.address"/></td>
			<td><s:property value="#index.instance_id"/></td>
			<s:if test="#index.instance_id == 'available (admin)'">
				<td><a href="Network!release?address=<s:property value="#index.address"/>">释放</a></td>
			</s:if>	
			
			</tr>
		</s:iterator>
  </table>
  </body>
</html>
