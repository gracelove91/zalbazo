<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp" %>
<section class="feature-area">
    <div class="container">
        <div class="row">
            <div id="main" class="col-md-12">

                <div class="page-header mt-3">
                    <h2>지식動</h2>
                </div>
                <p class="lead">반려동물에 대해 궁금한 것을 묻고 답해보세요</p>
                <hr>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col" class="mobile" style="width:80px; text-align:center;">번호</th>
                        <th scope="col" class="mobile" style="text-align:center;">제목</th>
                        <th scope="col" class="mobile" style="width:150px; text-align:center;">작성자</th>
                        <th scope="col" class="mobile" style="width:130px; text-align:center;">날짜</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${contentList}" var="content">
                        <tr>
                            <th scope="row" class="mobile" style="text-align:center;">
                                <c:out value="${content.contentId}"/>
                            </th>

                            <td>
                                <a class='move' style="color : #000000;" href='<c:out value="${content.contentId}"/>'>
                                    <c:out value="${content.title}"/></a>
                            </td>

                            <td class="mobile" style="text-align:center;">
                                <c:out value="${content.name}"/>
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
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
                                </button>
                                <h4 class="modal-title" id="myModalLabel">지식動</h4>
                            </div>
                            <div class="modal-body">처리가 완료되었습니다</div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div style="max-width: 100%;">
                    <button id='regBtn' type="button" type="button" class="btn btn-primary pull-right"
                            data-dismiss="modal" href="/jisikdong/register">글쓰기</button>
                </div>

                <!-- 검색 -->
                <div class='row'>
                    <div class="col-lg-12">
                        <form id='searchForm' action="/jisikdong/list" method='get'>
                            <select name='type'>
                                <option value=""<c:out value="${pageMaker.cri.type == null ? 'selected' : '' }"/>>키워드를 선택하세요
                                </option>
                                <option value="T"<c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : '' }"/>>제목
                                </option>
                                <option value="B"<c:out value="${pageMaker.cri.type eq 'B' ? 'selected' : '' }"/>>내용
                                </option>
                                <option value="U"<c:out value="${pageMaker.cri.type eq 'U' ? 'selected' : '' }"/>>작성자
                                </option>
                                <option value="TB"<c:out value="${pageMaker.cri.type eq 'TB' ? 'selected' : '' }"/>>제목
                                    or 내용
                                </option>
                                <option value="TU"<c:out value="${pageMaker.cri.type eq 'TU' ? 'selected' : '' }"/>>제목
                                    or 작성자
                                </option>
                                <option value="TUB"<c:out value="${pageMaker.cri.type eq 'TUB' ? 'selected' : '' }"/>>제목
                                    or 내용 or 작성자
                                </option>
                            </select>
                            <input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'/>
                            <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'>
                            <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'>
                            <button class='btn btn-primary'>Search</button>
                        </form>
                    </div>
                </div>

                <br>
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


                <form id='actionForm' action="/jisikdong/list" method='get'>
                    <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
                    <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
                    <input type='hidden' name='type' value='${pageMaker.cri.type}'>
                    <input type='hidden' name='keyword' value='${pageMaker.cri.keyword}'>
                </form>
            </div>
        </div>
    </div>
</section>

<!-- 제이쿼리 자바스크립트 추가하기 -->
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/userFunction.js"></script>

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
            actionForm.append("<input type='hidden' name='contentId' value='" + $(this).attr("href") + "'>");
            actionForm.attr("action", "/jisikdong/get");
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
        	userInfoService.getUser(function(data) {
        		if(data.role === 'hospital') {
        			alert('일반유저만 작성 가능합니다.');
        		} else {
		            self.location = "/jisikdong/register";
        		}
        	}, function(error) {
	              self.location = "/login";
        		  console.log('로그인 안했긔');
        	});
        });

        
        var searchForm = $("#searchForm");
        $("#searchForm button").on("click", function (e) {

            if (!searchForm.find("option:selected").val()) {
                alert("검색종류를 선택하세요.");
                return false;
            }

            if (!searchForm.find("input[name='keyword']").val()) {
                alert("키워드를 입력하세요");
                return false;
            }

            searchForm.find("input[name='pageNum']").val("1");
            e.preventDefault();

            searchForm.submit();
        });

    });
</script>
<%@ include file="../includes/footer.jsp" %>