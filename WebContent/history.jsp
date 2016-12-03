<%@page import="java.sql.ResultSet"%>
<%@page import="lmsDB.Comdb"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sos图书管理系统-history</title>
<link href="style/history.css" type="text/css" rel="stylesheet">
<script >
	function openupdate() {
		document.getElementById("update").style.display = "";
		document.getElementById("back1").style.display = "";
	}
	function closeupdate() {
		document.getElementById("update").style.display = "none";
		document.getElementById("back1").style.display = "none";
	}
	function valid2(){
		var flag=true;

		if(document.getElementById("newPwd").value==""){
			flag=false;
			document.getElementById("Pwd2").innerHTML="密码不能为空";
			document.getElementById("bot").action="";
		}else{
			document.getElementById("Pwd2").innerHTML="";
		}
		return flag;
	}
	function valid3(){
		var flag=true;

		if(document.getElementById("qPwd").value==""){
			flag=false;
			document.getElementById("Pwd3").innerHTML="密码不能为空";
			document.getElementById("bot").action="";
		}else if(document.getElementById("qPwd").value!=document.getElementById("newPwd").value){
			flag=false;
			document.getElementById("Pwd3").innerHTML="密码不一致";
			document.getElementById("bot").action="";
		}else if(document.getElementById("qPwd").value==document.getElementById("newPwd").value){
			flag=true;
			document.getElementById("Pwd3").innerHTML="";
			document.getElementById("bot").action="update.action";
		}
		return flag;
	}

</script>

</head>
<body >
	<%@include file="top.jsp"%><br>
	<%!int curPage1 = 1;
	int pageCount1;%>
	<div id="back1" style="display: none;"></div>
		
			<div id="update" align="center" style="display: none;">
				<s:form action="update.action" method="post" id="bot">
					<s:textfield name="newPwd" id="newPwd" label="新密码" onblur="return valid2()"></s:textfield><span id="Pwd2"></span><br>
					<s:textfield name="qPwd" id="qPwd" label="确 	认" onblur="return valid3()"></s:textfield><span id="Pwd3"></span><br>
					 <%
						String url = request.getRequestURI();
						String query=request.getQueryString();
						int id=u_user.getId();
						if(query==null)
							query="";
						url=url+"?"+query;
					%>
					<s:hidden name="prePage1" value="%{url}" id="parPage1"></s:hidden>
					<s:submit value="提交"></s:submit>
				</s:form>
				<a href="javascript:closeupdate();" id="closeLogin">关闭</a>
			</div>
		
	<div id="all">
		
		<table id="info">
			<tr>
				<td>你的ID为：<%=u_user.getId()%></td>
			</tr>
			<tr>
				<td>你的姓名为：<%=u_user.getName()%></td>
			</tr>
			<tr>
				<td>你是普通类型的用户</td>
			</tr>
			<tr>
				<td><a href="javascript:openupdate();">修改密码</a></td>
			</tr>
			<tr>
				<td><a href="index.jsp">返回首页</a></td>
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
				if(Comdb.connection==null)
				Comdb.getConn();
				String sql = "select book.book_name,borrow_list.ID,borrow_list.LEND_TIME,borrow_list.BACK_TIME,borrow_list.BACK_TIME,borrow_list.MANAGER_ID,borrow_list.back_stat from borrow_list,book where borrow_list.BOOK_ID=book.BOOK_ID and user_id="
						+ u_user.getId();
				ResultSet rs3 = Comdb.select(sql, null);
				if(rs3==null){
					%><%
				}
				if (rs3 != null) {
			%>
			<tr>
				<th>ID</th>
				<th>借书时间</th>
				<th>还书时间</th>
				<th>管理员ID</th>
				<th>借书名称</th>
				<th>详情</th>
			</tr>
			<%
					rs3.last();
					int size1 = rs3.getRow();
					pageCount1 = (size1 % 10 == 0) ? (size1 / 10) : (size1 / 10 + 1);
					String tmp1 = request.getParameter("curPage1");
					if (tmp1 == null) {
						tmp1 = "1";
					}
					curPage1 = Integer.parseInt(tmp1);
					if (curPage1 >= pageCount1)
						curPage1 = pageCount1;
					boolean flag1 = rs3.absolute((curPage1 - 1) * 10 + 1);
					int count1 = 0;
					while (rs3.next()) {
						if (count1 >= 10)
							break;
			%>
				<tr>
				<td><%=rs3.getString("ID")%></td>
				<td><%=rs3.getString("lend_time")%></td>
				<% if (rs3.getString("back_time") == null) { %>
				<td>——</td>
				<%}else{ %>
				<td><%=rs3.getString("back_time")%></td>
				<%}if(rs3.getString("manager_id").equals("0")){ %>
				<td>——</td>
				<%}else{ %>
				<td><%=rs3.getString("manager_id")%></td>
				<%} %>
				<td><%=rs3.getString("book_name")%></td>
				<%
					if (rs3.getString("back_stat").equals("0")) {
				%><td>未批准</td>
				<%
					} else if (rs3.getString("back_stat").equals("1")) {
				%>
				<td><a href="back.action?id=<%=rs3.getString("ID")%>">借书未还</a></td>
				<%
					} else if (rs3.getString("back_stat").equals("3")) {
				%>
				<td>申请还书</td>
				<%
					} else if(rs3.getString("back_stat").equals("4")){
				%><td>已还书</td>
				<%
					}
				%>
			</tr>
				<%
					count1++;}
				%>

			</table>
			<%
				if (pageCount1 == 0) {
			%>
			<%
				} else {
			%>
			<div id="page">
				<a href="history.jsp?curPage1=1">首页</a> 
				<%if(curPage1==1){ %><a href="#">上一页</a><%}else{ %>
				<a href="history.jsp?curPage1=<%=curPage1 - 1%>">上一页</a> <%}if(curPage1==pageCount1){ %><a href="#">下一页</a><%}else{ %>
				<a href="history.jsp?curPage1=<%=curPage1 + 1%>">下一页</a> <%} %>
				<a href="history.jsp?curPage1=<%=pageCount1%>">尾页</a> 第<%=curPage1%>页/共<%=pageCount1%>页
			</div>
		
		<%
			}}
		%>
	</div>
</body>
</html>