<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/loginform.css">
<%
    String ctx = request.getContextPath();
    pageContext.setAttribute("ctx", ctx);
%>
<title>회원가입</title>
<br><br>
<div class="container-fluid">
<div class="row">
	<div class="col-2"></div>
	<div class="col-8">
		<div class="row">
			<div class="col-1"></div>
			<div class="col-5">
				<a href="/index">
					<img src="/resources/img/register_1.jpeg" width="300px" height="300px" style="border-radius: 70px; border:5px solid #66e0ff">
				</a>
			</div>
			<div class="col-5">
				<a href="/user/register">
					<img src="/resources/img/register_2.jpeg" width="300px" height="300px" style="border-radius: 70px; border:5px solid #66e0ff">
				</a>
			</div>
		</div>
	</div>	
	<div class="col-2"></div>
	
</div>
</div>
<%@include file="includes/footer.jsp"%>