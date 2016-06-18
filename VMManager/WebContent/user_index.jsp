<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Object user = request.getSession().getAttribute("user");
if(null == user){
%>
	<script>
		alert("您还没有登录，系统正在跳转回登录界面...");
		window.location.href="user_frame.jsp"
	</script>
<%
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user_index.jsp' starting page</title>
    
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
		
		function del(){
			var delindex = getIndex();
			if (delindex == null){
				alert("请选择服务！");
			}else {
					$.ajax({
						url:"Service!drop?deleteid="+delindex,
						data:delindex,
						success:alert("删除成功，请刷新查看！"),
					});
			}
		}
		
		function launch(){	
			
		}
		
		function shut(){
			
		}
		
		function getIndex(){
			var obj=document.getElementsByName("service");
			for(var i=0;i<obj.length;i++){
				if (obj[i].checked == true){
		   			return i;
		   		}
			}
		}
	</script>
	
  </head>
  
  <body>
  欢迎用户<s:property value="#session.user"/>登录！
  <br><br>
  <form action="Service!execute">
  	  <input type="submit" value="刷新" style="background:#E6EAE9;">
	  <input type="submit" value="丢弃服务" style="background:#E6EAE9;" onclick="del()"/>
	  <input type="button" value="注销登录" style="background:#E6EAE9;" onclick="window.location.href='Login!UserLogout'"/>
  </form>
  <table width="755" height="61" border="0" align="center" cellpadding="2" cellspacing="2">
  		<tr>
  			<th scope="row" abbr="Model" class="spec">&nbsp;</th>
  			<th scope="row" abbr="Model" class="spec">主机大小</th>
  			<th scope="row" abbr="Model" class="spec">操作系统</th>
  			<th scope="row" abbr="Model" class="spec">计费方式</th>
  			<th scope="row" abbr="Model" class="spec">使用期限</th>
  			<th scope="row" abbr="Model" class="spec">主机IP</th>
  			<th scope="row" abbr="Model" class="spec">主机状态</th>
  		</tr>
  		<s:iterator id="index" value="UserIndexlist">
  			<tr>
  			<td height="28"><input type="checkbox" name="service" id="#index" onclick="check(this)"/></td>
			<td><s:property value="#index.hostSize"/></td>
			<td><s:property value="#index.hostOs"/></td>
			<td><s:property value="#index.payMethod"/></td>
			<td><s:property value="#index.timeUsed"/></td>
			<td><s:property value="#index.instanceIp"/></td>
			<td>
				<s:property value="#index.instanceState"/>
				<s:if test="#index.instanceState == '待审核'"></s:if>
				<s:if test="#index.instanceState == '审核通过'"></td>
				<td>
					 <a href="ServiceAdmin!launch?id=<s:property value="#index.id"/>">启动</a>
				</s:if>
				<s:if test="#index.instanceState == '运行中'"></td>
				<td>
					  <a href="ServiceAdmin!shut?id=<s:property value="#index.id"/>">停止</a>
				</s:if>
				<s:if test="#index.instanceState == '已停止'"></td>
				<td>
					  <a href="ServiceAdmin!launch?id=<s:property value="#index.id"/>">启动</a>
				</s:if>
			</td>
			</tr>
		</s:iterator>
  </table>
  <br><a href="Iaas_apply.jsp">继续注册主机服务...</a>
  </body>
</html>
