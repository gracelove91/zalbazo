<%@ page import="org.springframework.web.servlet.mvc.support.RedirectAttributes" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/loginform.css"/>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
                <div class="card-body">
                    <form class="form-signin" method="post" action="/login">
                        <div class="form-label-group">
                            <input type="email" id="inputEmail" class="form-control" placeholder="이메일" name="user-email"
                                   required autofocus>
                            <label for="inputEmail">이메일</label>
                        </div>

                        <div class="form-label-group">
                            <input type="password" id="inputPassword" class="form-control" placeholder="비밀번호"
                                   name="password" required>
                            <label for="inputPassword">비밀번호</label>
                        </div>
                        <div class="text-center"><c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}"> <span
                                class="text-danger"><c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/></span>
                            <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/> </c:if></div>
                        <div class="custom-control custom-checkbox mb-3">
                            <input type="checkbox" class="custom-control-input" id="customCheck1" name="remember-me">
                            <label class="custom-control-label" for="customCheck1">로그인유지</label>
                        </div>
                        <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">로그인</button>
                        <hr class="my-4">
                        <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i
                                class="fab fa-google mr-2"></i>구글계정으로 로그인
                        </button>
                        <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i
                                class="fab fa-facebook-f mr-2"></i>페이스북계정으로 로그인
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</html>