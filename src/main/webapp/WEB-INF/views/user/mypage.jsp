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
    <input type='hidden' class="email" id="userEmail" value="${useremail}">
    <!-- js에서 	var userEmail = $(".email").val(); 이걸로 메일 호출 가능 -->
    <p>환영합니다!!</p>
    </div>
</div>

<div class="row">
		  <div class="col-1"></div>
		  <div class="col-2">
		    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
		      <a class="nav-link active" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true" style="padding:5px;">개인정보 수정</a>
		      <a class="nav-link" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false" style="padding:5px;">동물 관리</a>
		      <a class="nav-link" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false" style="padding:5px;">내가 쓴 글</a>
		      <a class="nav-link" id="v-pills-4-tab" data-toggle="pill" href="#v-pills-4" role="tab" aria-controls="v-pills-4" aria-selected="false" style="padding:5px;">예약 내역</a>
		      <a class="nav-link" id="v-pills-5-tab" data-toggle="pill" href="#v-pills-5" role="tab" aria-controls="v-pills-5" aria-selected="false" style="padding:5px;">즐겨찾는 병원</a>
		    </div>
		  </div>
		  
		  <div class="col-8">
		    <div class="tab-content" id="v-pills-tabContent">
		    
		      <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-1-tab">
		      	<div id="main" class="col-md-12">
			          <div class="page-header mt-3">
			              <h2>상세정보 보기</h2>
			          </div>
			          <hr>
		      	<div class="infoinfo">
		      		<div class='form-group a'>
					  <span>이메일</span>
					  <input type='text' class='form-control col-12' id='email' name='email' readonly>
					</div>
		      		<div class='form-group a'>
					  <span>이름</span>
					  <input type='text' class='form-control col-12' id='aname' name='aname' value=''>
					</div>
		      		<div class='form-group a'>
					  <span>전화번호</span>
					  <input type='text' class='form-control col-12' id='tel' name='tel' value=''>
					</div>
		      		<div class='form-group a'>
					  <span>주소</span>
					  <input type='text' class='form-control col-12' id='address' name='address' value='' readonly>
					</div>
		      		<div class='form-group a'>
					  <span>가입일</span>
					  <input type='text' class='form-control col-12' id='joinDate' name='joinDate' readonly>
					</div>																		
		      	</div>
		      	
				<button id="modifyBtn" class="btn btn-primary modifyBtn pull-right">Modify</button>
				<br><br>
			  </div>
		      </div> <!-- 개인정보 수정 -->
		      
		      <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-2-tab">
		  
			  	<div class="container"><br>
			   	 <table class="table table-striped col-12">
						      <thead>
						        <tr>
						           <th scope="col" class="mobile" style="width:80px; text-align:center;">번호</th>
						           <th scope="col" class="mobile" style="text-align:center;">이름</th>
						           <th scope="col" class="mobile" style="text-align:center;">타입</th>
						           <th scope="col" class="mobile" style="text-align:center;">성별</th>
						           <th scope="col" class="mobile" style="text-align:center;">몸무게</th>
						           <th scope="col" class="mobile" style="text-align:center;">나이</th>
						           <th scope="col" class="mobile" style="width:120px; text-align:center;">특이사항</th>
						           <th scope="col" class="mobile" style="text-align:center;">수정/삭제</th>
						           
						        </tr>
						      </thead>
						      <tbody id="animalt">
						      
						      </tbody>
			   	
			   	</table>  
			   	
				<a href="/user/mypage/animal/register?userEmail=${useremail}" id='regBtn'>
					<button class="btn btn-primary pull-right">동물등록</button>
				</a>
			   	<br>
			   	<br>
			   	</div>
			  
		     </div> <!-- 동물등록 -->
		     
		      <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-3-tab">
		      	<br>
				<nav>
				  <div class="nav nav-tabs" id="nav-tab" role="tablist">
				    <a class="nav-item nav-link active" id="nav-a-tab" data-toggle="tab" href="#nav-a" role="tab" aria-controls="nav-a" aria-selected="true">&nbsp;&nbsp;&nbsp;커뮤니티&nbsp;&nbsp;&nbsp;</a>
				    <a class="nav-item nav-link" id="nav-b-tab" data-toggle="tab" href="#nav-b" role="tab" aria-controls="nav-b" aria-selected="false">&nbsp;&nbsp;&nbsp;지식동&nbsp;&nbsp;&nbsp;</a>
				    <a class="nav-item nav-link" id="nav-c-tab" data-toggle="tab" href="#nav-c" role="tab" aria-controls="nav-c" aria-selected="false">&nbsp;&nbsp;&nbsp;병원 리뷰&nbsp;&nbsp;&nbsp;</a>
				    <a class="nav-item nav-link" id="nav-d-tab" data-toggle="tab" href="#nav-d" role="tab" aria-controls="nav-d" aria-selected="false">&nbsp;&nbsp;&nbsp;Q&A&nbsp;&nbsp;&nbsp;</a>
				    <a class="nav-item nav-link" id="nav-e-tab" data-toggle="tab" href="#nav-e" role="tab" aria-controls="nav-e" aria-selected="false">&nbsp;&nbsp;&nbsp;댓글&nbsp;&nbsp;&nbsp;</a>
				  </div>
				</nav>
				<hr>
				<div class="tab-content fade show active" id="nav-tabContent">
				
				  <div class="tab-pane fade show active" id="nav-a" role="tabpanel" aria-labelledby="nav-a-tab">
				  
				  	<div class="container">           
					  <table class="table table-striped col-12">
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
						 <table class="table table-striped col-12">
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
                                         <p>등록된 리뷰가 없습니다</p>
                                     </div>
                                     
                                 </div>
                             </div>
                         </li>
                     </ul>
                     <br>         				  
				  </div> <!-- 병원리뷰 끝 -->
				  
				  <div class="tab-pane fade" id="nav-d" role="tabpanel" aria-labelledby="nav-d-tab">
					<div class="table4">
                    	<div class="card-body primary-font">등록된 Q&A가 없습니다</div> <!-- qna가 생기면 이 부분이 바뀜 -->
                    </div>
                    <br>
                    				  
				  </div> <!-- Q&A 끝 -->
				  
				  <div class="tab-pane" id="nav-e" role="tabpanel" aria-labelledby="nav-e-tab">
				  
				  	<ul class="list-group table5">
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
		      
		      <div class="tab-pane" id="v-pills-4" role="tabpanel" aria-labelledby="v-pills-4-tab">
		      		<br>
		      		<div class="myreserve">
					<table class="table table-striped col-12">
				      <thead>
				        <tr>
				           <th scope="col" class="mobile" style="width:80px; text-align:center;">No.</th>
				           <th scope="col" class="mobile" style="text-align:center;">병원명</th>
				           <th scope="col" class="mobile" style="text-align:center;">예약 시간</th>
				           <th scope="col" class="mobile" style="text-align:center;">동물 이름</th>
				           <th scope="col" class="mobile" style="text-align:center;">진행 상태</th>
				           <th scope="col" class="mobile" style="width:100px; text-align:center;"></th>
				        </tr>
				      </thead>
				      
				      <tbody class="myreservelist">
				        <tr>
				        
						<th scope='row' class='mobile' style='width:80px; text-align:center;'></th>
						
						<td style='text-align: center;'>
						  <a class='move' style='color : #000000;' href='#'>병원명</a>
						</td>
						
						<td style='text-align: center;'>
						  <a class='move' style='color : #000000;'>예약 시간</a>
						</td>
						
						<td style='text-align: center;'>
						  <a class='move' style='color : #000000;'>동물 이름</a>
						</td>
						
						<td style='text-align: center;'>
						  <a class='move' style='color : #000000;'>진행 상태</a>
						</td>
						
						<td style='text-align: center;'>
						  <a class='move' style='color : #000000;' >
						  <button class='#' id='' data-bt='#' style='font-size:14px'>리뷰 쓰기</button></a>
						</td>
						
						</tr>	
				      </tbody>
				      
			   		</table> 
					</div>
		      		
		      </div>
		      
		      <div class="tab-pane" id="v-pills-5" role="tabpanel" aria-labelledby="v-pills-5-tab"> <!-- 즐겨찾는 병원 -->
		      <br>
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
		      
		      </div><!-- 즐겨찾는 병원 -->
		    </div>
		  </div>
		  <div class="col-1"></div>
  
