<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<title>즐겨찾는 병원</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet"
	href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
</head>
<%@include file="/WEB-INF/views/includes/header.jsp" %>	
<body>

	<div class="container-fluid">
		<div class="row d-flex d-md-block flex-nowrap wrapper">
			<main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
			<div class="page-header mt-3">
				<h2>즐겨찾는 병원</h2>
				</br>
			</div>
<!-- 즐겨찾는 병원 리스트  -->
<div class="fav">
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
							style="width: 300px; text-align: center;">전화번호<br>
						</th>
						<th scope="col" class="mobile"
							style="width: 350px; text-align: center;"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${favoriteHospitalList}" var="favoriteHospital">

						<tr>
							<td class="mobile" style="text-align: center;"><c:out
									value="${favoriteHospital.hospitalId}" /></td>

							<td class="mobile" style="text-align: center;"><a href="#">
									<img class="img-fluid rounded mb-3 mb-md-0"
									src="${ctx}/resources/img/${favoriteHospital.hospitalId}-1.jpg" alt="">
							</a></td>
							<td>
							<a style="color: #000000;"
								href='/hospital/get?hospitalId=<c:out value="${favoriteHospital.hospitalId}"/>'>
									${favoriteHospital.name}</a><br> <br /> 

							</td>

							<td class="mobile" style="text-align: center;"><c:out
									value="${favoriteHospital.treatStart}" /></td>

							<td class="mobile" style="text-align: center;"><c:out
									value="${favoriteHospital.treatEnd}" /></td>

							<td class="mobile" style="text-align: center;"><c:out
									value="${favoriteHospital.address}" /></td>

							<td class="mobile" style="text-align: center;"><c:out
									value="${favoriteHospital.tel}" /></td>

							<td class="mobile" style="text-align: center;">
								<button class="remove" data-bt="btn"
									onclick="location.href='remove?hospitalId=${favoriteHospital.hospitalId}'">삭제</button>
							</td>

						</tr>

					</c:forEach>
				</tbody>
			</table>
</div>


</main>
</div>
</div>

	<!-- 제이쿼리 자바스크립트 추가하기 -->

	<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${ctx}/resources/js/hospital/favorite.js"></script>


<%@include file="/WEB-INF/views/includes/footer.jsp" %>	
</body>

</html>
