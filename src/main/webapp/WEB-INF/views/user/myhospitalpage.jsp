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
<title>병원 마이페이지</title>
<div class="container-fluid">
<div class="row d-flex d-md-block flex-nowrap wrapper">
<main id="main">
<style>
img{
   display : inline;
   padding: 10px;
}
</style>
<div class="page-header row">
	<div class="col-1"></div>
	<div class="col-11">
	<br>
    <h2>${useremail} 님의 병원마이페이지</h2>
    <p>방가방가링~★</p>
    </div>
</div>

<div class="row">
		  <div class="col-1"></div>
		  <div class="col-2">
		    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
		      <a class="nav-link active" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true" style="padding:5px;">병원정보 수정</a>
		      <a class="nav-link" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false" style="padding:5px;">예약 관리</a>
		      <a class="nav-link" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false" style="padding:5px;">예약 내역</a>
		      <a class="nav-link" id="v-pills-4-tab" data-toggle="pill" href="#v-pills-4" role="tab" aria-controls="v-pills-4" aria-selected="false" style="padding:5px;">병원 Q&A</a>
		      <a class="nav-link" id="v-pills-5-tab" data-toggle="pill" href="#v-pills-5" role="tab" aria-controls="v-pills-5" aria-selected="false" style="padding:5px;">내가 쓴 글</a>
		    </div>
		  </div>
		  
		  <div class="col-8" style="border: 2px solid #25ccf7;">
		    <div class="tab-content" id="v-pills-tabContent">
		    
		      <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-1-tab"><!-- 병원정보 수정 -->
				      <div id="main" class="col-md-12">
			          <div class="page-header mt-3">
			              <h2>병원상세정보</h2>
			          </div>
			          <hr>
			      
			      
			      <form class="pt-3 md-3" role='form' action="/hospitalinfo/modify" method="post" enctype="multipart/form-data">
			          <input type='hidden' class="email" id="userEmail" name="userEmail" value="${useremail}">
			          <div class="hospitalGet">
			          
						<div class="form-group">
						   <fieldset>
			                  <label class="font-weight-bold">병원명</label>
			                  <input type="text" class="form-control" id="name" name="name" placeholder="병원명을 입력하세요">
			               </fieldset>
			            </div><br />
			
			
						<div class="form-group">
						   <fieldset>
			                  <label class="font-weight-bold">전화번호</label>
			                  <input type="text" class="form-control" id="tel" name="tel" placeholder="000-0000-0000">
			               </fieldset>
			            </div><br />
			            
			
						<div class="form-group">
						  <p class="font-weight-bold">제공하는 서비스를 체크해주세요</p>
						  
						    <div class="form-check-inline">
						      <label class="form-check-label" for="check1">
						        <input type="checkbox" class="form-check-input" id="label_info" name="label_info" value=1>24시간
						      </label>
						    </div>
						    
						    <div class="form-check-inline">
						      <label class="form-check-label" for="check2">
						        <input type="checkbox" class="form-check-input" id="label_info" name="label_info" value=2>미용
						      </label>
						    </div>
						    
						    <div class="form-check-inline">
						      <label class="form-check-label" for="check3">
						        <input type="checkbox" class="form-check-input" id="label_info" name="label_info" value=3>주차
						      </label>
						    </div>
						    
						    <div class="form-check-inline">
						      <label class="form-check-label" for="check4">
						        <input type="checkbox" class="form-check-input" id="label_info" name="label_info" value=4>희귀종취급
						      </label>
						    </div>
						    
						    <div class="form-check-inline">
						      <label class="form-check-label" for="check5">
						        <input type="checkbox" class="form-check-input" id="label_info" name="label_info" value=5>수술전문
						      </label>
						    </div>
						
						</div><br />
						
						
						
						<div class="form-group">
			                <fieldset>
			                    <label class="font-weight-bold">주소</label>
			                    <input required="required" type="text" class="form-control" name="address" 
			                    	   id="address" placeholder="주소를 입력하세요." readonly="true"/>
			                    <input type="button" onClick="goPopup();" value="주소찾기"/>
			                </fieldset>
			            </div><br />
			            
			            
			            <div class="row">
			            
			            <div class="form-group col-md-6">
					      <label for="sel1" class="font-weight-bold">문 여는 시간</label>
					      <select class="form-control" id="treatStart" name="treatStart">
					        
					        <c:forEach begin="0" end="24" step="1" var="hour">
					           <!-- hour라는 값에 변수가 10보다 작을 경우 -->
					           <c:if test="${hour < 10}">
					              <!-- hour 01,02,03... 으로 바뀜 -->
					              <c:set value="0${hour}" var="hour"></c:set>
					           </c:if>
					           <option>${hour}:00</option>
					        </c:forEach>
					      </select>
					    </div>
					    
					    <div class="form-group col-md-6">
					      <label for="sel1" class="font-weight-bold">문 닫는 시간</label>
					      <select class="form-control" id="treatEnd" name="treatEnd">
					        
					        <c:forEach begin="0" end="24" step="1" var="hour">
					           <!-- hour라는 값에 변수가 10보다 작을 경우 -->
					           <c:if test="${hour < 10}">
					              <!-- hour 01,02,03... 으로 바뀜 -->
					              <c:set value="0${hour}" var="hour"></c:set>
					           </c:if>
					           <option>${hour}:00</option>
					        </c:forEach>
					      </select>
					    </div>
					    
					    </div><br />
						
			            
			            
			            <div class="form-group">
			               <fieldset>
			                  <label class="font-weight-bold">세부사항</label>
			                  <textarea class="form-control" id="info" name="info"
										placeholder="병원에 대한 상세정보를 적어주세요." style="height: 200px;"></textarea>
			               </fieldset>
			            </div><br />
			            
			            
			            
			            <!-- 파일 첨부 부분 -->
			            <div class="row">
			               <div class="col-lg-12">
			               
			                   <div class="form-group uploadDiv">
			                   	  <label class="font-weight-bold">병원 사진</label><br>
			                      <input type="file" name='uploadFile' multiple>
			                   </div>
			                   
			                   <div class='uploadResult'>
			                      <ul>
			                      </ul>
			                   </div>
			                        
			               </div>
			            </div>
			            </div>
			            
			            <input class="email" type="hidden" name="userEmail" value="${useremail}"/>
			            
			            <button type="submit" class="btn btn-primary float-right">수정하기</button>
			         </form>
			         <br /><br /><br />
			
			        </div>
		      </div> <!-- 병원정보 수정 -->
		      
		      <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-2-tab">
				예약관리	
		     </div>
		     
		      <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-3-tab"> <!-- 예약내역 -->
					<br>
		      		<div class="viewreserve">
					<table class="table table-striped col-12">
				      <thead>
				        <tr>
				           <th scope="col" class="mobile" style="width:80px; text-align:center;">No.</th>
				           <th scope="col" class="mobile" style="text-align:center;">예약 시간</th>
				           <th scope="col" class="mobile" style="text-align:center;">동물 이름</th>
				           <th scope="col" class="mobile" style="text-align:center;">Email</th>
				           <th scope="col" class="mobile" style="text-align:center;">진행 상태</th>
				           <th scope="col" class="mobile" style="width:108px; text-align:center;"></th>
				           <th scope="col" class="mobile" style="width:108px; text-align:center;"></th>
				        </tr>
				      </thead>
				      
				      <tbody class="myreservelist">
				        <tr>
				        
						<th scope='row' class='mobile' style='width:80px; text-align:center;'></th>
						
						<td style='text-align: center;'>
						  <a class='move' style='color : #000000;' href='#'>예약 시간</a>
						</td>
						
						<td style='text-align: center;'>
						  <a class='move' style='color : #000000;'>동물 이름</a>
						</td>
						
						<td style='text-align: center;'>
						  <a class='move' style='color : #000000;'>Email</a>
						</td>
						
						<td style='text-align: center;'>
						  <a class='move' style='color : #000000;'>진행 상태</a>
						</td>
						
						<td style='text-align: center;'>
						  <a class='move' style='color : #000000;' >
						  <button class='status' id='status' data-no='#' style='font-size:14px'>상세보기</button></a>
						</td>
						
						<td style='text-align: center;'>
						  <a class='move' style='color : #000000;' >
						  <button class='delete' id='delete' data-no='#' style='font-size:14px'>예약삭제</button></a>
						</td>
						
						</tr>	
				      </tbody>
				      
			   		</table> 
					</div>
		      </div>
		      
		      <div class="tab-pane" id="v-pills-4" role="tabpanel" aria-labelledby="v-pills-4-tab">
		      	<br>
				<nav>
				  <div class="nav nav-tabs" id="nav-tab" role="tablist">
				    <a class="nav-item nav-link active" id="nav-a-tab" data-toggle="tab" href="#nav-a" role="tab" aria-controls="nav-a" aria-selected="true">&nbsp;&nbsp;&nbsp;Q&A&nbsp;&nbsp;&nbsp;</a>
				  </div>
				</nav>
				<hr>
				<div class="tab-content fade show active" id="nav-tabContent">
				
				  <div class="tab-pane fade show active" id="nav-a" role="tabpanel" aria-labelledby="nav-a-tab"> <!-- Q&A -->
				  	<div class="qqq">
                    	<div class="card-body primary-font">등록된 Q&A가 없습니다</div> <!-- qna가 생기면 이 부분이 바뀜 -->
                    </div>
                    <br>
				  </div> <!-- Q&A끝 -->
				  
				</div>
		      </div>
		      
		      <div class="tab-pane" id="v-pills-5" role="tabpanel" aria-labelledby="v-pills-5-tab">
				<br>
				<nav>
				  <div class="nav nav-tabs" id="nav-tab" role="tablist">
				    <a class="nav-item nav-link active" id="nav-c-tab" data-toggle="tab" href="#nav-c" role="tab" aria-controls="nav-c" aria-selected="false">&nbsp;&nbsp;&nbsp;댓글&nbsp;&nbsp;&nbsp;</a>
				  </div>
				</nav>
				<hr>
				<div class="tab-content fade show active" id="nav-tabContent">
				
				  <div class="tab-pane show active" id="nav-c" role="tabpanel" aria-labelledby="nav-c-tab">
				  	<ul class="list-group table5">
                    	<li class="list-group-item">
                            <div>
                            	<div class="card-body primary-font">등록된 댓글이 없습니다</div>
                            </div>
                        </li>
                    </ul>
                    <br>
				  </div>
				
				</div>  
						      
		      </div> <!--  내가 쓴 글 -->
		      
		    </div>
		  </div>
		  <div class="col-1"></div>
  
