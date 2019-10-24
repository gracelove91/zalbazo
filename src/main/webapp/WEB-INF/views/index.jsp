<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="includes/header.jsp"%>

<title>ZALBAZO</title>
<!-- Banner Area Starts -->
<section class="banner-area">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2 px-0"></div>
			<div class="col-lg-5 px-0">
				<div class="banner-bg"></div>
			</div>
			<div class="col-lg-5 align-self-center">
				<div class="banner-text">
					<h1>내 반려동물을 <span>잘</span> 봐줄 </br><span>동물병원</span>을 찾아보세요!</h1>
                    <p class="py-7">24시간운영 병원, 응급수술, 특이한 동물까지.<br>
						당신의 반려동물에 딱 맞는 병원을 찾아보세요.</p>
					<a href="/hospital/list" class="secondary-btn">병원목록 바로가기<span class="flaticon-next"></span></a>
					</br></br>
					<form action="/hospital/searchedlist">
						<input type="text" name="keyword" placeholder="검색어를 입력하세요" onfocus="this.placeholder = ''"
							   onblur="this.placeholder = '검색어를 입력하세요'" required class="form-control" >
						</br>
						<button type="submit" class="template-btn btn-block">검색하기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Banner Area End -->

<!-- Feature Area Starts -->
<section class="feature-area section-padding2" style="padding: 40px 0px 40px 0px;">
	<div class="container">
		<div class="row">
			<div class="col-lg-4">
				<div class="single-feature mb-4 mb-lg-0">
					<h4>병원찾기</h4>
					<p class="py-1">내 반려동물을 잘봐줄 병원을 찾아보세요.</p>
					<a href="/hospital/list" class="secondary-btn">바로가기<span class="flaticon-next"></span></a>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="single-feature mb-4 mb-lg-0">
					<h4>커뮤니티게시판</h4>
					<p class="py-3">자유롭게 소통해보세요.</p>
					<a href="/community/list" class="secondary-btn">바로가기<span class="flaticon-next"></span></a>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="single-feature">
					<h4>지식동게시판</h4>
					<p class="py-3">궁금한 것들을 질문해보세요.</p>
					<a href="/jisikdong/list" class="secondary-btn">바로가기<span class="flaticon-next"></span></a>
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br><br>
</section>
<!-- Feature Area End -->
<%@include file="includes/footer.jsp"%>
