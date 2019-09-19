<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<div class="bound">
	<div class="card-header primary-font">
		Q. 야옹이 살려주세요
		<div class="del float-right" data-qno="14">X</div>
		<p>
			<small class="float-right text-muted">15:59:11</small>
		</p>
		<small class="primary-font">dummy@gmail.com</small>
	</div>

	<div class="card-body" data-ano="19">
		&nbsp;&nbsp;&nbsp; A: 데려오세요
		<p>
			<small class="float-right text-muted">16:09:50</small>
		</p>
		<small class="primary-font"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			관리자</small>
	</div>
</div>
<script> 
var top = $(".bound");
var one = top.find("data-qno");
alert(one.val());
</script>
</body>
</html>