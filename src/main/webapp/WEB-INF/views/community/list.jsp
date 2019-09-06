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
                <h2>커뮤니티</h2>
            </div>
            <p class="lead">커뮤니티게시판</p>
            <hr>
            <table class="table table-striped" style="max-width: 1080px;">
                <thead>
                <tr>
                    <th scope="col" class="mobile" style="width:55px; text-align:center;">번호</th>
                    <th scope="col" class="mobile" style="text-align:center;">제목</th>
                    <th scope="col" class="mobile" style="width:80px; text-align:center;">작성자</th>
                    <th scope="col" class="mobile" style="width:120px; text-align:center;">날짜</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${contentList}" var="content">
                    <tr>
                        <th scope="row" class="mobile" style="text-align:center;">
                            <c:out value="${content.id}"/>
                        </th>

                        <td><a style="color: #000000;" href='/community/get?id=<c:out value="${content.id}"/>'>
                            <c:out value="${content.title}"/></a></td>

                        <td class="mobile" style="text-align:center;">
                            <c:out value="${content.userEmail}"/>
                        </td>
                        <td class="mobile" style="text-align:center;">
                            <fmt:formatDate value="${content.createdDate}" pattern="yyyy-MM-dd"/>
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
                                    aria-hidden="true">&times;
                            </button>
                            <h4 class="modal-title" id="myModalLabel">커뮤니티</h4>
                        </div>
                        <div class="modal-body">처리가 완료되었습니다</div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>

            </div>

            <div style="max-width: 1080px;">
                <a href="/community/register" id='regBtn' type="button" class="btn btn-primary float-right">글쓰기</a>
            </div>
            <!-- Paging 처리 -->
            <div class='pull-right'>

                <ul class="pagination">

                    <c:if test="${pageMaker.prev}">
                        <li class="page-item previous">
                            <a class="page-link" href="${pageMaker.startPage -1}">Previous</a>
                        </li>
                    </c:if>

                    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                        <li class="page-item ${pageMaker.cri.pageNum == num ? " active" : "" }">
                            <a class="page-link mobile" href="${num}">${num}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${pageMaker.next}">
                        <li class="page-item next">
                            <a class="page-link" href="${pageMaker.endPage+1 }">Next</a>
                        </li>
                    </c:if>
                </ul>
            </div>


            <form id='actionForm' action="/community/list" method='get'>
                <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
                <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
            </form>

            <footer class="text-center" style="max-width: 1080px;">
                <p>Copyright ⓒ 2019 <b>zalbazo</b> All Rights Reserved.</p>
            </footer>
        </main>
    </div>
</div>

<!-- 제이쿼리 자바스크립트 추가하기 -->

<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript">

    $('document').ready(function () {

        var actionForm = $("#actionForm");

        $(".page-item a").on("click", function (e) {
            e.preventDefault();
            console.log('click');
            actionForm.find("input[name='pageNum']").val($(this).attr("href"));
            actionForm.submit();
        });

        $(".move").on("click", function (e) {
            e.preventDefault();
            actionForm.append("<input type='hidden' name='id' value='" + $(this).attr("href") + "'>");
            actionForm.attr("action", "/community/get");
            actionForm.submit();
        });
        var result = '<c:out value="${result}" />';

        checkModal(result);

        history.replaceState({}, null, null);

        function checkModal(result) {

            if (result === '' || history.state) {
                return;
            }

            if (parseInt(result) > 0) {
                $(".modal-body").html("게시글 " + parseInt(result) + "번이 등록되었습니다.");
            }

            $("#myModal").modal("show");
        }

        $("#regBtn").on("click", function () {
            self.location = "/community/register";
        });
    });

</script>
</body>

</html>