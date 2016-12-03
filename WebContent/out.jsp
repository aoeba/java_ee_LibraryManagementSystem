<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sos图书管理系统-退出</title>
</head>
<body>
	<div align="center">
		<div style="width: 1000px; position: relative; top: 100px;">
			<%
				session.removeAttribute("u_user");
			%>
			你已经退出！<a href="index.jsp">返回首页</a>
		</div>
	</div>
</body>
</html>