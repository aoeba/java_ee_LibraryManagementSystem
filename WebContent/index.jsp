<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="lmsDB.*,java.sql.ResultSet,bean.Type" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="style/index.css" type="text/css" rel="stylesheet">
<style type="text/css">
*{
margin: 0;
border: 0;
}
#all{
position: absolute;
width:1000px;
top: 120px;
}
#type{
position: absolute;
left: 10px;
}
</style>
</head>
<body>
	<%@include file="top.jsp"%><br>
	<div align="center" >
	<div style="width: 1000px;">
	<div id="all">
		<table id="type">
			<%
				Comdb.getConn();
				ResultSet rs = Comdb.select("select type_name,type_id from type", null);
				while (rs.next()) {
			%>
			<tr>
				<td>
				<a href="checktype.action?type_id=<%=rs.getString("type_id")%>"><%=rs.getString("type_name")%></a>
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
		<form action="check.action" id="one">
			<input type="text" placeholder="请输入查询信息" name="name">
			<button type="submit">查询</button>
		</form>
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
				ResultSet rs1 = (ResultSet) session.getAttribute("book");
				if(rs1!=null){
				while (rs1.next()) {
			%>
			<tr>
				<td><%=rs1.getString("book_name") %></td>
				<td><%=rs1.getString("price") %></td>
				<td><%=rs1.getString("stock") %></td>
				<td><%=rs1.getString("author") %></td>
				<td><%=rs1.getString("press") %></td>
				<td><a href="#">详情</a></td>
				<td><a href="#">申请</a></td>
			</tr>
			<%}}else{ %>
			<%} %>
		</table>
	</div>
	</div>
	</div>
</body>
</html>