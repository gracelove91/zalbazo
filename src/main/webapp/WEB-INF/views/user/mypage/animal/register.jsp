<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html>
  <head>
    <title>동물등록</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 부트스트랩 CSS 추가하기 -->
    <link rel="stylesheet" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css">
  </head>
  <body>
   
        <main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
          <div class="page-header mt-3">
              <h2>신규동물등록</h2>
          </div>
          
          <hr>
          <form class="pt-3 md-3" style="max-width: 920px" action="register" method="post" name="frm" onsubmit="return fun2()">
			<div class="form-group">
              <label>타입</label>
              <input type="text" class="form-control" id="type" name="type" placeholder="타입" >
            </div>
			<div class="form-group">
              <label>성별</label>
				<div>             
              <input type="radio"  id="sex" name="sex"  value="남" >남
              <input type="radio"  id="sex" name="sex"  value="여" >여
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
              <input type="text" class="form-control" id="name" name="name"  placeholder="이름" >
            </div>
			<div class="form-group">
              <label>참고사항</label>
               <textarea class="form-control" id="note" name="note" placeholder="내용을 입력하세요." style="height: 320px;"></textarea>
            </div>
             <input type="hidden" id="userEmail" name="userEmail" value="dummy@gmail.com">
            <button class="btn btn-primary" id="regBtn" name="regBtn" >글 쓰기</button>
          </form>
          <footer class="text-center" style="max-width: 920px;">
            <p>Copyright ⓒ 2018 <b>잘바조</b> All Rights Reserved.</p>
          </footer>
        </main>
    
    <!-- 제이쿼리 자바스크립트 추가하기 -->
    <script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩 자바스크립트 추가하기 -->
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
   
   <script language="javascript">
   function fun2() {
       var obj = document.frm;
       
       if(obj.type.value == '') {
           alert('타입을 입력하세요');
           obj.type.focus();
           return false;
       }

       if(obj.name.value == '') {
           alert('이름을 입력하세요');
           obj.name.focus();
           return false;
       }
     
      
       if(obj.sex.value == '') {
           alert('성별을 선택하세요');
           obj.sex.focus();
           return false;
       }
     
       if(obj.note.value == '') {
           alert('자기소개를 입력하세요');
           obj.note.focus();
           return false;
       }
       
      
   }
        
   
   </script>
    
  </body>
</html>
