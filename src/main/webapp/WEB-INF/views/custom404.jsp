<%--
  Created by IntelliJ IDEA.
  User: govlmo91
  Date: 2019-08-26
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String ctx = request.getContextPath();
	pageContext.setAttribute("ctx", ctx);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>돌아가,, 404야,,,,,</h1>
<img src="${ctx}/resources/img/quokka.gif">

</body>
</html>