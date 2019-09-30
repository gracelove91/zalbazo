<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html>
<head>
    <%@include file="../includes/header.jsp" %>
    <style>
        .uploadResult {
            width: 100%;
            background-color: #b3f0ff;
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
            width: 50px;
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


<body>
<section class="feature-area">
    <div class="container">
        <div class="row">

            <div class="col-md-2"></div>

            <div id="main" class="col-md-8">
                <div class="page-header mt-3">
                    <h2>커뮤 글 쓰기</h2>
                </div>
                <p class="lead">게시글을 작성합니다.</p>
                <hr>


                <form class="pt-3 md-3" role='form' action="/community/register" method="post">
                    <div class="form-group">
                        <label>EMAIL</label>
                        <input type="text" class="form-control" name="userEmail" readonly="readonly"
                               value="${useremail}">
                    </div>
                    <div class="form-group">
                        <label>제목</label>
                        <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요.">
                    </div>
                    <div class="form-group">
                        <label>내용</label>
                        <textarea class="form-control" id="body" name="body" placeholder="내용을 입력하세요."
                                  style="height: 320px;"></textarea>
                    </div>


                    <!-- 파일 첨부 부분 -->
                    <div class="row">
                        <div class="col-lg-12">

                            <div class="form-group uploadDiv">
                                <input type="file" name='uploadFile' multiple>
                            </div>

                            <div class='uploadResult'>
                                <ul>
                                </ul>
                            </div>

                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary float-right" id="regBtn" name="regBtn">글 쓰기</button>
                </form>
                <br/><br/><br/>


                <footer class="text-center" style="max-width: 920px;">
                    <p>Copyright ⓒ 2019 <b>잘바조</b> All Rights Reserved.</p>
                </footer>
            </div>

            <div class="col-md-2"></div>

        </div>
    </div>
</section>
<script>
    $(document).ready(function (e) {
        var formObj = $("form[role='form']");

        $("button[type='submit']").on("click", function (e) {
            e.preventDefault();
            console.log("submit clicked");

            var str = "";

            $(".uploadResult ul li").each(function (i, obj) {
                var jobj = $(obj);

                console.log(jobj);

                str += "<input type'hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
                str += "<input type'hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
                str += "<input type'hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";

            });

            formObj.append(str).submit();
        });


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
            return true;
            }
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
                var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);

                str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'><div>";
                str += "<span>" + obj.fileName + "</span>";
                str += "<button type='button' data-file=\'" + fileCallPath + "\' class='btn btn-secondary btn-sm'>";
                str += "<i class='fa fa-times'></i></button><br>";
                str += "<img style='width:80px' src='/content/display?fileName=" + fileCallPath + "'></div></li>";

            });

            uploadUL.append(str);
        }


        // 첨부파일 X 표시에 대한 이벤트(첨부파일 삭제)
        $(".uploadResult").on("click", "button", function (e) {
            console.log("delete file...");

            var targetFile = $(this).data("file");
            var targetLi = $(this).closest("li");

            $.ajax({
                url: '/content/deleteFile',
                data: {fileName: targetFile},
                dataType: 'text',
                type: 'POST',
                success: function (result) {
                    alert(result);
                    targetLi.remove();
                }
            });

        });
    });
</script>
<script>
var regBtn = $("button[id='regBtn']");

regBtn.on("click", function(e) {
	
	if($("input[id='title']").val().trim() === "" || $("input[id='title']").val().trim() == null) {
		alert("제목을 입력하세요");
		return;
	}
	
	if($("textarea[id='body']").val().trim() == "" || $("textarea[id='body']").val().trim() == null) {
		alert("내용을 입력하세요");
		return;
	}
	
}); // regBtn click
</script>
<%@ include file="../includes/footer.jsp" %>
