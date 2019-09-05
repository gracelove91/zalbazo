<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html>
  <head>
    <title>커뮤니티 웹 사이트</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 부트스트랩 CSS 추가하기 -->
    <link rel="stylesheet" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css">
  </head>
  <body>
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
              <img style="width: 20px;" src="/resources/img/board.svg"><span class="d-none d-md-inline ml-1">커뮤니티 게시판</span>
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
              <h2>커뮤니티 글 쓰기</h2>
          </div>
          <p class="lead">게시글을 작성합니다.</p>
          <hr>
          <form class="pt-3 md-3" style="max-width: 920px" action="/community/register" method="post">
            <div class="form-group">
              <label>제목</label>
              <input type="text" class="form-control" placeholder="제목을 입력하세요.">
            </div>
            <div class="form-group">
              <label>내용</label>
              <textarea class="form-control" placeholder="내용을 입력하세요." style="height: 320px;"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">글 쓰기</button>
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
  </body>
</html>
