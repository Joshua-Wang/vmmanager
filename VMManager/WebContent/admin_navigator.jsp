<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>DIV+CSS+JS二级树型菜单，展开后刷新无影响</title>
		<style type="text/css">
<!--
body {
	font-family: arial, 宋体, serif;
	font-size: 12px;
}

* {
	margin: 0px;
	padding: 0px;
}

#nav {
	width: 177px;
	line-height: 24px;
	list-style-type: none;
	text-align: left; /*定义整个ul菜单的行高和背景色*/
}

/*==================一级目录===================*/
#nav a {
	width: 177px;
	display: block;
	padding-left: 20px; /*Width(一定要)，否则下面的Li会变形*/
}

#nav li {
	border-bottom: #fff 1px solid; /*下面的一条白边*/
	float: left;
	background-color: #FECFD6;
	color: #DD1336;
	font-weight: bold;
}

#nav li a:hover {
	background: #F85B78; /*一级目录onMouseOver显示的背景色*/
}

#nav a:link {
	color: #DD1336;
	text-decoration: none;
}

#nav a:visited {
	color: #DD1336;
	text-decoration: none;
}

#nav a:hover {
	color: #FFF;
	text-decoration: none;
	font-weight: bold;
}

/*==================二级目录===================*/
#nav li ul {
	list-style: none;
	text-align: left;
}

#nav li ul li {
	background: #ffecef; /*二级目录的背景色*/
	font-weight: normal;
}

#nav li ul a {
	padding-left: 20px;
	width: 177px;
	/* padding-left二级目录中文字向右移动，但Width必须重新设置=(总宽度-padding-left)*/
}

/*下面是二级目录的链接样式*/
#nav li ul a:link {
	color: #666;
	text-decoration: none;
}

#nav li ul a:visited {
	color: #666;
	text-decoration: none;
}

#nav li ul a:hover {
	color: #F3F3F3;
	text-decoration: none;
	font-weight: normal;
	background: #FFAA1C; /* 二级onmouseover的字体颜色、背景色*/
}

/*==============================*/
#nav li:hover ul {
	left: auto;
}

#nav li.sfhover ul {
	left: auto;
}

#content {
	clear: left;
}

#nav ul.collapsed {
	display: none;
}

-->
#PARENT {
	width: 174px;
}
</style>
<script language="JavaScript">
	function logout()
	{
		var isconfirm= window.confirm("确认注销登录？");
		if (isconfirm){
			parent.location.href="admin_login.jsp";
		}
	}
</script>
	</head>
	<body>  <!-- <body bgcolor="#ECFFFF">  -->
		<div id="PARENT">
			<ul id="nav">
				<li>
					<a href="#Menu=ChildMenu1" onClick="DoMenu('ChildMenu1')">虚拟机管理</a>
					<ul id="ChildMenu1" class="collapsed">
						<li>
							<a href="Resource!show" target="mainFrame">云平台资源</a>
						</li>
						<li>
							<a href="Instance!show" target="mainFrame">实例管理</a>
						</li>
						<li>
							<a href="Image!show" target="mainFrame">镜像管理</a>
						</li>
						<li>
							<a href="Volume!show" target="mainFrame">存储管理</a>
						</li>
						<li>
							<a href="Keypair!show" target="mainFrame">密钥管理</a>
						</li>
						<li>
							<a href="Network!show" target="mainFrame">网络管理</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="#Menu=ChildMenu2" onClick="DoMenu('ChildMenu2')">服务管理</a>
					<ul id="ChildMenu2" class="collapsed">
						<li>
							<a href="Service!ShowUserApp" target="mainFrame">服务申请信息</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="#Menu=ChildMenu3" onClick="DoMenu('ChildMenu3')">账号管理</a>
					<ul id="ChildMenu3" class="collapsed">
						<li>
							<a href="Admin!show" target="mainFrame">管理员信息</a>
						</li>
						<li>
							<a href="Configure/conf_newAdmin.jsp" target="mainFrame">添加管理员</a>
						</li>
						<li>
							<a href="javascript:logout()">注销登录</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<script type=text/javascript><!--
var LastLeftID = "";
function menuFix() {
 var obj = document.getElementById("nav").getElementsByTagName("li");
 
 for (var i=0; i<obj.length; i++) {
  obj[i].onmouseover=function() {
   this.className+=(this.className.length>0? " ": "") + "sfhover";
  }
  obj[i].onMouseDown=function() {
   this.className+=(this.className.length>0? " ": "") + "sfhover";
  }
  obj[i].onMouseUp=function() {
   this.className+=(this.className.length>0? " ": "") + "sfhover";
  }
  obj[i].onmouseout=function() {
   this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"), "");
  }
 }
}
function DoMenu(emid)
{
 var obj = document.getElementById(emid); 
 obj.className = (obj.className.toLowerCase() == "expanded"?"collapsed":"expanded");
 if((LastLeftID!="")&&(emid!=LastLeftID)) //关闭上一个Menu
 {
  document.getElementById(LastLeftID).className = "collapsed";
 }
 LastLeftID = emid;
}
function GetMenuID()
{
 var MenuID="";
 var _paramStr = new String(window.location.href);
 var _sharpPos = _paramStr.indexOf("#");
 
 if (_sharpPos >= 0 && _sharpPos < _paramStr.length - 1)
 {
  _paramStr = _paramStr.substring(_sharpPos + 1, _paramStr.length);
 }
 else
 {
  _paramStr = "";
 }
 
 if (_paramStr.length > 0)
 {
  var _paramArr = _paramStr.split("&");
  if (_paramArr.length>0)
  {
   var _paramKeyVal = _paramArr[0].split("=");
   if (_paramKeyVal.length>0)
   {
    MenuID = _paramKeyVal[1];
   }
  }
  /*
  if (_paramArr.length>0)
  {
   var _arr = new Array(_paramArr.length);
  }
  
  //取所有#后面的，菜单只需用到Menu
  //for (var i = 0; i < _paramArr.length; i++)
  {
   var _paramKeyVal = _paramArr[i].split('=');
   
   if (_paramKeyVal.length>0)
   {
    _arr[_paramKeyVal[0]] = _paramKeyVal[1];
   }  
  }
  */
 }
 
 if(MenuID!="")
 {
  DoMenu(MenuID)
 }
}
GetMenuID(); //*这两个function的顺序要注意一下，不然在Firefox里GetMenuID()不起效果
menuFix();
--></script>
</html>
