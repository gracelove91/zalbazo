<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="includes/header.jsp" %>



 	<div class="container">
		<div class="row">
			<div class="col-xl-9 mx-auto">
				<!-- 					<h1 class="mb-5" style="color: gray; font-weight: bold">
					잘바조</h1> -->
			</div>

			<div class="babalogo" id="babalogo">
				<img src="/resources/img/c_baba_logo2.png">
				</br> </br>
			
			</div>
			
		
			<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
				<form name="form1" method="Get" action="/hospital/searchedlist">
					<div class="form-row">
		
							<select name="searchOption">
								<option value="all">전체검색</option>
								<option value="name">병원이름</option>
								<option value="address">주소</option>
								<option value="info">내용</option>
							</select>
								  <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
										<input name="keyword" type="keyword" value="${map.keyword}"
											class="form-control form-control-lg" placeholder="검색어를 입력해주세요.">
									</div>
						<div class="col-12 col-md-3">
							<button type="submit" class="btn btn-block btn-lg btn-primary">검색하기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>