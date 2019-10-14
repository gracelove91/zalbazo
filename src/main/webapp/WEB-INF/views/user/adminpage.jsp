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
<link rel="stylesheet" href="/resources/css/scroll.css">
<title>마이페이지</title>
<body>
<a onclick="topFunction()" id="myBtn" title="Go to top"><img src="${ctx}/resources/img/GoToTop.png" width="50px;"></a>
<div class="container-fluid">
<div class="row d-flex d-md-block flex-nowrap wrapper">
<main id="main">

<div class="page-header row">
	<div class="col-2"></div>
	<div class="col-10">
	<br>
    <h2>${name}의 관리자페이지</h2>
    <input type='hidden' class="email" id="userEmail" value="${useremail}">
    <!-- js에서 	var userEmail = $(".email").val(); 이걸로 메일 호출 가능 -->
    <p>환영합니다!!</p>
    </div>
</div>

<div class="row">
		  <div class="col-2"></div>
		  <div class="col">
		    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
		      <a class="nav-link active" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true" style="padding:5px;">main</a>
		      <a class="nav-link" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false" style="padding:5px;">유저관리</a>
		      <a class="nav-link" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false" style="padding:5px;">병원관리</a>
		      <a class="nav-link" id="v-pills-4-tab" data-toggle="pill" href="#v-pills-4" role="tab" aria-controls="v-pills-4" aria-selected="false" style="padding:5px;">몰라</a>
		      <a class="nav-link" id="v-pills-5-tab" data-toggle="pill" href="#v-pills-5" role="tab" aria-controls="v-pills-5" aria-selected="false" style="padding:5px;">몰라</a>
		    </div>
		  </div>
		  
		  <div class="col-6" style="border: 1.1px solid #04b1fb; border-radius: 4px;">
		    <div class="tab-content" id="v-pills-tabContent">
		    
		      <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-1-tab">
		      	메인
		      </div> <!-- 개인정보 수정 -->
		      
		      <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-2-tab">
		      <br>
			  	<div class="container-fluid">          
				  <table class="table table-striped">
				    <thead>
				      <tr>
				        <th scope="col" class="mobile" style="text-align:center;">이름</th>
				        <th scope="col" class="mobile" style="text-align:center;">이메일</th>
				        <th scope="col" class="mobile" style="text-align:center;">전화번호</th>
				        <th scope="col" class="mobile" style="text-align:center;">가입일</th>
				        <th scope="col" class="mobile" style="width:80px; text-align:center;">삭제</th>
				      </tr>
				    </thead>
				    <tbody class="userList">
				      
				    </tbody>
				  </table>
				</div>
			   </div>
		     
		      <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-3-tab">
		      <br>
				<div class="container-fluid">          
				  <table class="table table-striped">
				    <thead>
				      <tr>
				        <th scope="col" class="mobile" style="text-align:center;">병원이름</th>
				        <th scope="col" class="mobile" style="text-align:center;">이메일</th>
				        <th scope="col" class="mobile" style="text-align:center;">전화번호</th>
				        <th scope="col" class="mobile" style="width:200px; text-align:center;">주소</th>
				        <th scope="col" class="mobile" style="width:60px; text-align:center;">삭제</th>
				      </tr>
				    </thead>
				    <tbody class="hospitalList">
				      
				    </tbody>
				  </table>
				</div>				
		      </div>
		      
		      <div class="tab-pane" id="v-pills-4" role="tabpanel" aria-labelledby="v-pills-4-tab">
				몰라
		      </div>
		      
		      <div class="tab-pane" id="v-pills-5" role="tabpanel" aria-labelledby="v-pills-5-tab">
		      	몰라
		      </div>
		    </div>
		  </div>
		  <div class="col-2"></div>
  
</div>

            
</main>
</div>
</div>

<!-- Bootstrap core JavaScript -->
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${ctx}/resources/js/user/adminFunction.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/admin.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/scroll.js"></script>

<%@include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>