<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>홈</title>

<!-- Bootstrap core CSS -->
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
<link href="css/landing-page.min.css" rel="stylesheet">

</head>

<body background="resources/img/main_baba.png">

	<nav class="navbar navbar-light bg-light">

		<a class="navbar-brand" href="${ctx}/home"> <img
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

		<form class="form-inline">

			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search">

			<button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Search</button>

		</form>

	</nav>

	<!-- Masthead -->
	<header class="masthead text-white text-center">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto">
					</br>
					<h1 class="mb-5" style="color: black; font-weight: bold">전국
						동물병원 검색은 잘바조!</h1>
				</div>
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
