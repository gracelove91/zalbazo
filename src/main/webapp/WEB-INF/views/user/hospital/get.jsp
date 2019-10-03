<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%
    String ctx = request.getContextPath();
    pageContext.setAttribute("ctx", ctx);
%>
<html>
<head>
<title>병원 정보</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
img{
   display : inline;
}
</style>
</head>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<body>
<div class="container-fluid">
   <div class="row">
      
      <div class="col-md-2"></div>
        
      <div id="main" class="col-md-8">
          <div class="page-header mt-3">
              <h2>${info.name}의 상세 정보</h2>
          </div>
          <hr>
          
          
            <input name="userEmail" value="${userEmail}"/>
          
			<div class="form-group">
			   <fieldset>
                  <label class="font-weight-bold">병원명</label>
                  <input type="text" class="form-control" id="name" name="name" value='<c:out value="${info.name}"/>' readonly="readonly">
               </fieldset>
            </div><br />


			<div class="form-group">
			   <fieldset>
                  <label class="font-weight-bold">전화번호</label>
                  <input type="text" class="form-control" id="tel" name="tel" value='<c:out value="${info.tel}"/>' readonly="readonly">
               </fieldset>
            </div><br />
            

			<div class="form-group">
			  <p class="font-weight-bold">제공하는 서비스</p>
			  
			    <c:forEach items="${info.label}" var="label">
			    
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
			
			</div><br />
			
			
			
			<div class="form-group">
                <fieldset>
                    <label class="font-weight-bold">주소</label>
                    <input required="required" type="text" class="form-control" name="address" 
                    	   id="address" value='<c:out value="${info.address}"/>' readonly="readonly"/>
                </fieldset>
            </div><br />
            
            
            <div class="row">
            
            <div class="form-group col-md-6">
		      <label for="sel1" class="font-weight-bold">문 여는 시간</label>
		      <input class="form-control" id="treatStart" name="treatStart" value='<c:out value="${info.treatStart}"/>' readonly="readonly" />
		    </div>
		    
		    <div class="form-group col-md-6">
		      <label for="sel1" class="font-weight-bold">문 닫는 시간</label>
		      <input class="form-control" id="treatEnd" name="treatEnd" value='<c:out value="${info.treatEnd}"/>' readonly="readonly" />
		    </div>
		    
		    </div><br />
		    
			
            
            
            <div class="form-group">
               <fieldset>
                  <label class="font-weight-bold">세부사항</label>
                  <input class="form-control" id="info" name="info"
							value='<c:out value="${info.info}"/>' readonly="readonly" />
               </fieldset>
            </div><br />
            
            
            
            <!-- 파일 첨부 부분 -->
            <div class="row">
               <div class="col-lg-12">
               
                   <div class="form-group">
                      <c:forEach items="${info.attachList}" var="picList">
                        <div style="display:inline;"> 
                           <small>${picList.fileName}</small>
                		   <img src="${ctx}/resources/img/hospital/${picList.uuid}_${picList.fileName}"
	                                  height="80px" width="80px">
                		</div>
                      </c:forEach>
                   </div>
                        
               </div>
            </div>
            
            <form class="pt-3 md-3" role='form' action="/hospitalinfo/modify">
            
            	<button type="submit" class="btn btn-primary float-right" id="modify" name="modify">수정하기</button>
            </form>
            
          <br /><br /><br />

        </div>
        
        <div class="col-md-2"></div>
        
      </div>
    </div>
    

<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 자바스크립트 추가하기 -->
<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<%@include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>