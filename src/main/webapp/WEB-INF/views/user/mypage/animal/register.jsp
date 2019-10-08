<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/includes/header.jsp" %>
<%
    String ctx = request.getContextPath();
    pageContext.setAttribute("ctx", ctx);
%>
<title>동물등록</title>
<div class="container-fluid">
<div class="row d-flex d-md-block flex-nowrap wrapper">
<main id="main">

<div class="page-header row">
	<div class="col-1"></div>
	<div class="col-11">
	<br>
	<h2><p>${userEmail}님의 </p> 동물 등록</h2>
    </div>
</div>

<div class="row">
		  <div class="col-1"></div>
		  <div class="col-10">         
          <hr>
          <form class="pt-3 md-3"action="register" method="post" name="frm" onsubmit="return fun2()">
			<div class="form-group">
              <label>동물 종</label>
              <input type="text" class="form-control" id="type" name="type" placeholder="동물 종" >
            </div>
			<div class="form-group">
              <label>성별</label>
				<div>             
              <input type="radio"  id="sex" name="sex"  value="남" >남&nbsp;&nbsp;&nbsp;
              <input type="radio"  id="sex" name="sex"  value="여" >여&nbsp;&nbsp;&nbsp;
              <input type="radio"  id="sex" name="sex"  value="중성" >중성
              </div>
            </div>
			<div class="form-group">
              <label>무게</label>
              <input type="number" class="form-control" id="weight" name="weight" placeholder="kg" style="width:80px">
            </div>
			<div class="form-group">
              <label>나이</label>
              <input type="number" class="form-control"  id="age" name="age" placeholder="나이" style="width:80px">
            </div>
			<div class="form-group">
              <label>이름</label>
              <input type="text" class="form-control" id="aname" name="aname"  placeholder="이름" >
            </div>
			<div class="form-group">
              <label>참고사항</label>
               <textarea class="form-control" id="note" name="note" placeholder="내용을 입력하세요." style="height: 320px;"></textarea>
            </div>
             <input type="hidden" id="userEmail" name="userEmail" value="${userEmail}">
            <button class="btn btn-primary pull-right" id="regBtn" name="regBtn" >글 쓰기</button>
          </form>
          </div>
          <div class="col-1"></div>
</div>
</main>
</div>
</div>
    <!-- 제이쿼리 자바스크립트 추가하기 -->
    <script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩 자바스크립트 추가하기 -->
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
   
   <script>
   function fun2() {
       var obj = document.frm;
       
       if(obj.type.value == '') {
           alert('타입을 입력하세요');
           obj.type.focus();
           return false;
       }

       if(obj.name.value == '') {
           alert('이름을 입력하세요');
           obj.aName.focus();
           return false;
       }
     
       if($(':radio[name="sex"]:checked').length < 1){
    	    alert('성별을 선택하세요');
    	    obj.sex[0].focus();
    	    return false;
    	}
       
     
       if(obj.note.value == '') {
           alert('자기소개를 입력하세요');
           obj.note.focus();
           return false;
       }
       
      
   }
        
   
</script>
<%@include file="/WEB-INF/views/includes/footer.jsp" %>   
</body>
</html>