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
border: 1px solid #c00;
}
.left-list{
width: 250px;
text-align: center;
height: 70px;
}
.left-text{
cursor:pointer;
display:inline-block;
}
.left-text:HOVER {
	background-color: rgba(100,100,100,0.2);
	border-radius:5px;
}
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<%@include file="top.jsp"%>
	<div align="center">
		<div style="width: 1000px;">
			<div id="left-list">
			<table>
				<tr><td class="left-list"><div class="left-text" >个人信息</div></td></tr>
				<tr><td class="left-list"><div class="left-text">普通用户管理</div></td></tr>
				<tr><td class="left-list"><div class="left-text">管路员管理</div></td></tr>
				<tr><td class="left-list"><div class="left-text">图书类别管理</div></td></tr>
				<tr><td class="left-list"><div class="left-text">图书信息管理</div></td></tr>
			</table>
			</div>
		</div>
	</div>
</body>
</html>