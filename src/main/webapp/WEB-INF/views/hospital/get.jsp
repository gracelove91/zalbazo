<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String ctx = request.getContextPath();
    pageContext.setAttribute("ctx", ctx);
%>
<title>병원 상세 정보</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<%@include file="../includes/header.jsp" %>
</head>

<body>
<input type='hidden' class="hospitalNo" id="hospitalNo" value="${hospital.hospitalId}">
<input type='hidden' class="mailmail" id="mailmail" value="${userEmail}">
<div class="container-fluid">
    <br>
    <h1 style="text-align:center">${hospital.name}</h1>
    <br><br>

    <div class="row">
		<div class="col-1"></div>
        <div class="col-5"><br>
            <p class="h4">
                <i class="material-icons" style="font-weight:bold">call</i> <span>&nbsp;&nbsp;${hospital.tel}</span>
            </p>
            <p class="h4">
                <i class="material-icons" style="font-weight:bold">my_location</i> <span class="h6">&nbsp;&nbsp;${hospital.address}</span>
            </p>
            <p class="h4">
                <i class="material-icons" style="font-weight:bold">alarm</i> <span>&nbsp;&nbsp;${hospital.treatStart}</span>
            </p>
            <p class="h4">
                <i class="material-icons" style="font-weight:bold">alarm_off</i> <span>&nbsp;&nbsp;${hospital.treatEnd}</span>
            </p><br>
            <!-- 해당 병원에 맞는 라벨 출력 -->
            <c:forEach items="${hospital.label}" var="label">
                 <c:if test="${label.labelCode == 1 }">
                     <i class="material-icons"> local_convenience_store </i>24시간&nbsp;&nbsp;&nbsp;
                 </c:if>

                 <c:if test="${label.labelCode == 2 }">
                     <i class="material-icons"> local_florist </i> 미용&nbsp;&nbsp;&nbsp;
                 </c:if>

                 <c:if test="${label.labelCode == 3 }">
                     <i class="material-icons"> local_parking </i> 주차&nbsp;&nbsp;&nbsp;
                 </c:if>

                 <c:if test="${label.labelCode == 4 }">
                     <i class="material-icons"> emoji_nature </i> 특수동물&nbsp;&nbsp;&nbsp;
                 </c:if>
                 
                 <c:if test="${label.labelCode == 5 }">
                     <i class="material-icons"> check_circle </i> 수술
                 </c:if>
            </c:forEach>

            <hr>
            <p class="h5">${hospital.info}</p>

        </div>
        <div class="col-5">
            <!-- 병원사진 슬라이드 쇼 -->
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" style="width: 400px; margin: 0 auto">
                <div class="carousel-inner">
                
					<!-- 병원사진 갯수에 따라 다르게 처리 0개, 1개, 1개 이상일 때 -->
                    <c:choose>
                        <c:when test="${picCount eq 0}">
                        </c:when>

                        <c:when test="${picCount eq 1}">
                          <c:forEach var="list" items="${hospital.attachList}">
                            <div class="carousel-item active">
                                <img src=${ctx}/resources/img/hospital/${list.uuid}_${list.fileName}
                                     width="400px" height="400px">
                            </div>
                          </c:forEach>
                        </c:when>
                        
                        <c:otherwise>
                           <c:forEach items="${hospital.attachList}" var="list" varStatus="status">
                           
                             <c:choose>
                                <c:when test="${status.count == 1}">
  	                               <div class="carousel-item active">
	                                   <img src="${ctx}/resources/img/hospital/${list.uuid}_${list.fileName}"
	                                        width="400px" height="400px">
	                               </div>
	                            </c:when> 
	                            
	                            <c:otherwise>
	                                <div class="carousel-item">
	                                    <img src="${ctx}/resources/img/hospital/${list.uuid}_${list.fileName}"
	                                         width="400px" height="400px">
	                                </div>
	                            </c:otherwise>
	                          </c:choose>
	                            
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>

                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <br>

			<p class="h5 get" style="text-align: center">
				<i class="material-icons" id="reserve" style="cursor: pointer; font-size: 200%; vertical-align: text-bottom;" href="index">event</i> 예약하기
				<img class="favorite" data-i="white" id="outlined" style="cursor: pointer; vertical-align: text-bottom;" src="${ctx}/resources/img/outlined_heart_icon.png" width="40px" height="40px"> 즐겨찾기
			</p>
			
			
        </div>
        <div class="col-1"></div>

    </div>
</div>

    <!-- Related Projects Row -->
<br>
<div class="container-fluid">
<div class="row">

