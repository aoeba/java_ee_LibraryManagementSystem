<%@page import="bean.User"%>
<%@page import="java.util.ArrayList"%>
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
background-color: #fcfcfc;
}
.left-text{
cursor:pointer;
display:inline-block;
}
.left-list:HOVER {
	background-color: rgba(232,232,252,1);
	border-radius:5px;
}

#right{
	position: relative;
	left:255px;
	width: 743px;
	height:350px;
	border: 1px solid #c00;
}

</style>
<script type="text/javascript">
var xmlhttp,requestType,page=1,pageNum=0;
function getAjax(){
	if(window.XMLHttpRequest){
		xmlhttp=new XMLHttpRequest();
	}else if(window.ActiveXObject){
		try{
			xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			try{
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e){
				window.alert("你的浏览器不支持ajax");
			}
		}
	}
}
function resetRightTable(obj){
	getAjax();
	requestType=obj.title;
	//requestType=1;
	xmlhttp.open("get", "http://localhost:8080/java_ee_LibraryManagementSystem/SysAction?type="+requestType,true);
	xmlhttp.send(null);
	xmlhttp.onreadystatechange=changeContent(obj);
}

var responContent,rightTable;
function changeContent(obj){
	rightTable=document.getElementById("rightTable");
	alert("请求已发送");
	if(xmlhttp.readyState==4){
		if(xmlhttp.status==200){
			responContent=xmlhttp.responseText;
			<!--2:普通用户信息-->
			if(requestType==2){
				page=1;
				if(eval(responContent).length%15==0)
					pageNum=eval(responContent).length/15;
				else
					pageNum=(eval(responContent).length-eval(responContent).length%15)/15+1;
				requestType2();
			}
			<!--3:图书管理员信息-->
			if(requestType==3){
				document.getElementById("text").innerHTML=eval(responContent)+"test";
				page=1;
				if(eval(responContent).length%15==0)
					pageNum=eval(responContent).length/15;
				else
					pageNum=(eval(responContent).length-eval(responContent).length%15)/15+1;
				requestType3();
			}
			<!--4:图书类别信息-->
			if(requestType==4){
				page=1;
				if(eval(responContent).length%15==0)
					pageNum=eval(responContent).length/15;
				else
					pageNum=(eval(responContent).length-eval(responContent).length%15)/15+1;
				requestType4();
			}
			
			<!--5:图书详细信息-->
			if(requestType==5){
				page=1;
				if(eval(responContent).length%8==0)
					pageNum=eval(responContent).length/8;
				else
					pageNum=(eval(responContent).length-eval(responContent).length%8)/8+1;
				requestType5();
			}
			document.getElementById("pageCtrl").style.display="";
			
		}
	}
	
}

function requestType2(){
	document.getElementById("page_id").value=page;
	document.getElementById("pageNum_id").innerHTML=pageNum;
	rightTable.innerHTML="<tr style=\"background-color:#4A4AFF;\" id=\"right_tr\"><td style=\"width: 187px;\">用户编号</td><td style=\"width: 187px;\">用户名称</td><td style=\"width: 187px;\">密码</td><td style=\"width: 187px;\">手机号</td></tr>";
	for(var i=(page-1)*15;i<page*15;i++){
	//for(var i=0;i<eval(responContent).length;i++){
		if(i%2==0){
			rightTable.innerHTML+="<tr style=\"background-color:#C07AB8;\" class=\"right_tr\"><td>"+eval(responContent)[i].user_id+"</td><td>"
			+eval(responContent)[i].user_name+"</td><td>"+eval(responContent)[i].password+"</td><td>"
			+eval(responContent)[i].phone_number+"</td></tr>";
		}else{
			rightTable.innerHTML+="<tr style=\"background-color:#BEBEBE;\" class=\"right_tr\"><td>"+eval(responContent)[i].user_id+"</td><td>"
			+eval(responContent)[i].user_name+"</td><td>"+eval(responContent)[i].password+"</td><td>"
			+eval(responContent)[i].phone_number+"</td></tr>";
		}
		
	}
}

