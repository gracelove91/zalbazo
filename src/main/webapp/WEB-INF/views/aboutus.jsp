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
<title>ABOUT ZALBAZO</title>
<body>
<div class="container-fluid">
<p align="center" style="font-size:50px;color:black">동물이 아플 땐 <span style="color:#25CCF7; font-weight:bold;">잘바조</span></p>
<h1 align="center">ㅡ</h1>
<h4 align="center">잘바조는 조건에 맞는 동물병원 검색부터 병원정보, 예약, 리뷰, 동물상식까지</h4>
<h4 align="center">모든 동물에게 꼭 맞는 의료서비스를 제공할 수 있도록</h4>
<h4 align="center">동물과 사람 그리고 병원을 이어주는 의료정보 플랫폼입니다.</h4>
<br>
<br>
<div class="row">

  	<div class="col-2"></div>
  	
    <div class="col">
      <div class="img" align="center" style="margin-bottom:20px">
      <img width="200px" src="${ctx}/resources/img/aboutus/오늘의예약.png">
      </div>
      <h2 align="center">누적 예약 수</h2>
      <h3 align="center">ㅡ</h3>
      <h1 id="reserve" align="center">100만</h1>
    </div>
    
    <div class="col">
      <div class="img" align="center" style="margin-bottom:20px">
      <img width="200px" src="${ctx}/resources/img/aboutus/리뷰수.png">
      </div>
      <h2 align="center">누적 리뷰수</h2>
      <h3 align="center">ㅡ</h3>
      <h1 id="review" align="center">100만</h1>
    </div>
    
     <div class="col">
      <div class="img" align="center" style="margin-bottom:20px">
      <img width="200px" src="${ctx}/resources/img/aboutus/유저수.png">
      </div>
      <h2 align="center">잘바조 사용자</h2>
      <h3 align="center">ㅡ</h3>
      <h1 id="user" align="center">100만</h1>
    </div>
    
    <div class="col">
	  <div class="img" align="center" style="margin-bottom:20px">
      <img width="200px" src="${ctx}/resources/img/aboutus/병원수.png">
      </div>
      <h2 align="center">누적 병원찾기</h2>
      <h3 align="center">ㅡ</h3>
      <h1 id="hos" align="center">100만</h1>
    </div>
    
    <div class="col-2"></div>
    
</div> <!-- row -->
</div> <!-- container-fluid -->
</body>

<!-- Bootstrap core JavaScript -->
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${ctx}/resources/js/aboutusFunction.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/aboutus.js"></script>

<%@include file="includes/footer.jsp"%>
