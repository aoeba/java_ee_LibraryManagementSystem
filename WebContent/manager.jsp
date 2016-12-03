<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="java.util.ArrayList"%>
<%@page import="lmsDB.BorrowListDB,java.util.HashMap,bean.BorrowList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sos图书管理系统-图书管理</title>
<script type="text/javascript">
	function uncheck() {
		window.location = "uncheck.action";

	}
	function allcheck() {
		window.location = "allcheck.action";

	}
</script>
<style type="text/css">
#box {
	width: 1000px;
	height: 450px;
}

#nav {
	width: 250px;
	height: 450px;
	background-color: red;
	display: inline;
	float: left;
}

#operatediv {
	
}

#show {
	width: 750px;
	height: 450px;
	background-color: #97CBFF;
	float: right;
}

#tab {
	width: 748px;
	border: 1;
	border-color: black;
	cells-pacing: 20;
	text-align: center;
}

th, td {
	width: 105px;
	text-align: center;
}

th {
	height: 40px;
	background-color: yellow;
}

td {
	height: 30px;
	background-color: #93FF93;
}

#ntext {
	top: 50px;
	position: relative;
}

#pagebottom {
	float: bottom;
}

button {
	width: 90px;
}
</style>
</head>
<body>
	<%@include file="top.jsp"%><br>
	<%
		if (u_user == null || u_user.getType() == 1 || u_user.getType() == 3) {
			response.sendRedirect("index.jsp");
		}
		int pagecount = 0;
		BorrowList bList = new BorrowList();
		BorrowListDB bListDB = new BorrowListDB();
		ArrayList<BorrowList> bmlist = bListDB.queryBList();
	%>
	<div align="center">
		<div id="box">
			<div id="nav">
				<div id="operatediv">
					<%
						if (u_user != null&&u_user.getType()==2) {
					%>
					<p>
						ID：<%=u_user.getId()%></p>
					<p>
						姓名：<%=u_user.getName()%></p>
					
					<form action="bmquery" method="post">
						<input type="text" name="checkinfoString" value="" />
						<p>
							<input type="radio" value="book_id" name="bmchecktype">图书id
						</p>
						<p>
							<input type="radio" value="user_id" name="bmchecktype">借阅人id
						</p>
						<p>
							<input type="radio" value="lend_time" name="bmchecktype">借出日期
						</p>
						<p>
							<input type="radio" value="manager_id" name="bmchecktype">经办人id
						</p>
						<button type="submit" id="querybtn">查询</button>
					</form>
					<%
						//						if (session.getAttribute("bmchecklist") != null) {
						//							bmlist = (ArrayList<BorrowList>) session.getAttribute("bmchecklist");
						//							session.removeAttribute("bmchecklist");
						//						}
					%>
					<button type="button" id="uncheckbtn" onclick="uncheck()">未审核列表</button>
					<br>
					<%
						//						if (session.getAttribute("bmunchecklist") != null) {
						//
						//							bmlist = (ArrayList<BorrowList>) session.getAttribute("bmunchecklist");
						//							System.out.println(bmlist);
						//							session.removeAttribute("bmunchecklist");
						//						}
					%>
					<button type="button" id="allcheckbtn" onclick="allcheck()">全部列表</button>
					<%
						//						if (session.getAttribute("bmallchecklist") != null) {
						//							bmlist = (ArrayList<BorrowList>) session.getAttribute("bmallchecklist");
						//							session.removeAttribute("bmallchecklist");
						//						}
						if (session.getAttribute("bmchecklist") != null) {
							bmlist = (ArrayList<BorrowList>) session.getAttribute("bmchecklist");
							//							session.removeAttribute("bmchecklist");
						}
					%>
				</div>
			</div>
			<div id="show">
				<table id="tab">
					<tr>
						<th>id</th>
						<th>借阅人id</th>
						<th>图书id</th>
						<th>借出时间</th>
						<th>归还时间</th>
						<th>经办人id</th>
						<th>还书状态</th>
						<th>审核</th>
					</tr>
					<%
						pagecount = (bmlist.size() % 10 == 0) ? (bmlist.size() / 10) : ((bmlist.size() / 10) + 1);
						int currentpage = 1;
						int curpage = 1;
						int currentpages = 0;
						String flags = null;
						if ((flags = request.getParameter("turnpage")) != null) {
							int turnpage = Integer.parseInt(flags);
							currentpage = (turnpage - 1) * 10 + 1;
							curpage = turnpage;
						}
						if (currentpage + 9 > bmlist.size()) {
							currentpages = bmlist.size();
						} else {
							currentpages = currentpage + 9;
						}
						for (int i = currentpage; i <= currentpages; i++) {
							bList = (BorrowList) bmlist.get(i - 1);
							System.out.println(bList);
					%>
					<tr>
						<td><%=bList.getId()%></td>
						<td><%=bList.getUserid()%></td>
						<td><%=bList.getBookid()%></td>
						<td><%=bList.getLendtime()%></td>
						<td>
							<%
								if (bList.getBacktime() != null) {
							%><%=bList.getBacktime()%> <%
 	} else {
 %>-<%
 	}
 %>
						</td>
						<td><%=bList.getManagerid()%></td>
						<td>
							<%
								if (bList.getBackstat() == 0) {
							%>申请借书 <%
								} else if (bList.getBackstat() == 1) {
							%>已借书 <%
								} else if (bList.getBackstat() == 2) {
							%>申请还书 <%
								} else if (bList.getBackstat() == 3) {
							%>已还书 <%
								}
							%>
						</td>
						<!-- 0申请借书，1已借书，2申请还书，3已还书 -->
						<td>
							<%
								if (bList.getBackstat() == 0) {
							%><a href="applyoperate.action?bookid=<%=bList.getBookid()%>&&managerid=<%=u_user.getId()%>&&id=<%=bList.getId()%>">批准借书</a>
							<%
								} else if (bList.getBackstat() == 1) {
							%>- <%
								} else if (bList.getBackstat() == 2) {
							%><a href="backoperate.action?id=<%=bList.getId()%>&&managerid=<%=u_user.getId()%>">还书确认</a>
							<%
								} else if (bList.getBackstat() == 3) {
							%>- <%
								}
							%>
						</td>
					</tr>

					<%
						}
					%>
					<%
						if (request.getParameter("operateback") != null) {
					%>
					<%
						if (request.getParameter("operateback").equals("0")) {
					%>
					<script type="text/javascript" language="javascript">
						alert("库存不足");
					</script>
					<%
						}
					%>
					<%
						if (request.getParameter("operateback").equals("1")) {
					%>
					<script type="text/javascript" language="javascript">
						alert("申请通过");
					</script>
					<%
						}
					%>
					<%
						if (request.getParameter("operateback").equals("2")) {
					%>
					<script type="text/javascript" language="javascript">
						alert("还书成功");
					</script>
					<%
						}
						}
					%>
				</table>
				<div id="pagebottom">
					<%
						if (curpage != 1) {
					%>
					<a href="manager.jsp?turnpage=<%=curpage - 1%>">上一页</a>
					<%
						}
					%>
					<span> <%
 	for (int ipage = 1; ipage <= pagecount; ipage++) {
 %> <a
						href="manager.jsp?turnpage=<%=ipage%>"><%=ipage%></a>
						<%
							System.out.println(pagecount);
						%> <%
 	}
 %>
					</span>
					<%
						if (curpage != pagecount) {
					%>
					<a href="manager.jsp?turnpage=<%=curpage + 1%>">下一页</a>
					<%
						}
					%>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>