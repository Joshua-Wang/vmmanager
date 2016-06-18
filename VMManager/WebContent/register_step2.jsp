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

		<title>My JSP 'register_step2.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script type="text/javascript">
		function step2()
		{
			targetForm = document.forms[0];
			targetForm.action="Register!finish_step2";
			targetForm.submit();
		}
		function step2_back()
		{
			targetForm = document.forms[0];
			targetForm.action="Register!step2_back";
			targetForm.submit();
		}
		
	</script>
	</head>

	<body align="center">
		<s:fielderror cssStyle="Color:red"></s:fielderror>
		<form id="form1" name="form1" method="post" action="Register">
			<table width="60%" height="185" border="0" align="center"
				cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="3">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="3">
						Register Step2:联系人基本信息：
					</td>
				</tr>
				<tr>
					<td width="40%">
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						姓名：
					</td>
					<td colspan="2">
						<label>
							<input name="contact_name" type="text" id="contact_name" />
						</label>
					</td>
				</tr>
				<tr>
					<td>
						联系电话：
					</td>
					<td colspan="2">
						<label>
							<input name="contact_telphone" type="text" id="contact_telphone" />
						</label>
					</td>
				</tr>
				<tr>
					<td>
						Email：
					</td>
					<td colspan="2">
						<label>
							<input name="contact_email" type="text" id="contact_email" />
						</label>
					</td>
				</tr>
				<tr>
					<td>
						部门：
					</td>
					<td colspan="2">
						<label>
							<input name="contact_department" type="text"
								id="contact_department" />
						</label>
					</td>
				</tr>
				<tr>
					<td>
						职位：
					</td>
					<td colspan="2">
						<label>
							<input name="contact_title" type="text" id="contact_title" />
						</label>
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
					<td width="22%">
						<label>
							<input type="submit" name="Submit" value="下一步" onclick="step2()" />
						</label>
					</td>
					<td width="48%">
						<label>
							<input type="submit" name="Submit2" value="返回"
								onclick="step2_back()" />
						</label>
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