function requestType3(){
	document.getElementById("pageCtrl").style.display="";
	document.getElementById("page_id").value=page;
	document.getElementById("pageNum_id").innerHTML=pageNum;
	rightTable.innerHTML="<tr style=\"background-color:#4A4AFF;\" id=\"right_tr\"><td style=\"width: 140px;\">编号</td><td style=\"width: 140px;\">图书管理员名称</td><td style=\"width: 140px;\">密码</td><td style=\"width: 140px;\">手机号</td><td style=\"width: 140px;\">身份证号</td></tr>";
	for(var i=(page-1)*15;i<page*15;i++){
		if(i%2==0){
			rightTable.innerHTML+="<tr style=\"background-color:#C07AB8;\" id=\"right_tr\"><td style=\"width: 140px;\">"
			+eval(responContent)[i].manager_id+"</td><td style=\"width: 140px;\">"
			+eval(responContent)[i].manager_name+"</td><td style=\"width: 140px;\">"
			+eval(responContent)[i].password+"</td><td style=\"width: 140px;\">"
			+eval(responContent)[i].phone_number+"</td><td style=\"width: 140px;\">"
			+eval(responContent)[i].id_number+"</td></tr>";
		}else{
			rightTable.innerHTML+="<tr style=\"background-color:#BEBEBE;\" id=\"right_tr\"><td style=\"width: 140px;\">"
				+eval(responContent)[i].manager_id+"</td><td style=\"width: 140px;\">"
				+eval(responContent)[i].manager_name+"</td><td style=\"width: 140px;\">"
				+eval(responContent)[i].password+"</td><td style=\"width: 140px;\">"
				+eval(responContent)[i].phone_number+"</td><td style=\"width: 140px;\">"
				+eval(responContent)[i].id_number+"</td></tr>";
		}
		
	}
}	

function requestType4(){
	document.getElementById("pageCtrl").style.display="";
	document.getElementById("page_id").value=page;
	document.getElementById("pageNum_id").innerHTML=pageNum;
	rightTable.innerHTML="<tr style=\"background-color:#4A4AFF;\" id=\"right_tr\"><td style=\"width: 245px;\">科目编号</td><td style=\"width: 245px;\">科目名称</td><td style=\"width: 245px;\">科目借阅室</td></tr>";
	for(var i=(page-1)*15;i<page*15;i++){
		if(i%2==0){
			rightTable.innerHTML+="<tr style=\"background-color:#C07AB8;\" id=\"right_tr\"><td style=\"width: 140px;\">"
			+eval(responContent)[i].type_id+"</td><td style=\"width: 140px;\">"
			+eval(responContent)[i].type_name+"</td><td style=\"width: 140px;\">"
			+eval(responContent)[i].type_LibraryRoom+"</td></tr>";
		}else{
			rightTable.innerHTML+="<tr style=\"background-color:#BEBEBE;\" id=\"right_tr\"><td style=\"width: 140px;\">"
				+eval(responContent)[i].type_id+"</td><td style=\"width: 140px;\">"
				+eval(responContent)[i].type_name+"</td><td style=\"width: 140px;\">"
				+eval(responContent)[i].type_LibraryRoom+"</td></tr>";
		}
		
	}
}	

