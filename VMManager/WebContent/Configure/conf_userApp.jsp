<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'conf_userApp.jsp' starting page</title>

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
			var docEle = function() {
			return document.getElementById(arguments[0]) || false;
			}
			
			function detail(){
				var index = getIndex();
				if (index == null){
					alert("请选择公司！");
				}else {
					$.ajax({
						url:"Service!detail?id="+index,
						data:index,
						success:function (data){
							var array = data.split("$");
							var strHTML = "公司名称："+array[0]+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
							strHTML += "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
							strHTML += "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
							strHTML += "<a href='javascript:window.location.reload();' onclick='remove()'>关闭</a><br>";
							strHTML += "公司规模："+array[1]+"<br>";
							strHTML += "公司地址："+array[2]+"<br>";
							strHTML += "公司邮编："+array[3]+"<br>";
							strHTML += "公司电话："+array[4]+"<br>";
							strHTML += "联系人姓名："+array[5]+"<br>";
							strHTML += "联系人电话："+array[6]+"<br>";
							strHTML += "联系人Email："+array[7]+"<br>";
							strHTML += "联系人部门："+array[8]+"<br>";
							strHTML += "联系人职位："+array[9]+"<br>";
							openNewDiv('newDiv',strHTML);
						}
					});
				}
			}
			function openNewDiv(_id,strHTML) {
					var m = "mask";
					if (docEle(_id)) document.removeChild(docEle(_id));
					if (docEle(m)) document.removeChild(docEle(m));
					// 新激活图层
					var newDiv = document.createElement("div");
					newDiv.id = _id;
					newDiv.style.position = "absolute";
					newDiv.style.zIndex = "9999";
					newDiv.style.width = "400px";
					newDiv.style.height = "200px";
					newDiv.style.top = "50px";
					newDiv.style.left = (parseInt(document.body.scrollWidth) - 500) / 2 + "px"; // 屏幕居中
					newDiv.style.background = "#EFEFEF";
					newDiv.style.border = "1px solid #860001";
					newDiv.style.padding = "5px";
					
					newDiv.innerHTML =strHTML;
					document.body.appendChild(newDiv);
					// mask图层
					var newMask = document.createElement("div");
					newMask.id = m;
					newMask.style.position = "absolute";
					newMask.style.zIndex = "1";
					newMask.style.width = document.body.scrollWidth + "px";
					newMask.style.height = document.body.scrollHeight + "px";
					newMask.style.top = "0px";
					newMask.style.left = "0px";
					//newMask.style.background = "#000";
					newMask.style.filter = "alpha(opacity=40)";
					newMask.style.opacity = "0.40";
					document.body.appendChild(newMask);
					// 关闭mask和新图层
					/*
					var newA = document.createElement("a");
					newA.href = "#";
					newA.innerHTML = "关闭";
					newA.onclick = function() {
					  document.body.removeChild(docEle(_id));
					  document.body.removeChild(docEle(m));
					  return false;
					}
					newDiv.appendChild(newA);
					*/
				}
			
			function remove(){
				document.body.removeChild(docEle(_id));
				  document.body.removeChild(docEle(m));
				  return false;
			}
			
			function grant(){
				var index = getIndex();
				if (index == null){
					alert("请选择服务申请！");
				}else {
						$.ajax({
							url:"Service!grant?id="+index,
							data:index,
							success:alert("授权成功，请刷新查看！"),
						});
				}
			}
			
			function drop(){
				var index = getIndex();
				if (index == null){
					alert("请选择服务申请！");
				}else {
						$.ajax({
							url:"Service!admin_drop?deleteid="+index,
							data:index,
							success:alert("服务终止成功！"),
						});
				}
			}
			
			function getIndex(){
				var obj=document.getElementsByName("chk");
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
		<table width="800" height="61" border="0" align="center"
			cellpadding="2" cellspacing="2">
			<tr>
				<td>
				</td>
				<td>
					<input type="button" value="刷新" style="background:#E6EAE9;" onClick="window.location.href='Service!ShowUserApp'"/>
				</td>
				<td>
					<input type="button" value="查看公司信息" style="background:#E6EAE9;"onClick="detail()"/>
				</td>
				<td>
					<input type="button" value="审核通过" style="background:#E6EAE9;" onClick="grant()"/>
				</td>
				<td>
					<input type="button" value="终止服务" style="background:#E6EAE9;" onClick="drop()"/>
				</td>
			</tr>
			<tr>
				<td height="35">
					&nbsp;
				</td>
				<th scope="row" abbr="Model" class="spec">公司名称</th>
				<th scope="row" abbr="Model" class="spec">主机大小</th>
				<th scope="row" abbr="Model" class="spec">操作系统</th>
				<th scope="row" abbr="Model" class="spec">计费方式</th>
				<th scope="row" abbr="Model" class="spec">使用期限</th>
				<th scope="row" abbr="Model" class="spec">主机IP</th>
				<th scope="row" abbr="Model" class="spec">主机状态</th>
			</tr>

			<s:iterator id="index" value="userApplist">
				<tr>
					<td height="28">
						<input type="checkbox" id="#index" name="chk" onclick="check(this)"/>
					</td>
					<td>
						<s:property value="#index.companyName" />
					</td>
					<td>
						<s:property value="#index.hostSize" />
					</td>
					<td>
						<s:property value="#index.hostOs" />
					</td>
					<td>
						<s:property value="#index.payMethod" />
					</td>
					<td>
						<s:property value="#index.timeUsed" />
					</td>
					<td>
						<s:property value="#index.instanceIp" />
					</td>
					<td>
						<s:property value="#index.instanceState" />
					</td>
				</tr>
			</s:iterator>
		</table>
	</body>
</html>
