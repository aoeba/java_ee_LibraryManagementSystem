<%@page import="java.sql.ResultSet"%>
<%@page import="lmsDB.Comdb"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="style/history.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%@include file="top.jsp"%><br>
	<%!int curPage1 = 1;
	int pageCount1;%>
	<div id="all">
		<table id="info">
			<tr>
				<td>你的ID为：<%=u_user.getId() %></td>
			</tr>
			<tr>
				<td>你的姓名为：<%=u_user.getName() %></td>
			</tr>
			<tr>
				<td>你是<%=u_user.getType() %>类型的用户
				</td>
			</tr>
		</table>
		<table id="table1">
			<tr>
				<td valign="top"></td>
			</tr>
		</table>
		<table id="history">
			<caption>借书记录</caption>
			<%
		Comdb.getConn();
		String sql="select book.book_name,borrow_list.ID,borrow_list.LEND_TIME,borrow_list.BACK_TIME,borrow_list.BACK_TIME,borrow_list.MANAGER_ID from borrow_list,book where borrow_list.BOOK_ID=book.BOOK_ID and user_id="+u_user.getId();
		ResultSet rs=Comdb.select(sql, null);
		if(rs!=null){%>
			<tr>
				<th>ID</th>
				<th>借书时间</th>
				<th>还书时间</th>
				<th>管理员ID</th>
				<th>借书名称</th>
				<th>详情</th>
			</tr>
			<%
		int size1=rs.getRow();
		pageCount1 = (size1%10==0)?(size1/10):(size1/10+1);
		String tmp = request.getParameter("curPage1"); 
		if(tmp==null){  
            tmp="1";  
        }  
        curPage1 = Integer.parseInt(tmp);  
        if(curPage1>=pageCount1) curPage1 = pageCount1;  
        boolean flag = rs.absolute((curPage1-1)*10+1);
		int count=0;
		while(rs.next()){
			if(count>=10) break;
		
	%>
			<tr>
				<td><%=rs.getString("ID") %></td>
				<td><%=rs.getString("lend_time") %></td>
				<td><%=rs.getString("back_time") %></td>
				<td><%=rs.getString("manager_id") %></td>
				<td><%=rs.getString("book_name") %></td>
				<%
				if(rs.getString("manager_id").equals("111111")){ %><td>未批准</td>
				<%}else if(rs.getString("back_time")==null) { %>
				<td><a href="back.action?id=<%=rs.getString("ID") %>">未还书</a></td>
				<%}else{ %><td>已还书</td><%} %>
			</tr>
			<%
					}
			%>	
		</table>
		<% if(pageCount1==0){ %>
		<%}else{ %>
		<div id="page">
			<a href="index.jsp?curPage=1">首页</a> <a
				href="index.jsp?curPage=<%=curPage1-1%>">上一页</a> <a
				href="index.jsp?curPage=<%=curPage1+1%>">下一页</a> <a
				href="index.jsp?curPage=<%=pageCount1%>">尾页</a> 第<%=curPage1%>页/共<%=pageCount1%>页
		</div>
		<%
			}
			} else {
		%>
		<%
			}
		%>
		</div>
</body>
</html>