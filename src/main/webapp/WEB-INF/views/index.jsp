<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String ctx = request.getContextPath();
	pageContext.setAttribute("ctx", ctx);
%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<style>
.babalogo {
	display: block;
	margin: 0px auto;
	margin-top: 100px;
}


.dropdown dd {
  position: relative;
}

#sel a,
#sel:visited {
  color: #fff;
  text-decoration: none;
  outline: none;
  font-size: 12px;
}

.dropdown dt a {
  background-color: #4F6877;
  display: block;
  padding: 8px 20px 5px 10px;
  min-height: 25px;
  line-height: 10px;
  overflow: hidden;
  border: 0;
  width: 272px;
}

.dropdown dt a span,
.multiSel span {
  cursor: pointer;
  display: inline-block;
  padding: 0 3px 2px 0;
}

.dropdown dd ul {
  background-color: #4F6877;
  border: 0;
  color: #fff;
  display: none;
  left: 0px;
  padding: 2px 15px 2px 5px;
  position: absolute;
  top: 2px;
  width: 280px;
  list-style: none;
  height: 100px;
  overflow: auto;
}




</style>
<title>홈</title>

<!-- Bootstrap core CSS -->
<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="/resources/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin.css" rel="stylesheet">
<!--  -->

<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link
	href="/resources/vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link href="/resources/css/landing-page.min.css" rel="stylesheet">

</head>

<body>
	 <!-- Masthead -->
   <header class="babaheader" id="babaheader">
      <%-- <body background="${ctx}/resources/img/index_baba3.png"> --%>
      <nav class="navbar navbar-expand navbar-light bg-light static-top">

         <a class="navbar-brand" href="${ctx}/index"> <img
            src="${ctx}/resources/img/baba.png" width="30" height="30"
            class="d-inline-block align-top" alt=""> Zalbazo

         </a>

         <ul class="navbar-nav">

            <li class="nav-item dropdown"><a
               class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
               role="button" data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false"> 게시판 </a>

               <div class="dropdown-menu" aria-labelledby="navbarDropdown">

                  <a class="dropdown-item" href="${ctx}/jisikdong/list">지식動</a> <a
                     class="dropdown-item" href="${ctx}/community/list">커뮤니티</a>

               </div></li>

         </ul>

         <!--   <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>
 -->
         <!-- Navbar Search -->
         <form
            class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">

            <div class="input-group">
               <input type="text" class="form-control" placeholder="검색어를 입력해주세요."
                  aria-label="검색하기" aria-describedby="basic-addon2">
               <div class="input-group-append">
                  <button class="btn btn-primary" type="button">
                     <i class="fas fa-search"></i>
                  </button>
               </div>
            </div>
         </form>

         <!-- Navbar -->
         <ul class="navbar-nav ml-auto ml-md-0">
            <li class="nav-item dropdown no-arrow mx-1"><a
               class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
               role="button" data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <span
                  class="badge badge-danger">9+</span>
            </a>
               <div class="dropdown-menu dropdown-menu-right"
                  aria-labelledby="alertsDropdown">
                  <a class="dropdown-item" href="#">Action</a> <a
                     class="dropdown-item" href="#">Another action</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#">Something else here</a>
               </div></li>
            <li class="nav-item dropdown no-arrow mx-1"><a
               class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
               role="button" data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i> <span
                  class="badge badge-danger">7</span>
            </a>
               <div class="dropdown-menu dropdown-menu-right"
                  aria-labelledby="messagesDropdown">
                  <a class="dropdown-item" href="#">Action</a> <a
                     class="dropdown-item" href="#">Another action</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#">Something else here</a>
               </div></li>
            <li class="nav-item dropdown no-arrow"><a
               class="nav-link dropdown-toggle" href="#" id="userDropdown"
               role="button" data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false"> <i class="fas fa-user-circle fa-fw"></i>
            </a>
               <div class="dropdown-menu dropdown-menu-right"
                  aria-labelledby="userDropdown">
                  <a class="dropdown-item" href="#">마이 페이지</a> <a
                     class="dropdown-item" href="${ctx}/user/register">로그인/회원가입</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#" data-toggle="modal"
                     data-target="#logoutModal">로그아웃</a>
               </div></li>
         </ul>

      </nav>

   </header>



	<div class="container">
		<div class="row">
			<div class="col-xl-9 mx-auto">
				<!-- 					<h1 class="mb-5" style="color: gray; font-weight: bold">
					잘바조</h1> -->
			</div>

			<div class="babalogo" id="babalogo">
				<img src="${ctx}/resources/img/c_baba_logo2.png">
				</br> </br>
			
			</div>
			
		
			<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
				<form name="form1" method="Get" action="/hospital/searchedlist">
			
					<div class="form-row">
			
				<dl class="dropdown"> 
    <dt>
    <a id="sel" href="#">
      <span class="hida">Select</span>    
      <p class="multiSel"></p>  
    </a>
    </dt>
    <dd>
        <div class="mutliSelect">
            <ul>
                <li>
                    <input type="checkbox" name="label" id = "24시" value="1" />24시
                </li>
                <li>
                    <input type="checkbox" name="label" id = "미용" value="2" />미용
                </li>
                <li>
                    <input type="checkbox" name="label" id = "주차" value="3" />주차
                </li>
                <li>
                    <input type="checkbox" name="label" id = "특수" value="4" />특수
                </li>
            </ul>
        </div>
    </dd>
</dl>
		
							<select name="searchOption">

									<option value="all">전체검색</option>
									<option value="name">병원이름</option>
									<option value="address">주소</option>
									<option value="info">내용</option>
								</select>
								  <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
										<input name="keyword" type="keyword" value="${map.keyword}"
											class="form-control form-control-lg" placeholder="검색어를 입력해주세요.">
									</div>
						<div class="col-12 col-md-3">
							<button type="submit" class="btn btn-block btn-lg btn-primary">검색하기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
$(".dropdown dt a").on('click', function() {
	  $(".dropdown dd ul").slideToggle('fast');
	});

	$(".dropdown dd ul li a").on('click', function() {
	  $(".dropdown dd ul").hide();
	});

	function getSelectedValue(id) {
	  return $("#" + id).find("dt a span.value").html();
	}

	$(document).bind('click', function(e) {
	  var $clicked = $(e.target);
	  if (!$clicked.parents().hasClass("dropdown")) $(".dropdown dd ul").hide();
	});

	$('.mutliSelect input[type="checkbox"]').on('click', function() {

	  var title = $(this).closest('.mutliSelect').find('input[type="checkbox"]').attr('id'),
	    title = "["+$(this).attr('id') + "]";

	  if ($(this).is(':checked')) {
	    var html = '<span title="' + title + '">' + title + '</span>';
	    $('.multiSel').append(html);
	    $(".hida").hide();
	  } else {
	    $('span[title="' + title + '"]').remove();
	    var ret = $(".hida");
	    $('.dropdown dt a').append(ret);

	  }
	});
</script>
</body>

</html>