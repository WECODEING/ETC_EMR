<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<html>
<head>
<title>get</title>
</head>
<body>
<%  
//从表单中获取数据  
String name = request.getParameter("name");
String tele = request.getParameter("tele");
String address = request.getParameter("address");
out.println("姓名:"+name+"<br>");
out.println("电话:"+tele+"<br>");
out.println("地址:"+address+"<br>");
%> 
</body>
</html>
