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
<main id="main">
<div class="page-header row">
	<div class="col-1"></div>
	<div class="col-10">
		<br>
    	<h2>병원 검색 결과</h2>
		<p class="lead">병원 리스트</p>
	</div>
	<div class="col-1"></div>
</div>
<div class="row">
	<div class="col-1"></div>
	<div class="col-10">	
        <table class="table table-striped">
			
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
                </tr>
            </thead>
            <tbody>

                <c:forEach items="${map.list}" var="hospital">


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
                                    <i class="material-icons"> local_florist </i>
                                </c:if>

                                <c:if test="${label.labelCode == 3 }">
                                    <i class="material-icons"> local_parking </i>
                                </c:if>

                                <c:if test="${label.labelCode == 4 }">
                                    <i class="material-icons"> emoji_nature </i>
                                </c:if>
                                
                                <c:if test="${label.labelCode == 5 }">
                                    <i class="material-icons"> check_circle </i>
                                </c:if>
                            </c:forEach>
                        </td>

                        <td class="mobile" style="text-align: center;"><c:out
                                value="${hospital.treatStart}" /></td>

                        <td class="mobile" style="text-align: center;"><c:out
                                value="${hospital.treatEnd}" /></td>

                        <td class="mobile" style="text-align: center;"><c:out
                                value="${hospital.address}" /></td>

                        <td class="mobile" style="text-align: center;"><c:out
                                value="${hospital.tel}" /></td>

                    </tr>

                </c:forEach>
			</tbody>
		</table>
	</div>
	<div class="col-1"></div>
</div>            
</main>

</div>
</div>
<%@include file="../includes/footer.jsp" %>

<!-- 제이쿼리 자바스크립트 추가하기 -->

<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>


</body>

</html>
