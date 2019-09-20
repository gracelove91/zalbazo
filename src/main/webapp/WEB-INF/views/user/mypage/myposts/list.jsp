<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html>

<head>
    <title>커뮤니티 웹 사이트</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 부트스트랩 CSS 추가하기 -->
    <link rel="stylesheet" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css">
</head>

<body>
    <div class="container-fluid">
        <div class="row d-flex d-md-block flex-nowrap wrapper">
            <main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
                <div class="page-header mt-3">
                </div>
                <p class="lead">내가 쓴 리뷰~~</p>
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
        </div>
    </div>
    
    <br><br>
    
    
     <div class="container-fluid">
        <div class="row d-flex d-md-block flex-nowrap wrapper">
            <main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
                <div class="page-header mt-3">
                   
                </div>
                <p class="lead">내가 쓴 커뮤글~~</p>
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
       			 </div>
   			 </div>
    
       <br><br>
    
     <div class="container-fluid">
        <div class="row d-flex d-md-block flex-nowrap wrapper">
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
       		 </div>
    		</div>
    
       <br><br>
    
     <div class="container-fluid">
        <div class="row d-flex d-md-block flex-nowrap wrapper">
            <main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
                <div class="page-header mt-3">
                </div>
                <p class="lead">내가 쓴 지식동 글~~~</p>
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
        	</div>
   		 </div>

		   <br><br>

  <div class="container-fluid">
        <div class="row d-flex d-md-block flex-nowrap wrapper">
            <main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
                <div class="page-header mt-3">
                </div>
                <p class="lead">내가 쓴 댓글~~~</p>
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

	
							<br><br><br> <br> <br> <br> 
             
                <footer class="text-center" style="max-width: 1080px;">
                    <p>Copyright ⓒ 2019 <b>zalbazo</b> All Rights Reserved.</p>
                </footer>
                
                </main>
	</div>
	</div>
   

    <!-- 제이쿼리 자바스크립트 추가하기 -->

    <script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
    
    $('document').ready(funtion (){
    	
    	
    })
    
    </script>

  
</body>

</html>