</div>

            
</main>
</div>
</div>

<!-- 리뷰 모달 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">병원 리뷰 작성</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>병원명</label>
					<input class="form-control" name="name" id="name" value="병원명" readonly>
					<input type='hidden' class="form-control" name="hospitalId" id="hospitalId" value="병원id">
				</div>
				<div class="form-group">
					<label>예약 시간</label>
					<input class="form-control" name="rdate" id="rdate" value="예약시간" readonly>
				</div>
				<div class="form-group">
					<label>동물 이름</label>
					<input class="form-control" name="aname" id="aname" value="동물이름" readonly>
				</div>
				<div class="form-group">
					<label>리뷰</label>
					<input type='hidden' class="form-control" name="reviewDate" id="reviewDate" value="sysdate">
					<input type='hidden' class="form-control" name="userEmail" id="userEmail"value="${useremail}">
					<textarea class="form-control txt" rows="5" id="review" name="review" placeholder="리뷰를 남겨주세요"></textarea><br>
					<div>
						<i class="stars" style="color:gold;font-weight:bold;" name="stars" id="stars">
				            <i class='material-icons star' id="star1" name="star1" data-star="1">star_border</i>
				            <i class='material-icons star' id="star2" name="star2" data-star="2">star_border</i>
				            <i class='material-icons star' id="star3" name="star3" data-star="3">star_border</i>
				            <i class='material-icons star' id="star4" name="star4" data-star="4">star_border</i>
				            <i class='material-icons star' id="star5" name="star5" data-star="5">star_border</i>
		                </i>
                    </div>	
				</div>
				<div class="modal-footer">
					<button id="modalReviewBtn" name="modalReviewBtn" type="button" class="btn btn-primary pull-right">작성 완료</button>
				</div>
				
			</div>
		</div>
	</div>
</div>



<!-- Bootstrap core JavaScript -->
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${ctx}/resources/js/user/mycontentFunction.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/mycontent.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/myInfoFunction.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/myInfo.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/myAnimalFunction.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/myAnimal.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/myreserveFunction.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/myreserve.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/hospital/favoriteFunction.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/hospital/myFavorite.js"></script>

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