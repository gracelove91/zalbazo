<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String ctx = request.getContextPath();
	pageContext.setAttribute("ctx", ctx);
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>병원 상세 정보</title>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- 부트스트랩 CSS 추가하기 -->
  <link rel="stylesheet" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<body>
  <div class="container">
   
  <!-- Page Content -->
    <!-- Portfolio Item Heading -->
    <p class="h1" style="text-align: center"> ${hospital.name} </p>
    
    <br><br><br>
    <!-- Portfolio Item Row -->
    <div class="row">

      <div class="col-md-7">
      	  <br>
          <p class="h4"><i class="material-icons">call</i> ${hospital.tel} </p>
          <p class="h5"><i class="material-icons">my_location</i> ${hospital.address} </p>
          <p class="h4"><i class="material-icons">alarm</i> ${hospital.treatStart} </p>
          <p class="h4"><i class="material-icons">alarm_off</i> ${hospital.treatEnd} </p>
          <br>
          
          <c:forEach items="${labelList}" var="label">
          	<c:if test="${label.labelCode == 1}">
          		<i class="material-icons">nights_stay</i>
          	</c:if>
          	<c:if test="${label.labelCode == 2}">
          		<i class="material-icons">bathtub</i>
          	</c:if>
          	<c:if test="${label.labelCode == 3}">
          		<i class="material-icons">local_parking</i>
          	</c:if>
          	<c:if test="${label.labelCode == 4}">
          		<i class="material-icons">emoji_nature</i>
          	</c:if>
          </c:forEach>
          
          <br />
          <br />
          <p class="h5"> ${hospital.info} </p>

      </div>

      <div class="col-md-5">
      
        <%-- <c:forEach items="${hPictureList}" var="pic">
	        <img class="img-fluid" src='${ctx}/resources/img/${pic.fileName}' width="350" height="300">
	        <br>
        </c:forEach> --%>
        
 	  <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" style="width: 380px; margin: 0 auto">
	    <div class="carousel-inner">
	    
	  <c:choose>
	     <c:when test="${picCount eq 0}">
	     </c:when>
	    	
	     <c:when test="${picCount eq 1}">
	       <div class="carousel-item active">
	       	 <img src="${ctx}/resources/img/${hospital.hospitalId}-1.jpg" width="380" height="300">
	       </div>
	     </c:when>
	    	
	     <c:otherwise>
	       <div class="carousel-item active">
	       	 <img src="${ctx}/resources/img/${hospital.hospitalId}-1.jpg" width="380" height="300">
	       </div>
	         
	       <c:forEach var="i" begin="2" end="${picCount}">
	  	  	  <div class="carousel-item">
	      	    <img src="${ctx}/resources/img/${hospital.hospitalId}-${i}.jpg" width="380" height="300">
	       	  </div>
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
        
        <p class="h5" style="text-align: center">
          <i class="material-icons">event</i>예약하기
          <i class="material-icons">favorite_border</i>즐겨찾기
        </p>
      </div>
      
    </div>
    <!-- /.row -->
    
		<!-- Related Projects Row -->
    <br>
    <br>
	<br>
	
	<div class="container">
	  <!-- Nav tabs -->
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
	      <h3>map</h3>
	      <img src="https://map0.daumcdn.net/map_2d/1906plw/L3/1996/892.png">
	      <br>
    	  <br>
	 	  <br>
	    </div>
	    <div id="menu1" class="container tab-pane fade"><br>
	      <h3>review</h3>
	      <table class="table table-striped">
            <thead>
              <tr>
                <th>유저ID</th>
                <th>별점</th>
                <th>글 내용</th>
                <th>DATE</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>John</td>
                <td>★★★★</td>
                <td>좋아요~</td>
                <td>2019-09-02</td>
              </tr>
              <tr>
                <td>김길동</td>
                <td>★</td>
                <td>싫어요~</td>
                <td>2019-09-02</td>
              </tr>
              <tr>
                <td>홍길동</td>
                <td>★★★</td>
                <td>보통요~</td>
                <td>2019-09-02</td>
              </tr>
            </tbody>
          </table>
          <br>
    	  <br>
		  <br>
	    </div>
	    
	    
	    <div id="menu2" class="container tab-pane fade"><br>
	      
	      <div class="container">
	      
  		    <form id='actionForm' action="/hospital/get" method="post">
              <input type="hidden" class="form-control" name="userEmail" value="dummy@gmail.com">
              <input type='hidden' class="form-control" name="hospitalId" value="${hospital.hospitalId}">
              <%-- <input type='hidden' class="form-control" name="contentId" value="${content.contentId}"> --%>
              
              <div class="form-group">
                <label for="comment">궁금한 점을 질문하세요</label>
                <textarea class="form-control" rows="5" id="body" name="body"></textarea>
    	      </div>
	    	  
	    	  <button type="submit" class="btn btn-secondary" id="regBtn" name="regBtn">Submit</button>
  		    </form>
  		    
		  </div>
		  
		  <br><br>
		  
		  <table class="table table-striped">
			<tr>
				<th>글 내용</th>
				<th>작성자</th>
				<th>DATE</th>
			</tr>

			<c:forEach items="${qnaList}" var="qna">
				<tr>
					<td>${qna.body}</td>
					<td>${qna.userEmail}</td>
					<td>${qna.createdDate}</td>
				</tr>
			</c:forEach>
		  </table>
		  
	      
<%-- 	      <table class="table table-striped">
            <thead>
              <tr>
                <th>글 내용</th>
                <th>작성자</th>
                <th>DATE</th>
              </tr>
            </thead>

		<c:forEach items="${qna}" var="qna">
			<tr>
				<th scope="row" class="mobile" style="text-align: center;">
					<c:out value="${content.contentId}" />
				</th>

				<td><a class='move' style="color: #000000;"
					href='<c:out value="${content.contentId}"/>'><c:out
							value="${content.title}" /></a></td>

				<td class="mobile" style="text-align: center;"><c:out
						value="${content.userEmail}" /></td>
				<td class="mobile" style="text-align: center;"><fmt:formatDate
						value="${content.createdDate}" pattern="yyyy-MM-dd" /></td>
			</tr>
		   <tbody>
              <tr>
                <td>${qna.body}</td>
                <td>${qna.userEmail}</td>
                <td>${qna.createdDate}</td>
              </tr>
            </tbody>
		</c:forEach>

		 
          </table> --%>
          
          <br>
    	  <br>
		  <br>
	    </div>
	  </div>
	</div>
	</div>
	<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩 자바스크립트 추가하기 -->
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>