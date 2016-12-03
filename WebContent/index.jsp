<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="lmsDB.*,java.sql.ResultSet,bean.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sos图书管理系统</title>
<link href="style/index.css" type="text/css" rel="stylesheet">

</head>
<body>
	<%@include file="top.jsp"%><br>
	<%!int curPage = 1;
	int pageCount;%>
	<div id="all">
		<table id="type">
			<% 
				Comdb.getConn();
				ResultSet rs = Comdb.select("select type_name,type_id from type", null);
				while (rs.next()) {
			%>
			<tr>
				<td><a
					href="checktype.action?type_id=<%=rs.getString("type_id")%>"><%=rs.getString("type_name")%></a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
		<table id="table1">
			<tr>
				<td valign="top"></td>
			</tr>
		</table>
		<div>
			<form action="check.action" id="one" method="post">
				<input type="text" placeholder="请输入查询信息" name="name">
				<button type="submit">查询</button>
			</form>
			<%
				ResultSet rs1 = (ResultSet) session.getAttribute("book");
				if (rs1 != null) {
			%>
			<table id="book">
				<tr>
					<th>书名</th>
					<th>价格</th>
					<th>库存</th>
					<th>作者</th>
					<th>出版社</th>
					<th>详情</th>
					<th>是否申请</th>
				</tr>
				<%
					rs1.last();
					int size = rs1.getRow();
						pageCount = (size % 10 == 0) ? (size / 10) : (size / 10 + 1);
						String tmp = request.getParameter("curPage");
						if (tmp == null) {
							tmp = "1";
						}
						curPage = Integer.parseInt(tmp);
						if (curPage >= pageCount)
							curPage = pageCount;
						boolean flag = rs1.absolute((curPage - 1) * 10 + 1);
						int count = 0;
						while (rs1.next()) {
							if (count >= 10)
								break;
				%>

				<tr>
					<td><%=rs1.getString("book_name")%></td>
					<td><%=rs1.getString("price")%></td>
					<td><%=rs1.getString("stock")%></td>
					<td><%=rs1.getString("author")%></td>
					<td><%=rs1.getString("press")%></td>
					<td><a href="#">详情</a></td>
					<%
						if (u_user == null) {
					%>
					<td><a href="login.jsp?" onclick="ch_url()">申请</a></td>
					<%
						} else {
					%>
					<td><a
						href="apply.action?user_id=<%=u_user.getId()%>&book_id=<%=rs1.getString("book_id")%>">申请</a>
					</td>
					<%
						}
					%>
				</tr>
				<%
					count++;}
				%>

			</table>
			<%
				if (pageCount == 0) {
			%>
			<%
				} else {
			%>
			<div id="page">
				<a href="index.jsp?curPage=1">首页</a> 
				<% if(curPage==1){ %><a
					href="#">上一页</a><%}else{ %>
				<a
					href="index.jsp?curPage=<%=curPage - 1%>">上一页</a><%}if(curPage==pageCount){ %>
					<a
					href="#">下一页</a>
					<%}else{ %>
					 <a
					href="index.jsp?curPage=<%=curPage + 1%>">下一页</a><%} %> <a
					href="index.jsp?curPage=<%=pageCount%>">尾页</a> 第<%=curPage%>页/共<%=pageCount%>页
			</div>
		
		<%
			}}

		%>
		</div>
	</div>
</body>
</html>