<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String ctx = request.getContextPath();
	pageContext.setAttribute("ctx", ctx);
	
%>
<!doctype html>
<html>
<head>
<title>동물수정페이지</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet"
	href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>


	<main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
	<div class="page-header mt-3">
		<h2>동물수정</h2>
	</div>


	<hr>
	<form role="form" action="modify" method="post" name="frm" onsubmit="return fun2()" >

		<div class="form-group">
			<input type="hidden" class="form-control" id="animalId" name="animalId"
				value="${animal.animalId}" readonly="readonly">
		</div>
		<div class="form-group">
			<label>타입</label> <input type="text" class="form-control" id="type"
				name="type" value="${animal.type}">
		</div>
		<div class="form-group">
			<label>성별</label>
			<div>
				<input type="radio" class="남"id="sex" name="sex" value="남" >
				남
				<input	type="radio" class="여" id="sex" name="sex" value="여">여 
					<input	type="radio" class="중성" id="sex" name="sex" value="중성">중성
			</div>
		</div>
		<div class="form-group">
			<label>무게</label> <input type="number" class="form-control"
				id="weight" name="weight" value="${animal.weight}" placeholder="kg"
				style="width: 80px">
		</div>
		<div class="form-group">
			<label>나이</label> <input type="number" class="form-control" id="age"
				name="age" value="${animal.age}" placeholder="나이"
				style="width: 80px">

		</div>
		<div class="form-group">
			<label>이름</label> <input type="text" class="form-control" id="name"
				name="name" value="${animal.aName}" >
		</div>
		<div class="form-group">
			<label>내용</label>
			<textarea class="form-control" id="note" name="note"
				style="height: 320px;">${animal.note}</textarea>
		</div>

		<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
		<button  data-oper='list' class="btn btn-info">List</button>

	</form>
	<footer class="text-center" style="max-width: 920px;">
		<p>
			Copyright ⓒ 2018 <b>잘바조</b> All Rights Reserved.
		</p>
	</footer> </main>

	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
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
	        

	
	
		$(document).ready(
				
				
				
							
			
				
				function() {
					//성별체크
					var a = document.getElementsByClassName("${animal.sex}");
					a.sex.checked = true;
				
					
				}
		);
				
		
		
		
		
		
	</script>
</body>
</html>
