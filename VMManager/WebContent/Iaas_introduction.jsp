<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Iaas_introduction.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <h3 align="center">客户您好,欢迎您申请我们的云服务。</h3>
    申请主机服务您需要填写的信息有:<br>
    操作系统：您可以选择主机的操作系统。<br>
    主机类型：您可以选择申请主机的大小，具体大小如下所示：<br>
    <table cellpadding="3" cellspacing="3">
    <tr>	
    	<td>Type</td>
    	<td>CPUs</td>
    	<td>Memory(MB)</td>
    	<td>Disk(GB)</td>
    </tr>
    <tr>
    	<td>Small</td>
    	<td>1</td>
    	<td>512</td>
    	<td>2</td>
    </tr>
    <tr>
    	<td>Medium</td>
    	<td>1</td>
    	<td>1024</td>
    	<td>2</td>
    </tr>
    <tr>
    	<td>Large</td>
    	<td>2</td>
    	<td>1536</td>
    	<td>5</td>
    </tr>
    <tr>
    	<td>XLarge</td>
    	<td>4</td>
    	<td>3072</td>
    	<td>10</td>
    </tr>
    <tr>
    	<td>XXLarge</td>
    	<td>4</td>
    	<td>3072</td>
    	<td>20</td>
    </tr>
    </table>
    <font color = "red">推荐配置：Ubuntu OS : Small; CenterOS : Large。</font>
     <table cellpadding="3" cellspacing="5">
     <tr>
     	<td colspan="2">计费方式：我们的服务共有以下三种计费方式：</td>
     </tr>
    <tr>	
    	<td>按月计费</td>
    	<td>按月付费，该月内可以任意使用申请的虚拟机</td>
    </tr>
    <tr>
    	<td>按季度计费</td>
    	<td>按季度付费，该季度内可以任意使用申请的虚拟机</td>
    </tr>
    <tr>
    	<td>按年计费</td>
    	<td>按年付费，该年内可以任意使用申请的虚拟机</td>
    </tr>
    </table>
  </body>
</html>





