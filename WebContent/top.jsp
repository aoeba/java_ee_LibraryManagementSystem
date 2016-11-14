<%@page import="bean.UniversalUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	border: 0;
}
</style>
</head>
<body>
	<div style="" align="center">
		<div
			style="width: 1000px; background-image: url('img/top-back.png'); height: 120px;"
			align="right">
			<div>
				<%
					UniversalUser u_user = (UniversalUser) session.getAttribute("u_user");
					if (u_user == null) {
				%>
				<span
					style="font-size: 20px; color: #FF5809; position: relative; top: 93px; text-align: right;">您还未登录，请先<a
					href="#">登录</a>！
				</span>
				<%
					} else {
						if (u_user.getType() == 1) {
				%>
				<span
					style="font-size: 20px; color: red; position: relative; top: 93px; text-align: right;">
					你好,<%=u_user.getName()%>,<a href="#">个人信息</a>！
				</span>
				<%
					}
				%>
				<%
					if (u_user.getType() == 2) {
				%>
				<span
					style="font-size: 20px; color: red; position: relative; top: 93px; text-align: right;">
					你好,<%=u_user.getName()%>,<a href="#">管理后台</a>！
				</span>
				<%
					}
				%>
				<%
					if (u_user.getType() == 3) {
				%>
				<span
					style="font-size: 20px; color: red; position: relative; top: 93px; text-align: right;">
					你好,<%=u_user.getName()%>,<a href="#">管理后台</a>！
				</span>
				<%
					}
					}
				%>
			</div>
		</div>
	</div>
</body>
</html>