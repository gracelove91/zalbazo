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

<br />
  <!-- Page Content -->
  <div class="container">
    <!-- Portfolio Item Heading -->
    <p class="h1" style="text-align: center"> ${hospital.name} </p>
    
    <br>
    <!-- Portfolio Item Row -->
    <div class="row">

      <div class="col-md-7">
          <p class="h3"><i class="material-icons">call</i> ${hospital.tel} </p>
          <p class="h3"><i class="material-icons">my_location</i> ${hospital.address} </p>
          <p class="h3"><i class="material-icons">alarm</i> ${hospital.treatStart} </p>
          <p class="h3"><i class="material-icons">alarm_off</i> ${hospital.treatEnd} </p>
          
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
          <p class="h4"> ${hospital.info} </p>

      </div>

      <div class="col-md-5">
        <c:forEach items="${hPictureList}" var="pic">
	        <img class="img-fluid" src='${ctx}/resources/img/${pic.fileName}' alt="" width="350" height="300">
        </c:forEach>
        <br><br>
        
        <p class="h4">
          <i class="material-icons">event</i>예약하기
          <i class="material-icons">favorite_border</i>즐겨찾기
        </p>
      </div>
      
    </div>
    <!-- /.row -->
    
		<!-- Related Projects Row -->
    <br>
    <br>
    <h3 class="my-4">이 아래로 지도 후기 문의</h3>
    <div class="tabbable">
      <ul class="nav nav-tabs">
        <li class="active"><a href="#tab1" data-toggle="tab">지도</a></li>
        <li><a href="#tab2" data-toggle="tab">후기</a></li>
        <li><a href="#tab3" data-toggle="tab">문의</a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tab1">
          <h1>지도</h1>
          <img
            src="https://map0.daumcdn.net/map_2d/1906plw/L3/1996/892.png">
        </div>
        <div class="tab-pane" id="tab2">
          <h1>후기</h1>
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
          <img
            src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnDMjbII6RBPdO0QJgzkcr0RgCKgmILIVHDM_9OFgx7MPUqjyw3A"
            width="400" height="400">
        </div>
        <div class="tab-pane" id="tab3">
          <h1>문의</h1>
          <table class="table table-striped">
            <thead>
              <tr>
                <th>글 내용</th>
                <th>작성자</th>
                <th>DATE</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>John</td>
                <td>왕관앵무 진료 가능?</td>
                <td>2019-09-02</td>
              </tr>
              <tr>
                <td>아프리카동물병원</td>
                <td>ㄴ넹~</td>
                <td>2019-09-02</td>
              </tr>
              <tr>
                <td>sally</td>
                <td>일요일도 진료 가능?</td>
                <td>2019-09-02</td>
              </tr>
              <tr>
                <td>아프리카동물병원</td>
                <td>ㄴno.......</td>
                <td>2019-09-03</td>
              </tr>
            </tbody>
          </table>
          <img
            src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnDMjbII6RBPdO0QJgzkcr0RgCKgmILIVHDM_9OFgx7MPUqjyw3A"
            width="400" height="400">
        </div>

      </div>
    </div>

  </div>
  <!-- /.container -->
  

</body>

</html>