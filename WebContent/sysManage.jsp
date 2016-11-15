<%@page import="bean.UniversalUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="top.jsp"%><br>
	<%
		if (u_user == null || u_user.getType() == 1 || u_user.getType() == 2) {
			response.sendRedirect("index.jsp");
		}
	%>
	<div align="center">
		<div style="width: 1000px;">
		</div>
	</div>
</body>
</html>