<!-- Nav tabs -->
<div class="col-1"></div>
<div class="col-10">
<hr>
        <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#home">Map</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#menu1">Review</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#menu2">Q&A</a>
            </li>
        </ul>


        <!-- Tab panes -->
        
        <div class="tab-content">
		
            <div id="home" class="container tab-pane active"><br>
            
            	<div class='row'>
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading" style="padding-left: 20px; font-size: x-large;">
                                <strong>${hospital.name}</strong>은 어디에 있을까?
                            </div>
                            
                             <div class="panel-body">
                             	<div class="container mt-3">
                            		<div id="map" style="width:100%;height:400px;"></div>
                            	</div>
                            </div>
                            		
                        </div>
                     </div>
            	</div>
            	
            </div>
			
			
			<div id="menu1" class="container tab-pane fade">

                <br>
                <!-- 리뷰List -->
                <div class='row'>
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading" style="padding-left: 20px; font-size: x-large;">
                                <strong>${hospital.name}</strong> 리뷰
                            </div>
							
                            <div class="panel-body">
                                <ul style="list-style-type:none;">
                                    <li class="left clearfix">
                                        <div class="container mt-3">
                            
                                        	<!-- 리뷰 -->
                                        	<div class="info container" style="background-color:white;">
                                        	<div class="container">
							                    <input type="hidden" class="form-control" name="userEmail" value="${userEmail}">
							                    <input type='hidden' class="form-control" name="hospitalId" value="${hospital.hospitalId}">
							
							                    <!-- <div class="form-group" style="border-width: 5px;">
							                        <textarea class="form-control txt" rows="5" id="review" name="review" placeholder="리뷰를 남겨주세요"></textarea>
							                        <div>
							                        	<div>
								                        	<i class="stars" style="color:gold;font-weight:bold;" name="stars">
		                                                        <i class='material-icons star' id="star1" name="star1" data-star="1">star_border</i>
		                                                        <i class='material-icons star' id="star2" name="star2" data-star="2">star_border</i>
		                                                        <i class='material-icons star' id="star3" name="star3" data-star="3">star_border</i>
		                                                        <i class='material-icons star' id="star4" name="star4" data-star="4">star_border</i>
		                                                        <i class='material-icons star' id="star5" name="star5" data-star="5">star_border</i>
	                                                        </i>
                                                        </div>
                                                        <div align="right">
								                    		<button type="submit" class="btn btn-secondary" id="reviewBtn" name="reviewBtn">Submit</button>
								                    	</div>
								                    </div>
							                    </div> -->
							                </div>
							                
                                        	<!-- 평균 -->
                                            <div class="media border p-3"
                                                 style="background-color:LightCyan; border-style: solid; border-width: 5px;">

                                                <img src="/resources/img/baba.png" class="mr-3 mt-3 rounded-circle"
                                                     style="width: 80px">

                                                <div class="media-body rate">

                                                    <div style="font-weight:bold;font-size: x-large;">
                                                        <h1 class="material-icons"
                                                            style="color:gold; font-weight:bold;font-size: x-large;">
                                                            star</h1>
                                                        <h1 class="material-icons"
                                                            style="color:gold; font-weight:bold;font-size: x-large;">
                                                            star</h1>
                                                        <h1 class="material-icons"
                                                            style="color:gold; font-weight:bold;font-size: x-large;">
                                                            star</h1>
                                                        <h1 class="material-icons"
                                                            style="color:gold; font-weight:bold;font-size: x-large;">
                                                            star</h1>
                                                        <h1 class="material-icons"
                                                            style="color:gold; font-weight:bold;font-size: x-large;">
                                                            star</h1>
                                                        &nbsp;5.0
                                                    </div>
                                                    <p>점수, 총 명수 이런 거 적으면 좋겠다고 생각하는 부분임</p>

                                                </div>

                                            </div>
                                        </div>
                                        </div>
                                    </li>
                                </ul>

                                <div class="container">
                                <ul class="review" style="list-style-type:none;">
                                    <li class="left clearfix" data-rno='12'>
                                        <div class="container mt-3">
                                            <div class="media border p-3">
                                                <img src="/resources/img/baba.png" class="mr-3 mt-3 rounded-circle"
                                                     style="width: 50px">
                                                
                                                <div class="media-body">

                                                    <h4><i style="color:gold;font-weight:bold">
                                                        <i class='material-icons'>star_border</i>
                                                        <i class='material-icons'>star_border</i>
                                                        <i class='material-icons'>star_border</i>
                                                        <i class='material-icons'>star_border</i>
                                                        <i class='material-icons'>star_border</i></i>
                                                    </h4>

                                                    <small><i style="font-weight:bold">baba</i>&nbsp;&nbsp;&nbsp;<i>0000/00/00</i></small>
                                                    <p>아직 리뷰가 존재하지 않습니다</p>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
			
			
			
			

            <div id="menu2" class="container tab-pane fade"><br>
				<div class='row qq'>
                    <input type='hidden' class="form-control" id="email" name="email" value="${email}">
                    <input type='hidden' class="form-control" id="hospitalId" name="hospitalId" value="${hospital.hospitalId}">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading" style="padding-left: 20px; font-size: x-large;">
                                <strong>${hospital.name}</strong>에 궁금한 점을 질문하세요
                            </div>
                            
                             <div class="panel-body">
                             	<div class="container mt-3">
                            		<div class="form-group">
                            			<textarea class="form-control txt" rows="5" id="body" name="body"></textarea>
                    				</div>
                    				
                    				<button type="submit" class="btn btn-secondary float-right" id="regBtn" name="regBtn">Submit</button>
                            	</div>
                            </div>
                            		
                        </div>
                     </div>
            	</div>
            	<br><hr>
                <!-- Q&A list -->
                <div class='row'>
                    <div class="col-lg-12">
                        <div class="panel panel-default">
							<!-- Q&A 리스트 출력 -->
                            <div class="qnaqna accordion">
                            	<br>
                                <div class="card-body primary-font"> 아직 등록된 글이 없습니다.</div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <br><br><br>
            <!-- Q&A 끝 -->

        </div>
</div>
<div class="col-1"></div>
    </div>
</div>    

<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/userFunction.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/hospital/qnaFunction.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/hospital/qna.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/hospital/reviewFunction.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/hospital/review.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/hospital/favoriteFunction.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/hospital/favorite.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5ea4ef47b16d9a398f9876fcc56c42fe&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(37.5031073, 127.024465), // 지도의 중심좌표, 우리는 비트캠프로 했습니다
    level: 1 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('${hospital.address}', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">${hospital.name}</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});   
</script>
<%@include file="../includes/footer.jsp" %>