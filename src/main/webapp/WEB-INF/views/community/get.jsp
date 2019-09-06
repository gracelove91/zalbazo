<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String ctx = request.getContextPath();
	pageContext.setAttribute("ctx", ctx);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<img alt="" src="${ctx}/resources/img/pika.gif">
	<h2>여기는 커뮤니티 get</h2>
</body>
</html>