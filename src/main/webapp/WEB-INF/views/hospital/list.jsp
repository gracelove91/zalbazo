<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp" %>
<style>
.checkbox[type=checkbox], .checkbox[type=radio] {display:none;}
label.input-label {
  display: inline-block;
  font-size: 13px;
  cursor: pointer;
  }
label.input-label::before {
  display: inline-block;
  margin:0 20px;
  font-family: FontAwesome;
  font-size: 20px;
  color: rgba(4, 120, 193,0.2);
  -webkit-transition: transform 0.2s ease-out, color 0.2s ease;
  -moz-transition: transform 0.2s ease-out, color 0.2s ease;
  -ms-transition: transform 0.2s ease-out, color 0.2s ease;
  -o-transition: transform 0.2s ease-out, color 0.2s ease;
  transition: transform 0.2s ease-out, color 0.2s ease;
  -webkit-transform: scale3d(0.8,0.8,1);
  -moz-transform: scale3d(0.8,0.8,1);
  -ms-transform: scale3d(0.8,0.8,1);
  -o-transform: scale3d(0.8,0.8,1);
  transform: scale3d(0.8,0.8,1);
}
label.input-label.checkbox::before {
  content: "\f0c8";
}
label.input-label.radio::before {
  content: "\f111";
}
input.checkbox + label.input-label:hover::before {
  -webkit-transform: scale3d(1,1,1);
  -moz-transform: scale3d(1,1,1);
  -ms-transform: scale3d(1,1,1);
  -o-transform: scale3d(1,1,1);
  transform: scale3d(1,1,1);
}
input.checkbox + label.input-label:active::before {
  -webkit-transform: scale3d(1.5,1.5,1);
  -moz-transform: scale3d(1.5,1.5,1);
  -ms-transform: scale3d(1.5,1.5,1);
  -o-transform: scale3d(1.5,1.5,1);
  transform: scale3d(1.5,1.5,1);
}
input.checkbox:checked + label.input-label::before {
  display: inline-block;
  font-family: FontAwesome;
  color:#0478c1;
  -webkit-transform: scale3d(1,1,1);
  -moz-transform: scale3d(1,1,1);
  -ms-transform: scale3d(1,1,1);
  -o-transform: scale3d(1,1,1);
  transform: scale3d(1,1,1);
}
input.checkbox:checked + label.input-label.checkbox::before {
    content:"\f14a";
}
input.checkbox:checked + label.input-label.radio::before {
    content:"\f058";
}
</style>
<link rel="stylesheet" href="/resources/css/scroll.css">

<title>병원 LIST</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<body>

<a onclick="topFunction()" id="myBtn" title="Go to top"><img src="${ctx}/resources/img/GoToTop.png" width="50px;"></a>

<section class="feature-area">
<form name="form1" method="Get" action="/hospital/searchedlistAll">
    <div class="container">
        <div class="row">
            <main id="main" class="col-md-12 main">
                <div class="page-header mt-3">
                    <h2>병원 검색 결과</h2>	
                    <hr>
                    <div class="wrap">
  <input type="checkbox" id="select0" value="1" name="label" class="checkbox">
  <label for="select0" class="input-label checkbox"><i class="material-icons"> local_convenience_store </i> 24시</label>
  <input type="checkbox" id="select1" value="2" name="label" class="checkbox">
  <label for="select1" class="input-label checkbox"><i class="material-icons"> local_florist </i> 미용</label>
  <input type="checkbox" id="select2" value="3" name="label" class="checkbox">
  <label for="select2" class="input-label checkbox"><i class="material-icons"> local_parking </i> 주차</label>
  <input type="checkbox" id="select3" value="4" name="label" class="checkbox">
  <label for="select3" class="input-label checkbox"><i class="material-icons"> emoji_nature </i> 특수동물</label>
  <input type="checkbox" id="select4" value="5" name="label" class="checkbox">
  <label for="select4" class="input-label checkbox"><i class="material-icons"> check_circle </i> 수술전문</label>