function requestType5(){
	document.getElementById("pageCtrl").style.display="";
	document.getElementById("page_id").value=page;
	document.getElementById("pageNum_id").innerHTML=pageNum;
	rightTable.innerHTML="<tr style=\"background-color:#4A4AFF;\" id=\"right_tr\"><td style=\"width: 80px;\">编号</td><td style=\"width: 80px;\">名称</td><td style=\"width: 80px;\">类型编号</td><td style=\"width: 80px;\">库存</td><td style=\"width: 80px;\">单价</td><td style=\"width: 80px;\">作者</td><td style=\"width: 80px;\">登记时间</td><td style=\"width: 80px;\">出版社</td><td style=\"width: 80px;\">出版时间</td></tr>";
	for(var i=(page-1)*8;i<page*8;i++){
		if(i%2==0){
			rightTable.innerHTML+="<tr style=\"background-color:#C07AB8;\" id=\"right_tr\"><td style=\"width: 140px;\">"
				+eval(responContent)[i].book_id+"</td><td style=\"width: 140px;\">"
				+eval(responContent)[i].book_name+"</td><td style=\"width: 140px;\">"
				+eval(responContent)[i].type_id+"</td><td style=\"width: 140px;\">"
				+eval(responContent)[i].stock+"</td><td style=\"width: 140px;\">"
				+eval(responContent)[i].price+"</td><td style=\"width: 140px;\">"
				+eval(responContent)[i].author+"</td><td style=\"width: 140px;\">"
				+eval(responContent)[i].register_time+"</td><td style=\"width: 140px;\">"
				+eval(responContent)[i].press+"</td><td style=\"width: 140px;\">"
				+eval(responContent)[i].print_time+"</td></tr>";
		}else{
			rightTable.innerHTML+="<tr style=\"background-color:#BEBEBE;\" id=\"right_tr\"><td style=\"width: 140px;\">"
				+eval(responContent)[i].book_id+"</td><td style=\"width: 140px;\">"
				+eval(responContent)[i].book_name+"</td><td style=\"width: 140px;\">"
				+eval(responContent)[i].type_id+"</td><td style=\"width: 140px;\">"
				+eval(responContent)[i].stock+"</td><td style=\"width: 140px;\">"
				+eval(responContent)[i].price+"</td><td style=\"width: 140px;\">"
				+eval(responContent)[i].author+"</td><td style=\"width: 140px;\">"
				+eval(responContent)[i].register_time+"</td><td style=\"width: 140px;\">"
				+eval(responContent)[i].press+"</td><td style=\"width: 140px;\">"
				+eval(responContent)[i].print_time+"</td></tr>";
		}
		
	}
}

function previous(){
	if(requestType==2){
		if(page>1){
			page--;
			requestType2();
		}else
			alert("这已经是第一页了");
	}
	if(requestType==3){
		if(page>1){
			page--;
			requestType3();
		}else
			alert("这已经是第一页了");
	}
	if(requestType==4){
		if(page>1){
			page--;
			requestType4();
		}else
			alert("这已经是第一页了");
	}
	if(requestType==5){
		if(page>1){
			page--;
			requestType5();
		}else
			alert("这已经是第一页了");
	}
	
}

function next(){
	if(requestType==2){
		if(page<pageNum){
			page++;
			requestType2();
		}else
			alert("这已经是最后一页了");
	}	
	if(requestType==3){
		if(page<pageNum){
			page++;
			requestType3();
		}else
			alert("这已经是最后一页了");
			
	}
	if(requestType==4){
		if(page<pageNum){
			page++;
			requestType4();
		}else
			alert("这已经是最后一页了");
			
	}
	if(requestType==5){
		if(page<pageNum){
			page++;
			requestType5();
		}else
			alert("这已经是最后一页了");
			
	}
}
</script>
</head>
<body>
	<%@include file="top.jsp"%>
	<div align="center">
		<div style="width: 1000px;" align="left">
			<div id="left-list">
			<table style="border-spacing: 0">
				<tr><td class="left-list"><div class="left-text" ><a href="SysAction?type=1">数据上传</a></div></td></tr>
				<tr><td class="left-list"><div class="left-text" title="2" onclick="resetRightTable(this)">普通用户信息</div></td></tr>
				<tr><td class="left-list"><div class="left-text" title="3" onclick="resetRightTable(this)">管理员信息</div></td></tr>
				<tr><td class="left-list"><div class="left-text" title="4" onclick="resetRightTable(this)">图书类别信息</div></td></tr>
				<tr><td class="left-list"><div class="left-text" title="5" onclick="resetRightTable(this)">图书详细信息</div></td></tr>
			</table>
			</div>
			
			<div id="right" align="center">
			<span id="text"></span>
				<table id="rightTable" style="text-align: center;">
				
				</table>
				<div id="pageCtrl" style="display: none;">
					<button onclick="previous()">上一页</button>&nbsp;第<input type="text" style="width: 15px;"  id="page_id">页,总<label id="pageNum_id"></label>页&nbsp; <button onclick="next()">下一页</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>