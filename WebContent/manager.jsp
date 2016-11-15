<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="bean.BorrowList"%>
<%@page import="java.util.HashMap"%>
<%@page import="lmsDB.BorrowListDB"%>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书管理</title>
	<style type="text/css">
    	th,td{
    		width:120px;
    		text-align:center;
    	}
    	
    </style>
</head>
<body>
	<%@include file="top.jsp" %><br>
	<% 
	//	if(u_user==null||u_user.getType()==1||u_user.getType()==3){
	//		response.sendRedirect("index.jsp");
	//	}
		BorrowList bList=new BorrowList();
		BorrowListDB bListDB=new BorrowListDB();
		HashMap<String,BorrowList> map=bListDB.queryBList();
	%>
	<div align="center">
		<div style="width:1000px; height:300px;">
			<div style="width:280px; height:300px; background-color:red;display:inline;float:left;">lalala</div>
			<div style="height:300px;background-color:blue;float:right;">
			<table style="width:720px; border:1;bordercolor:black; cellspacing:20;align:center;">
				 <tr>
    				<th>id</th>
    				<th>借阅人id</th>
    				<th>图书id</th>
   					<th>借出时间</th>
   					<th>归还时间</th>
   					<th>经办人id</th>
  				 </tr>
                 <%
                 	for(int i=1;i<=map.size();i++){
                 		bList=(BorrowList)map.get(i+"");
                 %>
                  <tr>
    				<td><%=bList.getId() %></td>
    				<td><%=bList.getUserid() %></td>
    				<td><%=bList.getBookid() %></td>
   					<td><%=bList.getLendtime() %></td>
   					<td><%=bList.getBacktime() %></td>
   					<td><%=bList.getManagerid() %></td>
  				 </tr>
                	 
                 <% } %>
               </table>
               </div>
		</div>
	</div>
</body>
</html>