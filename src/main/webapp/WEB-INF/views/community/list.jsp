<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<div class="container-fluid">
    <div class="row d-flex d-md-block flex-nowrap wrapper">
        <main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
            <div class="page-header mt-3">
                <h2>커뮤니티</h2>
            </div>
            <p class="lead">회원들과 소통하세요.</p>
            <hr>
            <table class="table table-striped" style="max-width: 1080px;">
                <thead>
                <tr>
                    <th scope="col" class="mobile" style="width:55px; text-align:center;">번호</th>
                    <th scope="col" class="mobile" style="text-align:center;">제목</th>
                    <th scope="col" class="mobile" style="width:80px; text-align:center;">작성자</th>
                    <th scope="col" class="mobile" style="width:120px; text-align:center;">날짜</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${contentList}" var="content">
                <tr>
                    <th scope="row" class="mobile" style="text-align:center;"><c:out value="${content.id}"/></th>
                    <td><a href="./boardView.html" style="color: #000000;"><c:out value="${content.title}"/></a></td>
                    <td class="mobile" style="text-align:center;"><c:out value="${content.userEmail}"/></td>
                    <td class="mobile" style="text-align:center;"><fmt:formatDate value="${content.createdDate}" pattern="yyyy-MM-dd"/> </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
            <div style="max-width: 1080px;">
                <a href="/community/register" class="btn btn-primary float-right">글쓰기</a>
            </div>
            <ul class="pagination">
                <li class="page-item disabled">
                    <span class="page-link">&laquo;</span>
                </li>
                <li class="page-item"><a class="page-link mobile" href="#">1</a></li>
                <li class="page-item active"><span class="page-link mobile">2</span></li>
                <li class="page-item"><a class="page-link mobile" href="#">3</a></li>
                <li class="page-item"><a class="page-link mobile" href="#">4</a></li>
                <li class="page-item"><a class="page-link mobile" href="#">5</a></li>
                <li class="page-item"><a class="page-link mobile" href="#">6</a></li>
                <li class="page-item"><a class="page-link mobile" href="#">7</a></li>
                <li class="page-item"><a class="page-link mobile" href="#">8</a></li>
                <li class="page-item"><a class="page-link mobile" href="#">9</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">&raquo;</a>
                </li>
            </ul>
            <footer class="text-center" style="max-width: 1080px;">
                <p>Copyright ⓒ 2019 <b>zalbazo</b> All Rights Reserved.</p>
            </footer>
        </main>
    </div>
</div>
<!-- 제이쿼리 자바스크립트 추가하기 -->
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
