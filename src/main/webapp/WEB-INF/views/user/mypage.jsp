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
				
		      	<div class="infoinfo col-10">
		      	</div>
		      	
		      	<div class="col-10">
				<button id="modify" class="btn btn-primary">Modify</button>
				</div>
				<br>
		      </div> <!-- 개인정보 수정 -->
		      
		      <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-2-tab">동물 관리</div>
		      
		      
		      <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-3-tab">
		      
		       <main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
                <div class="page-header mt-3">
                </div>
                <p class="lead">내가 쓴 리뷰~~</p>
                <hr>
                <table class="table table-striped" style="max-width: 1000px;">
                    <thead>
                        <tr>
                            <th scope="col" class="mobile" style="width:70px; text-align:center;">번호</th>
                            <th scope="col" class="mobile" style="text-align:center;">제목</th>
                            <th scope="col" class="mobile" style="width:100px; text-align:center;">날짜</th>
                         
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${MypostsList}" var="content">
                            <tr>
                            
                                <th scope="row" class="mobile" style="text-align:center;">
                                    <c:out value="${content.contentId}" />
                                </th>


                                <td>
                                	 <a class='move' style="color : #000000;" href='<c:out value="${content.contentId}"/>'>
                    				<c:out value="${content.title}" /></a>
                    			</td>
                                
                                <td class ="mobile" style="text-align:center;">
                                	 <fmt:formatDate value="${content.createdDate}" pattern="yyyy-MM-dd" />
                                </td>
                                
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
              </main>
              
              
               <main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
                <div class="page-header mt-3">
                   
                </div>
                <p class="lead">내가 쓴 지식동 글~~</p>
                <hr>
                <table class="table table-striped" style="max-width: 2000px;">
                    <thead>
                        <tr>
                            <th scope="col" class="mobile" style="width:80px; text-align:center;">번호</th>
                            <th scope="col" class="mobile" style="text-align:center;">제목</th>
                            <th scope="col" class="mobile" style="width:120px; text-align:center;">날짜</th>
                         
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${MypostsList}" var="content">
                            <tr>
                            
                                <th scope="row" class="mobile" style="text-align:center;">
                                    <c:out value="${content.contentId}" />
                                </th>
                                
                                <td><a href='/jisikdong/get?contentId=<c:out value="${content.contentId}"/>'>
                                	<c:out value="${content.title}"/></a>
                                </td>
									
						<!-- 
                                <td>
                                	 <a class='move' style="color : #000000;" href='<c:out value="${content.contentId}"/>'>
                    				<c:out value="${content.title}" /></a>
                    			</td>
						 -->                                
                                <td class ="mobile" style="text-align:center;">
                                	 <fmt:formatDate value="${content.createdDate}" pattern="yyyy-MM-dd" />
                                </td>
                                
                            </tr>
                        </c:forEach>
                    </tbody>
              	  </table>
                     </main>
                     
                      <main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
                <div class="page-header mt-3">
                </div>
               <p class="lead">내가 쓴 Q&A~~</p>
                <hr>
                <table class="table table-striped" style="max-width: 2000px;">
                    <thead>
                        <tr>
                            <th scope="col" class="mobile" style="width:80px; text-align:center;">번호</th>
                            <th scope="col" class="mobile" style="text-align:center;">제목</th>
                            <th scope="col" class="mobile" style="width:120px; text-align:center;">날짜</th>
                         
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${MypostsList}" var="content">
                            <tr>
                            
                                <th scope="row" class="mobile" style="text-align:center;">
                                    <c:out value="${content.contentId}" />
                                </th>


                                <td>
                                	 <a class='move' style="color : #000000;" href='<c:out value="${content.contentId}"/>'>
                    				<c:out value="${content.title}" /></a>
                    			</td>
                                
                                <td class ="mobile" style="text-align:center;">
                                	 <fmt:formatDate value="${content.createdDate}" pattern="yyyy-MM-dd" />
                                </td>
                                
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                 </main>
                 
                  <main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
                <div class="page-header mt-3">
                </div>
                <p class="lead">내가 쓴 커뮤니티 글~~~</p>
                <hr>
                <table class="table table-striped" style="max-width: 2000px;">
                    <thead>
                        <tr>
                            <th scope="col" class="mobile" style="width:80px; text-align:center;">번호</th>
                            <th scope="col" class="mobile" style="text-align:center;">제목</th>
                            <th scope="col" class="mobile" style="width:120px; text-align:center;">날짜</th>
                         
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${MypostsList}" var="content">
                            <tr>
                            
                                <th scope="row" class="mobile" style="text-align:center;">
                                    <c:out value="${content.contentId}" />
                                </th>


                                <td>
                                	 <a class='move' style="color : #000000;" href='<c:out value="${content.contentId}"/>'>
                    				<c:out value="${content.title}" /></a>
                    			</td>
                                
                                <td class ="mobile" style="text-align:center;">
                                	 <fmt:formatDate value="${content.createdDate}" pattern="yyyy-MM-dd" />
                                </td>
                                
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                 </main>
                 
                 <main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
                <div class="page-header mt-3">
                </div>
                <p class="lead">내가 쓴 댓글~~~</p>
				<table class="table table-striped" style="max-width: 900px;">
                    <thead>
                        <tr>
                            <th scope="col" class="mobile" style="width:80px; text-align:center;">번호</th>
                            <th scope="col" class="mobile" style="text-align:center;">제목</th>
                            <th scope="col" class="mobile" style="width:120px; text-align:center;">날짜</th>
                         
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${MypostsList}" var="content">
                            <tr>
                            
                                <th scope="row" class="mobile" style="text-align:center;">
                                    <c:out value="${content.contentId}" />
                                </th>


                                <td>
                                	 <a class='move' style="color : #000000;" href='<c:out value="${content.contentId}"/>'>
                    				<c:out value="${content.title}" /></a>
                    			</td>
                                
                                <td class ="mobile" style="text-align:center;">
                                	 <fmt:formatDate value="${content.createdDate}" pattern="yyyy-MM-dd" />
                                </td>
                                
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                </main>
              
             
		      </div> <!-- 내가 쓴 글 내역  전체 -->
		      
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