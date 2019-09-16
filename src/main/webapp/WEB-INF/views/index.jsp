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

	<title>홈</title>
ejejejej
	<!-- Bootstrap core CSS -->
	<!-- Custom fonts for this template-->
	<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

	<!-- Page level plugin CSS-->
	<link href="/resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

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

<body background="/resources/img/index_baba.png">

<nav class="navbar navbar-expand navbar-light bg-light static-top">

	<a class="navbar-brand" href="${ctx}/index">

		<img src="${ctx}/resources/img/baba.png" width="30" height="30" class="d-inline-block align-top" alt=""> Zalbazo

	</a>

	<ul class="navbar-nav">

		<li class="nav-item dropdown">

			<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

				게시판

			</a>

			<div class="dropdown-menu" aria-labelledby="navbarDropdown">

				<a class="dropdown-item" href="${ctx}/jisikdong/list">지식動</a>

				<a class="dropdown-item" href="${ctx}/community/list">커뮤니티</a>

			</div>

		</li>

	</ul>

	<!--   <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
      </button>
   -->
	<!-- Navbar Search -->
	<form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
		<div class="input-group">
			<input type="text" class="form-control" placeholder="검색어를 입력해주세요." aria-label="검색하기" aria-describedby="basic-addon2">
			<div class="input-group-append">
				<button class="btn btn-primary" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</div>
	</form>

	<!-- Navbar -->
	<ul class="navbar-nav ml-auto ml-md-0">
		<li class="nav-item dropdown no-arrow mx-1">
			<a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="fas fa-bell fa-fw"></i>
				<span class="badge badge-danger">9+</span>
			</a>
			<div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
				<a class="dropdown-item" href="#">Action</a>
				<a class="dropdown-item" href="#">Another action</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#">Something else here</a>
			</div>
		</li>
		<li class="nav-item dropdown no-arrow mx-1">
			<a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="fas fa-envelope fa-fw"></i>
				<span class="badge badge-danger">7</span>
			</a>
			<div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
				<a class="dropdown-item" href="#">Action</a>
				<a class="dropdown-item" href="#">Another action</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#">Something else here</a>
			</div>
		</li>
		<li class="nav-item dropdown no-arrow">
			<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="fas fa-user-circle fa-fw"></i>
			</a>
			<div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
				<a class="dropdown-item" href="#">Settings</a>
				<a class="dropdown-item" href="#">Activity Log</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
			</div>
		</li>
	</ul>

</nav>

<!-- Masthead -->
<header class="masthead text-white text-center">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-xl-9 mx-auto">
				<!-- 					<h1 class="mb-5" style="color: gray; font-weight: bold">
                                    잘바조</h1> -->
			</div>
			</br>
			</br>
			</br>
			</br>
			<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
				<form>
					<div class="form-row">
						<div class="col-12 col-md-9 mb-2 mb-md-0">
							<input type="email" class="form-control form-control-lg"
								   placeholder="검색어를 입력해주세요.">
						</div>
						<div class="col-12 col-md-3">
							<button type="submit" class="btn btn-block btn-lg btn-primary">검색하기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</header>




<!-- Bootstrap core JavaScript -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>