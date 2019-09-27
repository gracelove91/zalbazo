<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@include file="/WEB-INF/views/includes/header.jsp" %>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<%
    String ctx = request.getContextPath();
    pageContext.setAttribute("ctx", ctx);
%>

<title>마이페이지</title>

<div class="container-fluid">
<div class="row d-flex d-md-block flex-nowrap wrapper">
<main id="main">

<div class="page-header row">
	<div class="col-1"></div>
	<div class="col-10">
	<br>
    <h2>${useremail} 님의 마이페이지</h2>
    <p>방가방가링~★</p>
    </div>
    <div class="col-1"></div>
</div>

<div class="row">
		  <div class="col-1"></div>
		  <div class="col-2">
		    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
		      <a class="nav-link active" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">개인정보 수정</a>
		      <a class="nav-link" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">동물 관리</a>
		      <a class="nav-link" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false">내가 쓴 글</a>
		      <a class="nav-link" id="v-pills-4-tab" data-toggle="pill" href="#v-pills-4" role="tab" aria-controls="v-pills-4" aria-selected="false">예약 내역</a>
		      <a class="nav-link" id="v-pills-5-tab" data-toggle="pill" href="#v-pills-5" role="tab" aria-controls="v-pills-5" aria-selected="false">즐겨찾는 병원</a>
		      <a class="nav-link" id="v-pills-6-tab" data-toggle="pill" href="#v-pills-6" role="tab" aria-controls="v-pills-6" aria-selected="false">회원 탈퇴</a>
		    </div>
		  </div>
		  
		  <div class="col-8" style="border: 5px solid purple;">
		    <div class="tab-content" id="v-pills-tabContent">
		      <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-1-tab">
		      	<br>
				
		      	<div class="infoinfo">
		      		<div class='form-group a'>
					  <span>이메일</span>
					  <input type='text' class='form-control col-8' id='email' name='email' readonly>
					</div>
		      		<div class='form-group a'>
					  <span>이름</span>
					  <input type='text' class='form-control col-8' id='name' name='name' value=''>
					</div>
		      		<div class='form-group a'>
					  <span>전화번호</span>
					  <input type='text' class='form-control col-8' id='tel' name='tel' value=''>
					</div>
		      		<div class='form-group a'>
					  <span>주소</span>
					  <input type='text' class='form-control col-8' id='address' name='address' value='' readonly>
					</div>
		      		<div class='form-group a'>
					  <span>가입일</span>
					  <input type='text' class='form-control col-8' id='joinDate' name='joinDate' readonly>
					</div>																		
		      	</div>
		      	
				<button id="modifyBtn" class="btn btn-primary modifyBtn">Modify</button>
				<br><br>
		      </div> <!-- 개인정보 수정 -->
		      
		      <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-2-tab">동물 관리</div>
		      <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-3-tab">내가쓴글</div>
		      <div class="tab-pane" id="v-pills-4" role="tabpanel" aria-labelledby="v-pills-4-tab">예약 내역</div>
		      <div class="tab-pane" id="v-pills-5" role="tabpanel" aria-labelledby="v-pills-5-tab">즐겨찾는 병원</div>
		      <div class="tab-pane" id="v-pills-6" role="tabpanel" aria-labelledby="v-pills-6-tab">회원 탈퇴</div>
		    </div>
		  </div>
		  <div class="col-1"></div>
  
</div>

            
</main>
</div>
</div>


<!-- Bootstrap core JavaScript -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript" src="${ctx}/resources/js/user/myInfoFunction.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/myInfo.js"></script>

<script>
    function goPopup(){
        var pop = window.open("jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes");
    }

    function jusoCallBack(roadFullAddr){
        $("#address").val(roadFullAddr);
    }
</script>
<%@include file="/WEB-INF/views/includes/footer.jsp" %>
</body>

</html>