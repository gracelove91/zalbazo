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
            <main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
                <div class="page-header mt-3">
                    <h2>동물관리</h2>
                </div>
                <p class="lead">내동물</p>
                <hr>
                <table class="table table-striped" style="max-width: 2000px;">
                    <thead>
                        <tr>
                            <th scope="col" class="mobile" style="width:80px; text-align:center;">no</th>
                            <th scope="col" class="mobile" style="text-align:center;">사진</th>
                            <th scope="col" class="mobile" style="width:80px; text-align:center;">이름</th>
                            <th scope="col" class="mobile" style="width:120px; text-align:center;">value</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${AnimalList}" var="animal">
                            <tr>
                                <th scope="row" class="mobile" style="text-align:center;">
                                    <c:out value="${animal.animalId}" />
                                </th>

                                <td class="mobile" style="text-align:center;">
                                    <c:out value="없음" />
                           
                                        <td><c:out value="${animal.name}" /></td>

                                </td>
                                <td class="mobile" style="text-align:center;">
                                     		<button onclick="location.href='modify?id=${animal.animalId}'">수정</button>
                                     		<button onclick="location.href='remove?id=${animal.animalId}'">삭제</button>
                                </td>
                                
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel">지식動</h4>
                            </div>
                            <div class="modal-body">처리가 완료되었습니다</div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>

                </div>

                <div style="max-width: 1080px;">
                    <a href="/user/mypage/animal/register" id='regBtn' type="button" class="btn btn-primary float-right">글쓰기</a>
                </div>

               

                <footer class="text-center" style="max-width: 1080px;">
                    <p>Copyright ⓒ 2019 <b>zalbazo</b> All Rights Reserved.</p>
                </footer>
            </main>
        </div>
    </div>

    <!-- 제이쿼리 자바스크립트 추가하기 -->

    <script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

  
</body>

</html>
