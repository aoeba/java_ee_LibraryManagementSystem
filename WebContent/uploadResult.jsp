<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sos图书管理系统-文件处理结果</title>
</head>
<body>
<s:if test="#session.errors[0]==null">
没有错。。
</s:if>
<%ArrayList<String> errors=(ArrayList)session.getAttribute("errors");  
if(errors==null||errors.size()==0){%>	
	导入成功。。。
<%}else{%>
<s:iterator value="#session.errors" var="error">
<s:property value="#error"/><br>
</s:iterator>
<%}%>
<a href="sysadmin.jsp">重新上传</a>
</body>
</html>