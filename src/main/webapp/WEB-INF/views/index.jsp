<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String ctx = request.getContextPath();
	pageContext.setAttribute("ctx", ctx);
%>
<html>
<body>
<h2>Hello <c:out value="${email}"/>!</h2>
<h3>피카츄가 세상을 지배한다</h3>
<img src="${ctx}/resources/img/pika.gif">
</body>
</html>
