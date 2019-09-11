<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    String ctx = request.getContextPath();
    pageContext.setAttribute("ctx", ctx);
%>
<!doctype html>
<html>
	<head>
	<title>지식동 글 보기</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- 부트스트랩 CSS 추가하기 -->
	<link rel="stylesheet" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
		integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

	</head>

	<body>
		<div class="container-fluid">

			<div class="row d-flex d-md-block flex-nowrap wrapper">

				<nav class="col-md-3 float-left col-1 pl-0 pr-0 collapse width show" id="sidebar">

					<div class="list-group border-0 card text-center text-md-left">

						<a href="./index.html" class="list-group-item d-inline-block collapsed" data-parent="#sidebar">

							<img style="width: 20px;" src="/resources/img/home.svg"><span
								class="d-none d-md-inline ml-1">메인</span>

						</a>

						<a href="#usermenu" class="list-group-item d-inline-block collapsed" data-toggle="collapse"
							data-parent="#sidebar" aria-expanded="false">

							<img style="width: 20px;" src="/resources/img/user.svg"><span
								class="d-none d-md-inline ml-1">회원 관리</span>

						</a>

						<div class="collapse" id="usermenu">

							<a href="userJoin.html" class="list-group-item" data-parent="#sidebar">회원가입</a>

							<a href="userLogin.html" class="list-group-item" data-parent="#sidebar">로그인</a>

							<a href="userEdit.html" class="list-group-item" data-parent="#sidebar">회원정보수정</a>

							<a href="userLogout.html" class="list-group-item" data-parent="#sidebar">로그아웃</a>
						</div>
						<a href="board.html" class="list-group-item d-inline-block collapsed" data-parent="#sidebar">
							<img style="width: 20px;" src="/resources/img/board.svg"><span
								class="d-none d-md-inline ml-1">자유 게시판</span>
						</a>
						<a href="qna.html" class="list-group-item d-inline-block collapsed" data-parent="#sidebar">
							<img style="width: 20px;" src="/resources/img/message.svg"><span
								class="d-none d-md-inline ml-1">Q & A</span>
						</a>
						<a href="#search" class="list-group-item d-inline-block collapsed" data-toggle="collapse"
							data-parent="#sidebar" aria-expanded="false">
							<img style="width: 20px;" src="/resources/img/search.svg"><span
								class="d-none d-md-inline ml-1">검색</span>
						</a>
						<div class="collapse" id="search">
							<div class="input-group p-2" style="background-color: #1c1c1c;">
								<input type="text" class="form-control" placeholder="내용을 입력하세요.">
							</div>
						</div>
					</div>
				</nav>
				<main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
					<div class="page-header mt-3">
						<h2>지식동 글 보기</h2>
					</div>
					<p class="lead">지식동 get</p>
					<hr>



					<div class="form-group">
						<label>EMAIL</label>
						<input type="text" class="form-control" id="userEmail" name="userEmail"
							value="${content.userEmail}" readonly="readonly">
					</div>

					<div class="form-group">
						<label>제목</label>
						<input type="text" class="form-control" id="title" name="title" value="${content.title}"
							readonly="readonly">
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" style="height: 320px" id="body" name="body"
							readonly="readonly">${content.body}</textarea>
					</div>

					<button data-oper='modify' class="btn btn-outline-primary">Modify</button>
					<button data-oper='list' class="btn btn-primary">list</button>

					<!-- 여기부터 댓글 관련  -->
					<hr>
					<div class='row'>
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<i class="far fa-comments"></i> Reply
									<span class="float-right">
										<button id='addReplyBtn' class='btn btn-primary btn-sm'>New Reply</button>
									</span>
								</div>

								<div class="panel-body">
									<ul class="list-group list-group-flush">
										<li class="list-group-item" data-replyid='12'>
											<div>
												<div class="header">
													<strong class="primary-font">user00</strong>
													<small class="pull-right text-muted">2018-01-01 00:00</small>
												</div>
												<p>첫번째 댓글을 달아보세요!</p>
											</div>
										</li>
									</ul>
								</div>
								<div class="panel-footer">
								</div>
							</div>
						</div>
					</div>
					<!-- 댓글 끝 -->

			        <form id='operForm' action="/jisikdong/modify" method="get">
			          <input type='hidden' id='contentId' name='contentId' value='<c:out value="${content.contentId}"/>'>
			          <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
			          <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
			          <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
			          <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
			        </form>

					<footer class="text-center" style="max-width: 920px;">

						<p>Copyright ⓒ 2019 <b>잘바조</b> All Rights Reserved.</p>

					</footer>

				</main>

			</div>

		</div>
		<!-- 댓글 모달 시작 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Reply</label>
							<input class="form-control" name='body' value='new!'>
						</div>

						<div class="form-group">
							<label>Replyer</label>
							<input class="form-control" name='userEmail' value='dummy@gmail.com'>
						</div>

						<div class="form-group">
							<label>Reply Date</label>
							<input class="form-control" name='createdDate' value=''>
						</div>
					</div>
					<div class="modal-footer">
						<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
						<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
						<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
						<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 댓글 모달 끝 -->

		<!-- 제이쿼리 자바스크립트 추가하기 -->
		<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
		<!-- 부트스트랩 자바스크립트 추가하기 -->
		<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

		<script type="text/javascript" src="${ctx}/resources/reply.js"></script>

		<script>
			$(document).ready(function () {

				var contentIdValue = '<c:out value="${content.contentId}"/>';
				var bodyUL = $(".list-group-flush");

				showList(1);

				function showList(page) {

					console.log("!!!!" + page);

					replyService.getList({ contentId: contentIdValue, page: page || 1 }, function (replyCnt, list) {

						if (page == -1) {
							pageNum = Math.ceil(replyCnt / 10.0);
							showList(pageNum);
							return;
						}

						var str = "";

						if (list == null || list.length == 0) {
							return;
						}

						for (var i = 0, len = list.length || 0; i < len; i++) {
							str += "<li class='list-group-item' data-replyid='" + list[i].replyid + "'>";
							str += "	<div><div class='header'><strong class='primary-font'>[" + list[i].replyid + "]" + list[i].userEmail + "</strong>";
							str += "		<small class='pull-right text-muted'>" + replyService.displayTime(list[i].createdDate) + "</small></div>";
							str += "			<p>" + list[i].body + "</p></div></li>";
						}

						bodyUL.html(str);

						showReplyPage(replyCnt);

					}); // end list function
				} // end showList function

				var pageNum = 1;
				var replyPageFooter = $(".panel-footer");

				function showReplyPage(replyCnt) {

					var endNum = Math.ceil(pageNum / 10.0) * 10;
					var startNum = endNum - 9;

					var prev = startNum != 1;
					var next = false;

					if (endNum * 10 >= replyCnt) {
						endNum = Math.ceil(replyCnt / 10.0);
					}

					if (endNum * 10 < replyCnt) {
						next = true;
					}

					var str = "<ul class='pagination pull-right'>";

					if (prev) {
						str += "<li class='page-item'><a class='page-link' href='" + (startNum - 1) + "'>Previous</a></li>";
					}

					for (var i = startNum; i <= endNum; i++) {

						var active = pageNum == i ? "active" : "";

						str += "<li class='page-item " + active + " '><a class='page-link' href='" + i + "'>" + i + "</a></li>";
					}

					if (next) {
						str += "<li class='page-item'><a class='page-link' href='" + (endNum + 1) + "'>Next</a></li>";
					}

					str += "</ul></div>";

					// console.log(str);

					replyPageFooter.html(str);
				}

				replyPageFooter.on("click", "li a", function (e) {

					e.preventDefault();

					var targetPageNum = $(this).attr("href");

					//console.log("targetPageNum: " + targetPageNum);

					pageNum = targetPageNum;

					showList(pageNum);
				});


				var modal = $(".modal");
				var modalInputBody = modal.find("input[name='body']");
				var modalInputUserEmail = modal.find("input[name='userEmail']");
				var modalInputCreatedDate = modal.find("input[name='createdDate']");

				var modalModBtn = $("#modalModBtn");
				var modalRemoveBtn = $("#modalRemoveBtn");
				var modalRegisterBtn = $("#modalRegisterBtn");

				$("#addReplyBtn").on("click", function (e) {

					modal.find("input").val("");
					modalInputCreatedDate.closest("div").hide();
					modal.find("button[id != 'modalCloseBtn']").hide();

					modalRegisterBtn.show();

					$(".modal").modal("show");
				});

				modalRegisterBtn.on("click", function (e) {

					var body = {
						body: modalInputBody.val(),
						userEmail: modalInputUserEmail.val(),
						contentId: contentIdValue
					};

					replyService.add(body, function (result) {
						alert(result);

						modal.find("input").val("");
						modal.modal("hide");

						showList(-1);
					});
				});

				$(".list-group-flush").on("click", "li", function (e) {

					var replyid = $(this).data("replyid");

					replyService.get(replyid, function (body) {

						modalInputBody.val(body.body);
						modalInputUserEmail.val(body.userEmail); // 이것도 readonly처리 해야할까?
						modalInputCreatedDate.val(replyService.displayTime(body.createdDate)).attr("readonly", "readonly");
						modal.data("replyid", body.replyid);

						modal.find("button[id != 'modalCloseBtn']").hide();
						modalModBtn.show();
						modalRemoveBtn.show();

						$(".modal").modal("show");
					});

					console.log(replyid);
				});

				modalModBtn.on("click", function (e) {

					var body = { replyid: modal.data("replyid"), body: modalInputBody.val() };

					replyService.update(body, function (result) {

						alert(result);
						modal.modal("hide");
						showList(pageNum);
					});
				});

				modalRemoveBtn.on("click", function (e) {

					var replyid = modal.data("replyid");

					replyService.remove(replyid, function (result) {

						alert(result);
						modal.modal("hide");
						showList(pageNum);
					});
				});

			}); // $(document).ready(function()
		</script>

		<script>
			console.log("JS TEST");

			var contentIdValue = '<c:out value="${content.contentId}"/>';


		$(document).ready(function(){

		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click",function(e){
		operForm.attr("action", "/jisikdong/modify").submit();
		});

		$("button[data-oper='list']").on("click", function(e){
		operForm.find("#contentId").remove();
		operForm.attr("action", "/jisikdong/list");
		operForm.submit();
		});

		});

		</script>

	</body>

</html>
