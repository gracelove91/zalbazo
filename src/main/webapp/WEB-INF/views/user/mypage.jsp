<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@include file="/WEB-INF/views/includes/header.jsp" %>

<title>마이페이지</title>

<div class="container-fluid">
    <div class="row d-flex d-md-block flex-nowrap wrapper">
        <main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
            <div class="page-header mt-3">
                <h2>${useremail}님의 마이페이지</h2>
                <p>방가방가링~★</p>
            </div>
			<br>
			<div class="row">

		  <div class="col-3">
		    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
		      <a class="nav-link active" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">개인정보 수정</a>
		      <a class="nav-link" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">동물 관리</a>
		      <a class="nav-link" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false">내가 쓴 글</a>
		      <a class="nav-link" id="v-pills-4-tab" data-toggle="pill" href="#v-pills-4" role="tab" aria-controls="v-pills-4" aria-selected="false">예약 내역</a>
		      <a class="nav-link" id="v-pills-5-tab" data-toggle="pill" href="#v-pills-5" role="tab" aria-controls="v-pills-5" aria-selected="false">즐겨찾는 병원</a>
		      <a class="nav-link" id="v-pills-6-tab" data-toggle="pill" href="#v-pills-6" role="tab" aria-controls="v-pills-6" aria-selected="false">회원 탈퇴</a>
		    </div>
		  </div>
		  
		  <div class="col-9" style="border: 5px solid purple;">
		    <div class="tab-content" id="v-pills-tabContent">
		      <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-1-tab">개인정보 수정
		      	
		      	<p> 이메일 : </p>
		      	<p> 이름 : </p>
		      	<p> 전화번호 : </p>
		      	<p> 비밀번호 : </p>
		      	<p> 주소 : </p>
		      </div> <!-- 개인정보 수정 -->
		      
		      <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-2-tab">동물 관리</div>
		      <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-3-tab">
		      
				<nav>
				  <div class="nav nav-tabs" id="nav-tab" role="tablist">
				    <a class="nav-item nav-link active" id="nav-a-tab" data-toggle="tab" href="#nav-a" role="tab" aria-controls="nav-a" aria-selected="true">리뷰</a>
				    <a class="nav-item nav-link" id="nav-b-tab" data-toggle="tab" href="#nav-b" role="tab" aria-controls="nav-b" aria-selected="false">Q&A</a>
				    <a class="nav-item nav-link" id="nav-c-tab" data-toggle="tab" href="#nav-c" role="tab" aria-controls="nav-c" aria-selected="false">커뮤니티</a>
				    <a class="nav-item nav-link" id="nav-d-tab" data-toggle="tab" href="#nav-d" role="tab" aria-controls="nav-d" aria-selected="false">지식동</a>
				    <a class="nav-item nav-link" id="nav-e-tab" data-toggle="tab" href="#nav-e" role="tab" aria-controls="nav-e" aria-selected="false">댓글</a>
				  </div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
				  <div class="tab-pane fade show active" id="nav-a" role="tabpanel" aria-labelledby="nav-a-tab">리뷰</div>
				  <div class="tab-pane fade" id="nav-b" role="tabpanel" aria-labelledby="nav-b-tab">Q&A</div>
				  <div class="tab-pane fade" id="nav-c" role="tabpanel" aria-labelledby="nav-c-tab">커뮤니티</div>
				  <div class="tab-pane fade" id="nav-d" role="tabpanel" aria-labelledby="nav-d-tab">지식동</div>
				  <div class="tab-pane fade" id="nav-e" role="tabpanel" aria-labelledby="nav-e-tab">댓글</div>
				</div>
				
		      </div><!-- 내가 쓴 글 -->
		      
		      <div class="tab-pane fade" id="v-pills-4" role="tabpanel" aria-labelledby="v-pills-4-tab">예약 내역</div>
		      <div class="tab-pane fade" id="v-pills-5" role="tabpanel" aria-labelledby="v-pills-5-tab">즐겨찾는 병원
		      <br>
		      <div class="fav">
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
								<button class="remove" data-bt="btn"
									onclick="location.href='remove?hospitalId=${favoriteHospital.hospitalId}'">삭제</button>
							</td>

						</tr>

					</c:forEach>
				</tbody>
			</table>
</div>

		      
		      </div>
		      <div class="tab-pane fade" id="v-pills-6" role="tabpanel" aria-labelledby="v-pills-6-tab">회원 탈퇴</div>
		    </div>
		  </div>
  
</div>

            <footer class="text-center" style="max-width: 1080px;">
                <p>
                    Copyright ⓒ 2019 <b>zalbazo</b> All Rights Reserved.
                </p>
            </footer> </main>
    </div>
</div>


	<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>