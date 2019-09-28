<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<title>병원 회원가입</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<body>
<div class="container-fluid">
   <div class="row">
      
      <div class="col-md-2"></div>
        
      <div id="main" class="col-md-8">
          <div class="page-header mt-3">
              <h2>병원 정보 입력</h2>
          </div>
          <p class="lead">병원의 상세정보를 입력해주세요.</p>
          <hr>
          
          
          <form class="pt-3 md-3" role='form' action="/hospital/register" method="post">
          
            <input type="hidden" name="userEmail" value="${userEmail}"/>
            
          
			<div class="form-group">
			   <fieldset>
                  <label class="font-weight-bold">병원명</label>
                  <input type="text" class="form-control" name="name" placeholder="병원명을 입력하세요">
               </fieldset>
            </div><br />



			<div class="form-group">
			   <fieldset>
                  <label class="font-weight-bold">전화번호</label>
                  <input type="text" class="form-control" name="tel" placeholder="숫자만 입력해주세요">
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
		        
		        <option>-- --</option>
		        <c:forEach begin="1" end="24" step="1" var="hour">
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
		        
		        <option>-- --</option>
		        <c:forEach begin="1" end="24" step="1" var="hour">
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
            
            <button type="submit" class="btn btn-primary float-right" id="regBtn" name="regBtn">submit</button>
          </form>
          <br /><br /><br />

        </div>
        
        <div class="col-md-2"></div>
        
      </div>
    </div>
    

<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 자바스크립트 추가하기 -->
<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
function goPopup() {
	var pop = window.open("jusoPopup", "pop",
		"width=570,height=420, scrollbars=yes, resizable=yes");
}

function jusoCallBack(roadFullAddr) {
	$("#address").val(roadFullAddr);
}
</script>

<%@include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>