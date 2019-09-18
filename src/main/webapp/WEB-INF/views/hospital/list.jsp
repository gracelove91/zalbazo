<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html>
<head>
    <title>병원 리스트</title>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 부트스트랩 CSS 추가하기 -->
    <link rel="stylesheet"
          href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">
</head>
<body>
<%@include file="../includes/header.jsp" %>

<div class="container-fluid">
    <div class="row d-flex d-md-block flex-nowrap wrapper">
        <main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
            <div class="page-header mt-3">
                <h2>병원 검색 결과</h2>
            </div>
            <p class="lead">병원 리스트</p>

            <table class="table table-striped" style="width: 1150px;">

                <thead>
                <tr>
                    <th scope="col" class="mobile"
                        style="width: 150px; text-align: center;">No.</th>
                    <th scope="col" class="mobile"
                        style="width: 350px; text-align: center;"></th>
                    <th scope="col" class="mobile"
                        style="width: 600px; text-align: center;">병원명</th>
                    <th scope="col" class="mobile"
                        style="width: 200px; text-align: center;">진료시작</th>
                    <th scope="col" class="mobile"
                        style="width: 200px; text-align: center;">진료마감</th>
                    <th scope="col" class="mobile"
                        style="width: 700px; text-align: center;">주소</th>
                    <th scope="col" class="mobile"
                        style="width: 400px; text-align: center;">전화번호</th>
                    <!-- 						<th scope="col" class="mobile"
                                                style="width: 1000px; text-align: center;">정보</th> -->
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${hospitalList}" var="hospital">


                    <tr>
                        <td class="mobile" style="text-align: center;"><c:out
                                value="${hospital.hospitalId}" /></td>

                        <td class="mobile" style="text-align: center;"><a href="#">
                            <img class="img-fluid rounded mb-3 mb-md-0"
                                 src="${ctx}/resources/img/${hospital.hospitalId}-1.jpg"
                                 alt="">
                        </a></td>

                        <td><a style="color: #000000;"
                               href='/hospital/get?hospitalId=<c:out value="${hospital.hospitalId}"/>'>
                                ${hospital.name}</a><br><br/>

                            <c:forEach items="${hospital.label}" var="label">

                                <c:if test="${label.labelCode == 1 }">
                                    <i class="material-icons"> local_convenience_store </i>
                                </c:if>

                                <c:if test="${label.labelCode == 2 }">
                                    <i class="material-icons"> spa </i>
                                </c:if>

                                <c:if test="${label.labelCode == 3 }">
                                    <i class="material-icons"> local_parking </i>
                                </c:if>

                                <c:if test="${label.labelCode == 4 }">
                                    <i class="material-icons"> pets </i>
                                </c:if>


                            </c:forEach></td>

                        <td class="mobile" style="text-align: center;"><c:out
                                value="${hospital.treatStart}" /></td>

                        <td class="mobile" style="text-align: center;"><c:out
                                value="${hospital.treatEnd}" /></td>

                        <td class="mobile" style="text-align: center;"><c:out
                                value="${hospital.address}" /></td>

                        <td class="mobile" style="text-align: center;"><c:out
                                value="${hospital.tel}" /></td>

                            <%-- 							<td class="mobile" style="text-align: center;"><c:out
                                                                value="${hospital.info}" /> </br></td>
                             --%>
                    </tr>

                </c:forEach>
                </tbody>
            </table>


            <footer class="text-center" style="max-width: 1080px;">
                <p>
                    Copyright ⓒ 2019 <b>zalbazo</b> All Rights Reserved.
                </p>
            </footer> </main>
    </div>
</div>

<!-- 제이쿼리 자바스크립트 추가하기 -->

<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>


</body>

</html>
