<%--
  Created by IntelliJ IDEA.
  User: govlmo91
  Date: 2019-08-25
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String ctx = request.getContextPath();
	pageContext.setAttribute("ctx", ctx);
%>
<html>
<head>
    <title>H O M E</title>
</head>
<body>
<h1>피카츄가 세상을 지배한다</h1>
<img src="${ctx}/resources/img/pika.gif">
</body>
</html>
