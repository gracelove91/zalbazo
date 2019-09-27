<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<style>
    .uploadResult {
        width: 100%;
        background-color: Thistle;
    }

    .uploadresult ul {
        display: flex;
        flex-flow: row;
        justify-content: center;
        align-items: center;
    }

    .uploadResult ul li {
        list-style: none;
        padding: 10px;
        align-content: center;
        text-align: center;
    }

    .uploadResult ul li img {
        width: 150px;
    }

    .uploadResult ul li span {
        color: purple;
    }

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
<body>
<section class="feature-area">
    <div class="container">
        <div class="row">
            <main id="main" class="col-md-12">

                <div class="page-header mt-3">
                    <h2>지식동 글 수정하기</h2>
                </div>
                <p class="lead">지식동 modify</p>
                <hr>
                <form role="form" action="/jisikdong/modify" method="post">

                    <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                    <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
                    <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
                    <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>

                    <div class="form-group">
                        <input type="hidden" class="form-control" id="contentId" name="contentId"
                               value="${content.contentId}" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <input type="hidden" class="form-control" id="categoryId" name="categoryId"
                               value="${content.categoryId}" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label>EMAIL</label>
                        <input type="text" class="form-control" id="userEmail" name="userEmail"
                               value="${content.userEmail}" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label>제목</label>
                        <input type="text" class="form-control" id="title" name="title" value="${content.title}">
                    </div>
                    <div class="form-group">
                        <label>내용</label>
                        <textarea class="form-control" style="height: 320px" id="body"
                                  name="body">${content.body}</textarea>
                    </div>

                    <!-- 파일 첨부 부분 -->
                    <div class="row">
                        <div class="col-lg-12">

                            <div class="form-group uploadDiv">
                                <input type="file" name='uploadFile' multiple="multiple">
                            </div>

                            <div class='uploadResult'>
                                <ul>
                                </ul>
                            </div>

                        </div>
                    </div>


                    <button type="submit" data-oper='modify' class="btn btn-outline-primary">Modify</button>
                    <button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
                    <button type="submit" data-oper='list' class="btn btn-primary">List</button>

                </form>
            </main>
        </div>
    </div>
</section>
</body>
<!-- 제이쿼리 자바스크립트 추가하기 -->
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 자바스크립트 추가하기 -->
<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function () {
        (function () {
            var contentId = '<c:out value="${content.contentId}"/>';
            $.getJSON("/jisikdong/getAttachList", {contentId: contentId}, function (arr) {
                console.log(arr);
                var str = "";

                $(arr).each(function (i, attach) {
                    var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);

                    str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "'><div>";
                    str += "<span>" + attach.fileName + "</span>";
                    str += "<button type='button' data-file=\'" + fileCallPath + "\' class='btn btn-warning btn-circle'><i class='fa fa-times'>";
                    str += "</i></button><br><img src='/content/display?fileName=" + fileCallPath + "'></div></li>";
                });

                $(".uploadResult ul").html(str);
            });
        })();


        $(".uploadResult").on("click", "button", function (e) {
            console.log("delete file");
            if (confirm("Remove this file?")) {
                var targetLi = $(this).closest("li");
                targetLi.remove();
            }
        });

    });
</script>

<script>
    $(document).ready(function () {

        var maxSize = 5242880; // 5MB

        // 유효성 체크 메서드
        function checkExtension(fileName, fileSize) {
            // 파일 사이즈 체크
            if (fileSize >= maxSize) {
                alert("파일 사이즈 초과");
                return false;
            }

            // 이미지 파일인지 체크
            if (fileName != "") {
                var ext = fileName.slice(fileName.lastIndexOf(".") + 1).toLowerCase();

                if (!(ext == "gif" || ext == "jpg" || ext == "png" || ext == "jpeg" || ext == "bmp")) {
                    alert("이미지파일 (jpg, jpeg, png, gif, bmp)만 업로드 가능합니다.");
                    return false;
                }
            }
            return true;
        }


        $("input[type='file']").change(function (e) {
            var formData = new FormData();
            var inputFile = $("input[name='uploadFile']");
            var files = inputFile[0].files;

            for (var i = 0; i < files.length; i++) {
                if (!checkExtension(files[i].name, files[i].size)) {
                    return false;
                }
                formData.append("uploadFile", files[i]);
            }

            $.ajax({
                url: '/content/uploadAjaxAction',
                processData: false,
                contentType: false,
                data: formData,
                type: 'POST',
                dataType: 'json',
                success: function (result) {
                    console.log(result);
                    showUploadResult(result); // 업로드 결과 처리 함수
                }
            });
        });


        // 첨부파일 등록 시 이미지와 함꼐 X가 보여짐
        function showUploadResult(uploadResultArr) {
            if (!uploadResultArr || uploadResultArr.length == 0) {
                return;
            }

            var uploadUL = $(".uploadResult ul");

            var str = "";

            $(uploadResultArr).each(function (i, obj) {
                var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

                str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'><div>";
                str += "<span>" + obj.fileName + "</span>";
                str += "<button type='button' data-file=\'" + fileCallPath + "\' class='btn btn-warning btn-circle'>";
                str += "<i class='fa fa-times'></i></button><br>";
                str += "<img src='/content/display?fileName=" + fileCallPath + "'></div></li>";

            });

            uploadUL.append(str);
        }

    });
</script>

<script type="text/javascript">
    $(document).ready(function () {

        var formObj = $("form");

        $('button').on("click", function (e) {

            e.preventDefault();

            var operation = $(this).data("oper");

            console.log(operation);

            if (operation === 'remove') {
                formObj.attr("action", "/jisikdong/remove").attr("method", "post");

            } else if (operation === 'list') {
                formObj.attr("action", "/jisikdong/list").attr("method", "get");
                var pageNumTag = $("input[name='pageNum']").clone();
                var amountTag = $("input[name='amount']").clone();
                var keywordTag = $("input[name='keyword']").clone();
                var typeTag = $("input[name='type']").clone();

                formObj.empty();
                formObj.append(pageNumTag);
                formObj.append(amountTag);
                formObj.append(keywordTag);
                formObj.append(typeTag);
            } else if (operation === 'modify') {

                console.log("submit clicked");
                var str = "";

                $(".uploadResult ul li").each(function (i, obj) {
                    var jobj = $(obj);
                    console.log(jobj);

                    str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
                    str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
                    str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";

                });

                formObj.append(str).submit();
            }
            formObj.submit();
        });
    });
</script>
<%@include file="../includes/footer.jsp" %>
