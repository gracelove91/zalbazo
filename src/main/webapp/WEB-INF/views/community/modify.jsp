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
    <title>커뮤 글 보기</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 부트스트랩 CSS 추가하기 -->
    <link rel="stylesheet" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css">
  </head>
  <body>
  	<img alt="" src="${ctx}/resources/img/pika.gif">
	<h2>여기는 커뮤modify</h2>
    <div class="container-fluid">
      <div class="row d-flex d-md-block flex-nowrap wrapper">
        <nav class="col-md-3 float-left col-1 pl-0 pr-0 collapse width show" id="sidebar">
          <div class="list-group border-0 card text-center text-md-left">
            <a href="./index.html" class="list-group-item d-inline-block collapsed" data-parent="#sidebar">
              <img style="width: 20px;" src="/resources/img/home.svg"><span class="d-none d-md-inline ml-1">메인</span>
            </a>
            <a href="#usermenu" class="list-group-item d-inline-block collapsed" data-toggle="collapse"
             data-parent="#sidebar" aria-expanded="false">
              <img style="width: 20px;" src="/resources/img/user.svg"><span class="d-none d-md-inline ml-1">회원 관리</span>
            </a>
            <div class="collapse" id="usermenu">
              <a href="userJoin.html" class="list-group-item" data-parent="#sidebar">회원가입</a>
              <a href="userLogin.html" class="list-group-item" data-parent="#sidebar">로그인</a>
              <a href="userEdit.html" class="list-group-item" data-parent="#sidebar">회원정보수정</a>
              <a href="userLogout.html" class="list-group-item" data-parent="#sidebar">로그아웃</a>
            </div>
            <a href="board.html" class="list-group-item d-inline-block collapsed" data-parent="#sidebar">
              <img style="width: 20px;" src="/resources/img/board.svg"><span class="d-none d-md-inline ml-1">자유 게시판</span>
            </a>
            <a href="qna.html" class="list-group-item d-inline-block collapsed" data-parent="#sidebar">
              <img style="width: 20px;" src="/resources/img/message.svg"><span class="d-none d-md-inline ml-1">Q & A</span>
            </a>
            <a href="#search" class="list-group-item d-inline-block collapsed" data-toggle="collapse"
             data-parent="#sidebar" aria-expanded="false">
              <img style="width: 20px;" src="/resources/img/search.svg"><span class="d-none d-md-inline ml-1">검색</span>
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
              <h2>커뮤 글 수정하기</h2>
          </div>
          <p class="lead">커뮤 modify</p>
          <hr>
		  <form role="form" action="/community/modify" method="post">
		  
		    <div class="form-group">
              <input type="hidden" class="form-control" id="id" name="id" value="${content.id}" readonly="readonly">
            </div>
            <div class="form-group">
              <input type="hidden" class="form-control" id="categoryId" name="categoryId" value="${content.categoryId}" readonly="readonly">
            </div>
            <div class="form-group">
              <label>EMAIL</label>
              <input type="text" class="form-control" id="userEmail" name="userEmail" value="${content.userEmail}" readonly="readonly">
            </div>
            <div class="form-group">
              <label>제목</label>
              <input type="text" class="form-control" id="title" name="title" value="${content.title}">
            </div>
            <div class="form-group">
              <label>내용</label>
              <textarea class="form-control" style="height: 320px" id="body" name="body">${content.body}</textarea>
            </div>
            
            <button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
            <button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
            <button type="submit" data-oper='list' class="btn btn-info">List</button>
            
		  </form>
          <footer class="text-center" style="max-width: 920px;">
            <p>Copyright ⓒ 2018 <b>잘바조</b> All Rights Reserved.</p>
          </footer>
        </main>
      </div>
    </div>
    <!-- 제이쿼리 자바스크립트 추가하기 -->
    <script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩 자바스크립트 추가하기 -->
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    		
    		var formObj = $("form");
    		
    		$('button').on("click", function(e){
    			
    			e.preventDefault();
    			
    			var operation = $(this).data("oper");
    			
    			console.log(operation);
    			
    			if(operation === 'remove') {

    				formObj.attr("action", "/community/remove");
    			}else if(operation === 'list'){
					
    				formObj.attr("action", "/community/list").attr("method", "get");
					formObj.empty();
    			}
    			formObj.submit();
    		});
    	});
    </script>
  </body>
</html>
