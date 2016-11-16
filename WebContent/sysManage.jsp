<%@page import="bean.UniversalUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
margin: 0;
padding: 0;
}
#left-list{
position: absolute;
top: 120px;
width: 250px;
}
.left-list{
padding-top: 50px;
padding-bottom: 10px;
width: 250px;
text-align: center;
}
</style>
</head>
<body>
	<%@include file="top.jsp"%>
	<div align="center">
		<div style="width: 1000px;">
			<div id="left-list">
			<table>
				<tr><td class="left-list">普通用户管理</td></tr>
				<tr><td class="left-list">管路员管理</td></tr>
				<tr><td class="left-list">图书类别管理</td></tr>
				<tr><td class="left-list">图书信息管理</td></tr>
			</table>
			</div>
		</div>
	</div>
</body>
</html>