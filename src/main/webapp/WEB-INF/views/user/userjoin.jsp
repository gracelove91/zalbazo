<%--
  Created by IntelliJ IDEA.
  User: govlmo91
  Date: 06/09/2019
  Time: 8:52 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!doctype html>
<html>
<head>
    <title>커뮤니티 웹 사이트</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 부트스트랩 CSS 추가하기 -->
    <link rel="stylesheet" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row d-flex d-md-block flex-nowrap wrapper">
        <main id="main" class="col-md-12 float-left col pl-md-5 pt-3 main">
            <div class="page-header mt-3">
                <h2>회원가입</h2>
            </div>
            <p class="lead">사용자 정보를 입력해 회원가입을 수행합니다.</p>
            <hr>
            <form:form class="pt-3 md-3" cssStyle="max-width: 720px" action="/user/register" method="post"
                       modelAttribute="user">
                <input type="hidden" name="role" value="user"/>
                <div class="form-group">
                    <fieldset>
                        <form:label path="email">이메일</form:label>
                        <form:input path="email" required="required" type="email" id="email" class="form-control"
                                    name="email"
                                    placeholder="이메일을 입력하세요."/>
                        <form:errors path="email" cssClass="text-danger"/>
                        <div class="form-check" id="id_check"></div>
                    </fieldset>
                </div>
                <div class="form-group">
                    <fieldset>
                        <form:label path="password">비밀번호</form:label>
                        <form:input path="password" required="required" type="password" id="password"
                                    class="form-control" name="password"
                                    placeholder="비밀번호를 입력하세요."/>
                        <form:errors path="password" cssClass="text-danger"/>
                    </fieldset>
                </div>
                <div class="form-group">
                    <fieldset>
                        <form:label path="password2">비밀번호 확인</form:label>
                        <form:input path="password2" required="required" type="password" id="password2"
                                    class="form-control"
                                    name="password2"
                                    placeholder="비밀번호 확인을 입력하세요."/>
                        <form:errors path="password2" cssClass="text-danger"/>
                    </fieldset>
                </div>
                <div class="form-group">
                    <fieldset>
                        <form:label path="tel">전화번호</form:label>
                        <form:input path="tel" type="tel" required="required" class="form-control" id="tel" name="tel"
                                    placeholder="전화번호를 입력하세요."/>
                        <form:errors path="tel" cssClass="text-danger"/>
                    </fieldset>
                </div>
                <div class="form-group">
                    <fieldset>
                        <form:label path="address">주소</form:label>
                        <form:input path="address" required="required" type="text" class="form-control" name="address"
                                    id="address"
                                    placeholder="주소를 입력하세요."/>
                    </fieldset>
                </div>
                <div class="form-group">
                    <fieldset>
                        <form:label path="name" >이름</form:label>
                        <form:input path="name" type="text" required="required" id="name" class="form-control"
                                    name="name"
                                    placeholder="이름을 입력하세요."/>
                    </fieldset>
                </div>
                <button id="join" type="submit" class="btn btn-primary">회원가입</button>
            </form:form>
            <footer class="text-center" style="max-width: 720px;">
                <p>Copyright ⓒ 2018 <b>zalbazo</b> All Rights Reserved.</p>
            </footer>
        </main>
    </div>
</div>
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 자바스크립트 추가하기 -->
<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<%--<script>--%>
<%--    $("#email_duplicate").on('click', function () {--%>
<%--        let userEmail = $("#email").val();--%>
<%--        $.ajax({--%>
<%--            url: '/user/emailChk?userEmail=' + userEmail,--%>
<%--            type: 'get',--%>
<%--            success: function(data){--%>
<%--                let re = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;--%>

<%--                if( !re.test(userEmail) ){--%>
<%--                    console.log("1");--%>
<%--                    $("#id_check").text('이메일형식 아님 띠띠').addClass('text-danger').removeClass('text-primary');--%>
<%--                    $("#join").attr('disabled', true);--%>
<%--                }else if(data){--%>
<%--                    console.log("2");--%>
<%--                    $("#id_check").text('사용하셔도 좋습니다.').addClass('text-primary').removeClass('text-danger');--%>
<%--                    $("#join").attr('disabled', false);--%>
<%--                }else{--%>
<%--                    console.log("3");--%>
<%--                    $("#id_check").text('중복된 이메일입니다.').addClass('text-danger').removeClass('text-primary');--%>
<%--                    $("#join").attr('disabled', true);--%>
<%--                }--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
</body>
</html>