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
	<div class="col-11">
	<br>
    <h2>${useremail} 님의 마이페이지</h2>
    <p>방가방가링~★</p>
    </div>
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
					  <span>전화번호</span><span style="font-size: smaller;">000-0000-0000형태로 입력해주세요</span>
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
		      <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-3-tab">
		      
				<nav>
				  <div class="nav nav-tabs" id="nav-tab" role="tablist">
				    <a class="nav-item nav-link active" id="nav-a-tab" data-toggle="tab" href="#nav-a" role="tab" aria-controls="nav-a" aria-selected="true">커뮤니티</a>
				    <a class="nav-item nav-link" id="nav-b-tab" data-toggle="tab" href="#nav-b" role="tab" aria-controls="nav-b" aria-selected="false">지식동</a>
				    <a class="nav-item nav-link" id="nav-c-tab" data-toggle="tab" href="#nav-c" role="tab" aria-controls="nav-c" aria-selected="false">병원 리뷰</a>
				    <a class="nav-item nav-link" id="nav-d-tab" data-toggle="tab" href="#nav-d" role="tab" aria-controls="nav-d" aria-selected="false">Q&A</a>
				    <a class="nav-item nav-link" id="nav-e-tab" data-toggle="tab" href="#nav-e" role="tab" aria-controls="nav-e" aria-selected="false">댓글</a>
				  </div>
				</nav>
				
				<div class="tab-content fade show active" id="nav-tabContent">
				
				  <div class="tab-pane fade show active" id="nav-a" role="tabpanel" aria-labelledby="nav-a-tab">
				  
				  	<div class="container">
				  	<br>            
					  <table class="table table-striped" style="max-width: 1080px;">
				      	<thead>
				        	<tr>
				              <th scope="col" class="mobile" style="width:80px; text-align:center;">번호</th>
				              <th scope="col" class="mobile" style="text-align:center;">제목</th>
				              <th scope="col" class="mobile" style="width:110px; text-align:center;">날짜</th>
				            </tr>
				        </thead>
				        <tbody class="table1">
				        	<tr>
				            	<th scope="row" class="mobile" style="text-align:center;"></th>
				                <td>
				                  <a class='move' style="color : #000000;" href=#></a>
				                </td>
				                <td class="mobile" style="text-align:center;">
				                </td>
				        	</tr>
				      	</tbody>
				      </table>
					</div>

				  </div><!-- 커뮤니티 끝 -->
				  
				  <div class="tab-pane fade" id="nav-b" role="tabpanel" aria-labelledby="nav-b-tab">
				  
					<div class="container">
					<br>            
						 <table class="table table-striped" style="max-width: 1080px;">
					      <thead>
					        <tr>
					           <th scope="col" class="mobile" style="width:80px; text-align:center;">번호</th>
					           <th scope="col" class="mobile" style="text-align:center;">제목</th>
					           <th scope="col" class="mobile" style="width:110px; text-align:center;">날짜</th>
					        </tr>
					      </thead>
					      <tbody class="table2">
					        <tr>
					           <th scope="row" class="mobile" style="text-align:center;"></th>
					              <td>
					                <a class='move' style="color : #000000;" href=#></a>
					              </td>
					              <td class="mobile" style="text-align:center;">
					              </td>
					        </tr>
					      </tbody>
					     </table>
					</div>
				  
				  </div> <!-- 지식동 끝 -->
				  
				  <div class="tab-pane fade" id="nav-c" role="tabpanel" aria-labelledby="nav-c-tab">
				  
                     <ul class="review table3" style="list-style-type:none;">
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
                                				  
				  </div> <!-- 병원리뷰 끝 -->
				  
				  <div class="tab-pane fade" id="nav-d" role="tabpanel" aria-labelledby="nav-d-tab">
				  
				  	<br>
					<div class="table4">
                    	<div class="card-body primary-font">등록된 Q&A가 없습니다</div> <!-- qna가 생기면 이 부분이 바뀜 -->
                    </div>
                    <br>
                    				  
				  </div> <!-- Q&A 끝 -->
				  
				  <div class="tab-pane" id="nav-e" role="tabpanel" aria-labelledby="nav-e-tab">
				  
				  	<ul class="list-group table5">
				  	<br>
                    	<li class="list-group-item">
                            <div>
                            	<div class="card-body primary-font">등록된 댓글이 없습니다</div>
                            </div>
                        </li>
                    </ul>
                    <br>
				  </div> <!-- 댓글 끝 -->
				  
				</div>
				
		      </div><!-- 내가 쓴 글 -->
		      
		      <div class="tab-pane" id="v-pills-4" role="tabpanel" aria-labelledby="v-pills-4-tab">예약 내역</div>
		      <div class="tab-pane" id="v-pills-5" role="tabpanel" aria-labelledby="v-pills-5-tab">즐겨찾는 병원
		      <div class="fav">
			<table class="table table-striped">

				<thead>
					<tr>
						<th scope="col" class="mobile"
							style="width: 150px; text-align: center;">No.</th>
	
						<th scope="col" class="mobile"
							style="width: 600px; text-align: center;">병원명</th>
						
						<th scope="col" class="mobile"
							style="width: 700px; text-align: center;">주소</th>
						<th scope="col" class="mobile"
							style="width: 300px; text-align: center;">전화번호<br>
						</th>
						<th scope="col" class="mobile"
							style="width: 350px; text-align: center;"> </th>
					</tr>
				</thead>
				<tbody class="fhlist">
				
					<tr>
					<th scope='row' class='mobile' style='width: 150px; text-align:center;'></th>
					
					<td style='width: 600px; text-align: center;'>
					  <a class='move' style='color : #000000;' href='#'></a>
					</td>
					
					<td style='width: 700px; text-align: center;'>
					  <a class='move' style='color : #000000;'></a>
					</td>
					
					<td style='width: 300px; text-align: center;'>
					  <a class='move' style='color : #000000;'></a>
					</td>
					
					<td style='width: 350px; text-align: center;'>
					  <a class='move' style='color : #000000;' >
					  <button class='remove' id='' data-bt='btn'>삭제</button></a>
					</td>
					</tr>			

				</tbody>
			</table>
			</div>
		      
		      </div>
		      <div class="tab-pane" id="v-pills-6" role="tabpanel" aria-labelledby="v-pills-6-tab">회원 탈퇴</div>
		    </div>
		  </div>
		  <div class="col-1"></div>
  
</div>

            
</main>
</div>
</div>


<!-- Bootstrap core JavaScript -->
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${ctx}/resources/js/user/mycontentFunction.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/mycontent.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/myInfoFunction.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/myInfo.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/myFavoriteHospitalFunction.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/myFavoriteHospital.js"></script>

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