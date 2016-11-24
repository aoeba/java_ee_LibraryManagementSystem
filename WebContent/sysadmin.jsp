<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="top.jsp"%>
	<%	if(u_user==null||u_user.getType()==1||u_user.getType()==2){
			response.sendRedirect("index.jsp");
		} %>
	<div align="center">
		<div style="width: 1000px; height: 355px; border: 1px solid #c00;">
			
			<div style="color: red;width: 600px;" align="left">
			各表更新时txt要求格式(每个属性用tab隔开，多条数据用换行隔开):<br>
			<span style="font-size: 15px;color: black;">
			用户表：
			user_id&nbsp;user_name&nbsp;password&nbsp;phone_number<br>
			管理员表：
			manager_id&nbsp;manager_name&nbsp;password&nbsp;phone_number&nbsp;id_number<br>
			科目表：
			type_id&nbsp;type_name&nbsp;type_libraryroom<br>
			图书表：
			book_id&nbsp;book_name&nbsp;stock&nbsp;price&nbsp;author&nbsp;register_time&nbsp;press&nbsp;print_time&nbsp;type_id<br>
			</span>
			</div>
			
			
			<s:form action="upload" enctype="multipart/form-data">
				<s:file name="upload" label="上传的文件"></s:file>
				<s:select list="#{1:'普通用户表',2:'图书管理员表',3:'系统管理员表',4:'科目表',5:'图书表'}" name="tableType"
						label="更新表类别"></s:select>
				<s:submit value="submit"></s:submit>
			</s:form>
			<a href="sysManage.jsp">返回管理界面</a>
		</div>
	</div>
</body>
</html>