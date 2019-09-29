<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String ctx = request.getContextPath();
    pageContext.setAttribute("ctx", ctx);
%>
<style>
    .bigPictureWrapper {
        position: absolute;
        display: none;
        justify-content: center;
        align-items: center;
        top: 0%;
        width: 100%;
        height: 100%;
        background-color: linen;
        z-index: 100;
        background: rgba(255, 255, 255, 0.5);
    }

    .bigPicture {
        position: relative;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .bigPicture img {
        width: 600px;
    }
</style>
<%@include file="../includes/header.jsp" %>
<title>Community</title>
<body>
<section class="feature-area">
    <div class="container">
        <div class="row">
            <div id="main" class="col-md-12">
                <div class="page-header mt-3">
                    <h5>Community</h5>
                </div>
                <hr>

                <!-- 큰 사진 출력 -->
                <div class='bigPictureWrapper'>
                    <div class='bigPicture'>
                    </div>
                </div>

                <div class="form-group">
                    <h3>${content.title}</h3>
                </div>

                <div class="form-group">
                    <small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${content.userEmail}</small>
                </div>
                <br>

                <div class="form-group">

                    <div class='uploadResult'>
                        <ul></ul>
                    </div>
                    ${content.body}
                    <br><br><br><br>

                </div>

                <form id='operForm' action="/community/modify" method="get">
                    <input type='hidden' id='contentId' name='contentId' value='<c:out value="${content.contentId}"/>'>
                    <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                    <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
                    <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
                    <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
                </form>

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
                                <div class="panel-body">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item" data-replyid='12'>
                                            <div>
                                                <div class="header">
                                                    <strong class="primary-font">user00</strong>
                                                    <small class="pull-right text-muted">2019-10-25 00:00</small>
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
                </div>
                <!-- 댓글 끝 -->
            </div>

        </div>
    </div>
</section>


<!-- 댓글 모달 시작 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
<script type="text/javascript" src="${ctx}/resources/js/content/replyFunction.js"></script>

<script>
$(document).ready(function () {

    var contentIdValue = '<c:out value="${content.contentId}"/>';
    console.log(contentIdValue);
    var bodyUL = $(".list-group-flush");

    showList(1);

    function showList(page) {

        replyService.getList({contentId: contentIdValue, page: page || 1}, function (replyCnt, list) {

            if (page == -1) {
                pageNum = Math.ceil(replyCnt / 10.0);
                showList(pageNum);
                return;
            }

            var str = "";

            if (list == null || list.length == 0) {

                str += "<li class='list-group-item' data-replyid='12'>";
                str += "	<div>";
                str += "    	<div class='header'>";
                str += " 			<strong class='primary-font'>user00</strong>";
                str += "       		<small class='pull-right text-muted'>2018-01-01 00:00</small>";
                str += "   		</div>";
                str += "		<p>첫번째 댓글을 달아보세요!</p>";
                str += "	</div>";
                str += "</li>";

                bodyUL.html(str);
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

        //console.log(str);

        replyPageFooter.html(str);
    }

    replyPageFooter.on("click", "li a", function (e) {
        e.preventDefault();
        var targetPageNum = $(this).attr("href");
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
    var modalCloseBtn = $("#modalCloseBtn");

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

        var body = {replyid: modal.data("replyid"), body: modalInputBody.val()};

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

    modalCloseBtn.on("click", function (e) {
        modal.modal("hide");
    });

}); // $(document).ready(function()
</script>
<script>
$(document).ready(function () {
    (function () {
        var contentId = '<c:out value="${content.contentId}"/>';

        $.getJSON("/jisikdong/getAttachList", {contentId: contentId}, function (arr) {
            console.log(arr);

            var str = "";

            $(arr).each(function (i, attach) {
                var fileCallPath = encodeURIComponent(attach.uploadPath + "/" + attach.uuid + "_" + attach.fileName);

                str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' ></div>";
                str += "<img width='410' src='/content/display?fileName=" + fileCallPath + "'></div></li><br>";

            });
            $(".uploadResult ul").html(str);
        });

    })();


    // 사진 클릭하면 원본 이미지 뜸
    $(".uploadResult").on("click", "li", function (e) {
        console.log("view image");
        var liObj = $(this);

        var path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"));

        showImage(path.replace(new RegExp(/\\/g), "/"));
    });


    // 클릭하면 원본 이미지 보여주는 메서드
    function showImage(fileCallPath) {
        $(".bigPictureWrapper").css("display", "flex").show();

        $(".bigPicture").html("<img src='/content/display?fileName=" + fileCallPath + "'>").animate({
            width: '100%',
            height: '100%'
        }, 1000);
    }


    // 원본 이미지 클릭하면 사라지는 기능
    $(".bigPictureWrapper").on("click", function (e) {
        $(".bigPicture").animate({width: '0%', height: '0%'}, 1000);
        setTimeout(function () {
            $('.bigPictureWrapper').hide();
        }, 1000);
    });


});
</script>
<script type="text/javascript">
    $(document).ready(function () {

        console.log(replyService);

        var operForm = $("#operForm");

        $("button[data-oper='modify']").on("click", function (e) {
            operForm.attr("action", "/community/modify").submit();
        });

        $("button[data-oper='list']").on("click", function (e) {
            operForm.find("#contentId").remove();
            operForm.attr("action", "/community/list");
            operForm.submit();
        });
    });
</script>
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<%@ include file="../includes/footer.jsp" %>