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
<body>
	<nav class="navbar navbar-light bg-light">

		<a class="navbar-brand" href="${ctx}/home"> <img
			src="${ctx}/resources/img/baba.png" width="30" height="30"
			class="d-inline-block align-top" alt=""> Zalbazo

		</a>



		<ul class="navbar-nav">

			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> 게시판 </a>

				<div class="dropdown-menu" aria-labelledby="navbarDropdown">

					<a class="dropdown-item" href="${ctx}/jisikdong/list">지식動</a> <a
						class="dropdown-item" href="${ctx}/community/list">커뮤니티</a>

				</div></li>

		</ul>

		<form class="form-inline">

			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search">

			<button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Search</button>

		</form>

	</nav>

	<div class="container-fluid">
		<div class="row d-flex d-md-block flex-nowrap wrapper">
			<main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
			<div class="page-header mt-3">
				<h2>즐겨찾는 병원</h2>
				</br>
			</div>
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
							<td><a style="color: #000000;"
								href='/hospital/get?hospitalId=<c:out value="${favoriteHospital.hospitalId}"/>'>
									${favoriteHospital.name}</a><br> <br /> 

									<c:forEach items="${favoriteHospital.label}" var="label">

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
									value="${favoriteHospital.treatStart}" /></td>

							<td class="mobile" style="text-align: center;"><c:out
									value="${favoriteHospital.treatEnd}" /></td>

							<td class="mobile" style="text-align: center;"><c:out
									value="${favoriteHospital.address}" /></td>

							<td class="mobile" style="text-align: center;"><c:out
									value="${favoriteHospital.tel}" /></td>

							<td class="mobile" style="text-align: center;">
								<button
									onclick="location.href='remove?id=${favoriteHospital.hospitalId}'">삭제</button>
							</td>

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