</div>

            
</main>
</div>
</div>

<!-- 예약 내역 내, 상태변경 모달 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">예약 상세 보기</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>예약 시간</label>
					<input class="form-control" name="rdate" id="rdate" value="예약시간" readonly>
				</div>
				<div class="row">
					<div class="form-group col-6">
						<label>종</label>
						<input class="form-control" name="type" id="type" value="동물종" readonly>
					</div>
					<div class="form-group col-6">
						<label>동물 이름</label>
						<input class="form-control" name="aname" id="aname" value="동물이름" readonly>
						<input type='hidden' class="form-control" name="animalId" id="animalId" value="동물id">
					</div>
				</div>
				<div class="row">
					<div class="form-group col-4">
						<label>나이(세)</label>
						<input class="form-control" name="age" id="age" value="나이" readonly>
					</div>
					<div class="form-group col-4">
						<label>몸무게(kg)</label>
						<input class="form-control" name="weight" id="weight" value="몸무게" readonly>
					</div>
					<div class="form-group col-4">
						<label>성별</label>
						<input class="form-control" name="sex" id="sex" value="성별" readonly>
					</div>								
				</div>
				<div class="form-group">
				<label>세부사항</label>
					<textarea class="form-control note" rows="5" id="note" name="note" placeholder="세부사항" readonly></textarea>
				</div>
				<div class="form-group">
					<label>진료 상태</label>
					<input type='hidden' class="form-control" name="reserveId" id="reserveId"value="예약번호"><br>
					<div class="statusVal">
  						<input type="radio" name="진료 전" id="진료 전" value="진료 전" data-status="진료 전"> 진료 전<br>
						<input type="radio" name="진료 완료" id="진료 완료" value="진료 완료" data-status="진료 완료"> 진료 완료<br>
						<input type='hidden' class="form-control" name="status" id="status" value="">
                    </div>	
				</div>
				<div class="modal-footer">
					<button id="modalStatusBtn" name="modalStatusBtn" type="button" class="btn btn-primary pull-right">변경 완료</button>
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
<script type="text/javascript" src="${ctx}/resources/js/user/myFavoriteHospitalFunction.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/myFavoriteHospital.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/myAnimalFunction.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/myAnimal.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/myHospitalReserveFunction.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/myHospitalReserve.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/hospital/infoFunction.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/hospital/info.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/hospital/myhospitalcontentFunction.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/hospital/myhospitalcontent.js"></script>


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