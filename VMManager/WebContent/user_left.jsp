<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user_left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="CSS/styles_rg.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
    	<div class="sidenav">

			<h2>新闻热点</h2>
			<ul>
				<li><a href="http://roll.sohu.com/20120411/n340286442.shtml" target="javascript:window.parent">云计算：下一个百年商业平台</a></li>
    			<li><a href="http://it.sohu.com/20120411/n340239980.shtml" target="javascript:window.parent">惠普与亚马逊开战</a></li>
    			<li><a href="http://digi.tech.qq.com/a/20120411/000214.htm" target="javascript:window.parent">2012英特尔信息技术峰会</a></li>
    			<li><a href="http://labs.chinamobile.com/focus/cloudcomputing2/search1" target="javascript:window.parent">第二届中国云计算大会</a></li>
    			<li><a href="http://www.cnbeta.com/articles/180370.htm" target="javascript:window.parent">云主机初体验（盛大和阿里）</a></li>
			</ul>

			<h2>相关链接</h2>
			<ul>
			<li><a href="http://www.iscas.ac.cn/" target="javascript:window.parent">中国科学院软件研究所</a></li>
    			<li><a href="http://itechs.iscas.ac.cn/en/index.htm" target="javascript:window.parent">互联网软件技术实验室</a></li>
    			<li><a href="http://open.eucalyptus.com/" target="javascript:window.parent">Eucalyptus社区</a></li>
			</ul>
	  </div>
  </body>
</html>
