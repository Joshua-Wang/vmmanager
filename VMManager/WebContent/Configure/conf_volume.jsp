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
    
    <title>My JSP 'conf_volume.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" type="text/css" href="CSS/table.css">
	<style>
			/**
			* 弹出层css
			*/
			.pop {
				width: 80%;
				border: 1px #96D1DF solid;
				background: #fff;
				padding: 1px;
				color: #333;
				position: absolute;
				top: 15%;
				left: 15%;
				height: auto;
				z-index: 10
			}
			
			/**
			* 弹出层css
			*/
			.pop_ {
				width: 80%;
				border: 1px #96D1DF solid;
				background: #fff;
				padding: 1px;
				color: #333;
				position: absolute;
				top: 40%;
				left: 50%;
				height: auto;
				z-index: 10
			}
			
			.pop_title {
				float: left;
				width: 100%;
				height: 30px;
				line-height: 30px;
				/* background: #ecf9ff url ('../images/title_move.gif') center no-repeat; */
				background: #ecf9ff;
				border-bottom: 1px #d3ecf3 solid;
				color: #444;
				font-weight: bold
			}
			
			.pop_title_left {
				float: left;
				width: 90%;
				overflow: hidden;
				text-indent: 6px;
				cursor: move
			}
			
			.pop_title_left img {
				float: left;
				border: 0;
				margin: 10px 0 0 5px
			}
			
			.pop_title_right {
				width: 5%;
				float: right;
				text-align: right;
				cursor: pointer
			}
			
			.pop_title_right_print {
				width: 3%;
				float: left;
				text-align: right
			}
			
			.pop_title_right img {
				margin: 5px 10px 5px 10px;
				cursor: pointer
			}
			
			.pop_title_right_print img {
				margin: 5px 10px 5px 10px;
				cursor: pointer
			}
			
			.pop_content {
				float: left;
				width: 100%;
				margin: 1px 0 0 0;
				font-size: 14px
			}
			
			.pop_function {
				float: left;
				width: 100%;
				height: 30px;
				line-height: 30px;
				border-top: 1px #fff solid;
				text-align: center
			}
			
			.pop_search {
				width: 100%;
				height: 35px;
				border-top: 1px #fff solid;
				text-align: center;
				font-size: 12px;
				font-weight: bold;
				margin: 5px 0 5px 0;
				border-bottom: 3px #96D1DF dotted;
			}
			
			.pop_page {
				width: 100%;
				height: 25px;
				text-align: center;
				font-size: 12px;
				border-top: 3px #96D1DF dotted;
				vertical-align: middle;
			}
		</style>
	
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
		
		function creat(){
			var input = window.prompt("请输入volume大小：","10");
			var vol_size = parseInt(input);
			if (vol_size){
				$.ajax({
					url:"Volume!creat?size="+vol_size,
					data:vol_size,
					success:alert("创建成功，请刷新查看！"),
				});
			}
		}
		
		function del(){
			var delindex = getIndex();
			if (delindex == null){
				alert("请选择要删除的volume！");
			}else {
					$.ajax({
						url:"Volume!delete?volid="+delindex,
						data:delindex,
						success:alert("删除成功，请刷新查看！"),
					});
			}
		}
		
		function getIndex(){
			var obj=document.getElementsByName("vol");
			for(var i=0;i<obj.length;i++){
				if (obj[i].checked == true){
		   			return i;
		   		}
			}
		}
		
		function attach(){
			var instanceid = document.getElementsByName("instanceid")[0].value;
			var volumeid = document.getElementsByName("volumeid")[0].value;
			var device = document.getElementsByName("device")[0].value;
			//alert(instanceid+volumeid+device);
			$.ajax({
				url:"Volume!attach",
				data:"instanceid="+instanceid+"&volumeid="+volumeid+"&device="+device,
				success:alert("请刷新查看！"),
			});
		}
		
		function detach(){
			var delindex = getIndex();
			if (delindex == null){
				alert("请选择volume！");
			}else {
					$.ajax({
						url:"Volume!detach?volid="+delindex,
						data:delindex,
					});
			}
		}
		
		function getxy(e) {
			var a = new Array();
			var t = e.offsetTop;
			var l = e.offsetLeft;
			var w = e.offsetWidth;
			var h = e.offsetHeight;
			while (e = e.offsetParent) {
				t += e.offsetTop;
				l += e.offsetLeft;
			}
			a[0] = t;
			a[1] = l;
			a[2] = w;
			a[3] = h;
			return a;
		}
		//----------------------------------
		var DragForAll = {};
		function _enableDragForAll(e, toMoveObj, obj2, obj3) {
			if (DragForAll.o) {
				return false;
			}
			var clickObj = document.getElementById(toMoveObj);
			if (!clickObj) {
				return;
			}
			DragForAll.o = clickObj;
			if (document.getElementById(obj2)) {
				DragForAll.p = document.getElementById(obj2);
			}
			DragForAll.xy = getxy(DragForAll.o);
			e = e || event;
			if (!clickObj.style.left) {
				DragForAll.xx = new Array((e.x - DragForAll.xy[1]), (e.y - DragForAll.xy[0]));
			} else {
				DragForAll.xgap = parseInt(clickObj.style.left.substring(0, clickObj.style.left.indexOf("px")));
				DragForAll.ygap = parseInt(clickObj.style.top.substring(0, clickObj.style.top.indexOf("px")));
				DragForAll.xx = new Array((e.x - DragForAll.xgap), (e.y - DragForAll.ygap));
				DragForAll.xgap -= DragForAll.xy[1];
				DragForAll.ygap -= DragForAll.xy[0];
			}
			DragForAll.fitToCont = obj3;
			if (obj3) {
				DragForAll.fitArea = getxy(DragForAll.fitToCont);
			}
			return false;
		}
		function _DragObjForAll(e) {
			if (!DragForAll.o) {
				return;
			}
			e = e || event;
			var old_left = e.x - DragForAll.xx[0];
			var old_top = e.y - DragForAll.xx[1];
			if (DragForAll.fitToCont) {
				if ((old_left - DragForAll.xgap) - DragForAll.fitArea[1] <= 0 || old_top - DragForAll.ygap - DragForAll.fitArea[0] <= 0) {
					return;
				}
				if (old_left - DragForAll.xgap + DragForAll.xy[2] >= DragForAll.fitArea[1] + DragForAll.fitArea[2] || old_top - DragForAll.ygap + DragForAll.xy[3] >= DragForAll.fitArea[0] + DragForAll.fitArea[3]) {
					return;
				}
			}
			DragForAll.o.style.left = old_left + "px";
			DragForAll.o.style.top = old_top + "px";
			if (DragForAll.p) {
				DragForAll.p.style.left = (old_left + 5) + "px";
				DragForAll.p.style.top = (old_top + 5) + "px";
			}
		}
		function _releaseDragObjForAll(e) {
			DragForAll = {};
		}
		document.onmousemove = function (e) {
			_DragObjForAll(e);
		};
		document.onmouseup=function(e){
			_releaseDragObjForAll(e);
			e=e||event;	
		}
		
	</script>
  </head>
  
  <body>
    <table width="700" height="61" border="0" align="center" cellpadding="3" cellspacing="3">
  		<tr>&nbsp;</tr>
  		<tr>
  			<td></td>
  			<form action="Volume!show">
  				<td colspan="5">
  					<input type="submit" value="刷新" style="background:#E6EAE9;"/>&nbsp;
  					<input type="submit" value="创建" onclick="creat()" style="background:#E6EAE9;"/>&nbsp;
  					<input type="submit" value="删除" onclick="del()" style="background:#E6EAE9;"/>&nbsp;
  					<input type="button" value="连入实例" style="background:#E6EAE9;" onclick="xingZQYTree.style.display='';xingZQYTree.style.top=event.clientY;xingZQYTree.style.left=event.clientX">&nbsp;
  					<input type="submit" value="连出实例" onclick="detach()" style="background:#E6EAE9;">
  				</td>	
  			</form>
  			<td colspan="4">&nbsp;</td>
  		</tr>
  		<tr>
  			<td>&nbsp;</td>
  			<th scope="row" abbr="Model" class="spec">VolumeID</th>
  			<th scope="row" abbr="Model" class="spec">Size</th>
  			<th scope="row" abbr="Model" class="spec">Zone</th>
  			<th scope="row" abbr="Model" class="spec">Status</th>
  			<th scope="row" abbr="Model" class="spec">Creation Time</th>
  			<th scope="row" abbr="Model" class="spec">Attachment</th>
  			<th scope="row" abbr="Model" class="spec">Instance ID</th>
  			<th scope="row" abbr="Model" class="spec">Device</th>
  			<th scope="row" abbr="Model" class="spec">Attach Time</th>
  		</tr>
  		<s:iterator id="index" value="volumelist">
  			<tr>
  			<td><input type="checkbox" id="#index" name="vol" onclick="check(this)"/></td>
			<td><s:property value="#index.volume_id"/></td>
			<td><s:property value="#index.volume_size"/>G</td>
			<td><s:property value="#index.zone"/></td>
			<td><s:property value="#index.status"/></td>
			<td><s:property value="#index.creat_time"/></td>
			<td><s:property value="#index.attachment"/></td>
			<td><s:property value="#index.instance_id"/></td>
			<td><s:property value="#index.device"/></td>
			<td><s:property value="#index.attach_time"/></td>
			</tr>
		</s:iterator>
  </table>
  
  <div id="xingZQYTree" class="pop"
			style="display: none; width: 330px; overflow: auto; position: absolute; background-color: #FFFFFF; border: 1px solid #0099CC; padding-left: 0px">
			<div id="pop_title" class="pop_title"
				onmousedown="_enableDragForAll(event,'xingZQYTree');" title='按住鼠标可随意拖动此窗口'>
				<div class="pop_title_left" style="font-size: 14px">
					&nbsp;&nbsp;Attach a volume to an instance
				</div>
				<div class="pop_title_right">
					<label title="关闭此窗口" onclick="xingZQYTree.style.display='none';">
						&nbsp;X&nbsp;
					</label>
				</div>
			</div>
			<div class="pop_content">
			  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			    <tr>
			      <td colspan="3"><div align="center"></div></td>
			    </tr>
			    <tr>
			      <td width="35%">Instance ID</td>
			      <td colspan="2">
			      	 <!--  <input name="instanceid" type="text" id="instanceid" /> -->
			      		<select name="instanceid" style="background:#E6EAE9;" >
			       			<s:iterator id="index" value="volinstancelist">
			       				<s:if test="#index.state== 'running'">
          						<option value=<s:property value="#index.instanceid"/>><s:property value="#index.instanceid"/></option>
          						</s:if>
          					</s:iterator>
        				</select>
			      
			      </td>
			    </tr>
			    <tr>
			      <td>Volume ID</td>
			      <td colspan="2">
			        <!-- <input name="volumeid" type="text" id="instanceid" /> -->
			        <select name="volumeid" style="background:#E6EAE9;" >
			       			<s:iterator id="index" value="volumelist">
			       				<s:if test="#index.status == 'available'">
          						<option value=<s:property value="#index.volume_id"/>><s:property value="#index.volume_id"/></option>
          						</s:if>
          					</s:iterator>
        				</select>
			      </td>
			    </tr>
			    <tr>
			      <td>Device </td>
			      <td colspan="2">
			       		<input name="device" type="text" id="device" />
			       		
			     </td>
			    </tr>
			    <tr>
			      <td><label></label></td>
			      <td width="31%"><label>
			        
			        <div align="left">
			          <input type="button" name="Submit" value="连入" style="background:#E6EAE9;" onclick="attach()"/>
			        </div>
			      </label></td>
			      <td width="46%"><label>
			        <input type="button" name="Submit2" value="取消" style="background:#E6EAE9;" onclick="xingZQYTree.style.display='none';"/>
			      </label></td>
			    </tr>
			  </table>
			</div>
		</div>
  </body>
</html>