</div>
<input type="hidden" id="length" name="length" value="">
<div class="row">
<div class="col-lg-2">
<select name="searchOption">
						<option value="all">전체검색</option>
						<option value="name">병원이름</option>
						<option value="address">주소</option>
						<option value="info">내용</option>
					</select>
	</div>				
					<!-- 검색창 -->
					
					<div class="col-md-8 col-lg-8 col-xl-8 mx-auto" style='padding-top: 10px;'>
						<input name="keyword" type="keyword" class="form-control form-control-md" placeholder="검색어를 입력해주세요.">
					</div>
					<div  class="col-lg-2" style='padding-top: 10px;'>
						<button type="submit" class="btn btn-block btn-md btn-primary">검색하기</button>
					</div>
					</div>

</div>
</form>
<br>
<br>
                <table class="table table-striped" style="width: 1150px;">
                    <thead>
                    <tr>
                        <th scope="col" class="mobile"
                            style="width: 150px; text-align: center;">No.
                        </th>
                        <th scope="col" class="mobile"
                            style="width: 350px; text-align: center;"></th>
                        <th scope="col" class="mobile"
                            style="width: 600px; text-align: center;">병원명
                        </th>
                        <th scope="col" class="mobile"
                            style="width: 200px; text-align: center;">진료시작
                        </th>
                        <th scope="col" class="mobile"
                            style="width: 200px; text-align: center;">진료마감
                        </th>
                        <th scope="col" class="mobile"
                            style="width: 700px; text-align: center;">주소
                        </th>
                        <th scope="col" class="mobile"
                            style="width: 400px; text-align: center;">전화번호
                        </th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${list}" var="hospital">

                        <tr>
                            <td class="mobile" style="text-align: center;"><c:out
                                    value="${hospital.hospitalId}"/></td>

						<c:forEach items="${hospital.attachList}" var="pic">
                            <td class="mobile" style="text-align: center;"><a href="#">
                                	<img class="rounded"
                                     src="${ctx}/resources/img/hospital/${pic.uuid}_${pic.fileName}"
                                     alt="" width="108px" height="85px">
                            </a></td>
                        </c:forEach>

                            <td><a style="color: #000000;"
                                   href='/hospital/get?hospitalId=<c:out value="${hospital.hospitalId}"/>'>
                                    ${hospital.name}</a><br><br/>
                                    
                            <c:forEach items="${hospital.label}" var="label">
                                <c:if test="${label.labelCode == 1 }">
                                    <i class="material-icons"> local_convenience_store </i>
                                </c:if>

                                <c:if test="${label.labelCode == 2 }">
                                    <i class="material-icons"> local_florist </i>
                                </c:if>

                                <c:if test="${label.labelCode == 3 }">
                                    <i class="material-icons"> local_parking </i>
                                </c:if>

                                <c:if test="${label.labelCode == 4 }">
                                    <i class="material-icons"> emoji_nature </i>
                                </c:if>
                                
                                <c:if test="${label.labelCode == 5 }">
                                    <i class="material-icons"> check_circle </i>
                                </c:if>
                            </c:forEach></td>

                            <td class="mobile" style="text-align: center;"><c:out
                                    value="${hospital.treatStart}"/></td>

                            <td class="mobile" style="text-align: center;"><c:out
                                    value="${hospital.treatEnd}"/></td>

                            <td class="mobile" style="text-align: center;"><c:out
                                    value="${hospital.address}"/></td>

                            <td class="mobile" style="text-align: center;"><c:out
                                    value="${hospital.tel}"/></td>
                            </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </main>
        </div>
    </div>    
</section>
</body>
<script type="text/javascript" src="/resources/js/index/search.js"></script>
<script type="text/javascript" src="/resources/js/scroll.js"></script>

<%@include file="../includes/footer.jsp" %>