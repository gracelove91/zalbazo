<%@ page import="kr.zalbazo.model.user.User" %>
<%@ page import="org.springframework.web.context.request.SessionScope" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>병원 회원가입</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 부트스트랩 CSS 추가하기 -->
    <link rel="stylesheet" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<%@include file="/WEB-INF/views/includes/header.jsp" %>
<body>
<div class="container-fluid">
    <div class="row">

        <div class="col-md-2"></div>

        <div id="main" class="col-md-8">
            <div class="page-header mt-3">
                <h2>병원 정보 입력</h2>
            </div>
            <p class="lead">병원의 정보를 입력해주세요.</p>
            <hr>


            <form class="pt-3 md-3" role='form' action="/hospitalinfo/register" method="post"
                  enctype="multipart/form-data">
                <input type="hidden" name="user" value="${user}"/>
                <input type="hidden" name="userEmail" value="${user.userEmail}"/>
                <input type="hidden" name="password" value="${user.password}"/>


                <div class="form-group">
                    <fieldset>
                        <label class="font-weight-bold">병원명</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="병원명을 입력하세요">
                    </fieldset>
                </div>
                <br/>


                <div class="form-group">
                    <fieldset>
                        <label class="font-weight-bold">전화번호</label>
                        <input type="text" class="form-control" id="tel" name="tel" placeholder="000-0000-0000">
                    </fieldset>
                </div>
                <br/>


                <div class="form-group">
                    <p class="font-weight-bold">제공하는 서비스를 체크해주세요</p>

                    <div class="form-check-inline">
                        <label class="form-check-label" for="label_info1">
                            <input type="checkbox" class="form-check-input" id="label_info1" name="label_info" value=1>24시간
                        </label>
                    </div>

                    <div class="form-check-inline">
                        <label class="form-check-label" for="label_info2">
                            <input type="checkbox" class="form-check-input" id="label_info2" name="label_info" value=2>미용
                        </label>
                    </div>

                    <div class="form-check-inline">
                        <label class="form-check-label" for="label_info3">
                            <input type="checkbox" class="form-check-input" id="label_info3" name="label_info" value=3>주차
                        </label>
                    </div>

                    <div class="form-check-inline">
                        <label class="form-check-label" for="label_info4">
                            <input type="checkbox" class="form-check-input" id="label_info4" name="label_info" value=4>희귀종취급
                        </label>
                    </div>

                    <div class="form-check-inline">
                        <label class="form-check-label" for="label_info5">
                            <input type="checkbox" class="form-check-input" id="label_info5" name="label_info" value=5>수술전문
                        </label>
                    </div>

                </div>
                <br/>


                <div class="form-group">
                    <fieldset>
                        <label class="font-weight-bold">주소</label>
                        <input required="required" type="text" class="form-control" name="address"
                               id="address" placeholder="주소를 입력하세요." readonly="true"/>
                        <input type="button" onClick="goPopup();" value="주소찾기"/>
                    </fieldset>
                </div>
                <br/>


                <div class="row">

                    <div class="form-group col-md-6">
                        <label for="treatStart" class="font-weight-bold">문 여는 시간</label>
                        <select class="form-control" id="treatStart" name="treatStart">

                            <c:forEach begin="0" end="24" step="1" var="hour">
                                <!-- hour라는 값에 변수가 10보다 작을 경우 -->
                                <c:if test="${hour < 10}">
                                    <!-- hour 01,02,03... 으로 바뀜 -->
                                    <c:set value="0${hour}" var="hour"></c:set>
                                </c:if>
                                <option>${hour}:00</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="treatEnd" class="font-weight-bold">문 닫는 시간</label>
                        <select class="form-control" id="treatEnd" name="treatEnd">

                            <c:forEach begin="0" end="24" step="1" var="hour">
                                <!-- hour라는 값에 변수가 10보다 작을 경우 -->
                                <c:if test="${hour < 10}">
                                    <!-- hour 01,02,03... 으로 바뀜 -->
                                    <c:set value="0${hour}" var="hour"></c:set>
                                </c:if>
                                <option>${hour}:00</option>
                            </c:forEach>
                        </select>
                    </div>

                </div>
                <br/>


                <div class="form-group">
                    <fieldset>
                        <label class="font-weight-bold">세부사항</label>
                        <textarea class="form-control" id="info" name="info"
                                  placeholder="병원에 대한 상세정보를 적어주세요." style="height: 200px;"></textarea>
                    </fieldset>
                </div>
                <br/>


                <!-- 파일 첨부 부분 -->
                <div class="row">
                    <div class="col-lg-12">

                        <div class="form-group uploadDiv">
                            <label class="font-weight-bold">병원 사진</label><br>
                            <input type="file" name='uploadFile' multiple>
                        </div>

                        <div class='uploadResult'>
                            <ul>
                            </ul>
                        </div>

                    </div>
                </div>

                <button type="submit" class="btn btn-primary pull-right" id="regBtn" name="regBtn">회원가입</button>
            </form>
            <br/><br/><br/>

        </div>

        <div class="col-md-2"></div>

    </div>
</div>


<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 자바스크립트 추가하기 -->
<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function (e) {

        var formObj = $("form[role='form']");

        $("button[type='submit']").on("click", function (e) {

            e.preventDefault();

            console.log("submit clicked");

            var hName = $("input[id='name']").val();
            var hTel = $("input[id='tel']").val();
            var hAddress = $("input[id='address']").val();
            var hInfo = $("textarea[id='info']").val();
            var hTreatStart = $("select[id='treatStart']").val();
            var hTreatEnd = $("select[id='treatEnd']").val();

            var regex = /^\d{2,3}-\d{3,4}-\d{4}$/;

            if (hName.trim() === "" || hName.trim() === null || hName.trim().length < 5) {
                alert("병원명을 최소 5자 이상 입력해주세요.")
                return;
            }

            if (!regex.test($("input[id='tel']").val())) {
                alert("전화번호를 000-0000-0000 형태로 입력해주세요");
                return;
            }

            if (hAddress.trim() === "" || hAddress.trim() === null) {
                alert("주소를 입력해주세요");
                return;
            }

            if (hInfo.trim().length < 10) {
                alert("병원에 대한 정보를 최소 10자 이상 입력해주세요.");
                return;
            }


            var str = "";
            
            var check = true;

            $(".uploadResult ul li").each(function (i, obj) {
                var jobj = $(obj);
                
                check = false;

                check = false; 
                
                console.log(jobj);

                str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
                str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
                str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";

            });
            
            if(check) {
            	alert("병원 사진을 최소 1장 이상 등록해주세요.");
            	return;
            }

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
            console.log(inputFile);
            var files = inputFile[0].files;

            for (var i = 0; i < files.length; i++) {
                if (!checkExtension(files[i].name, files[i].size)) {
                    return false;
                }
                formData.append("uploadFile", files[i]);
            }

            $.ajax({
             url: '/hospitalinfo/uploadAjaxAction',
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
	 
	 
	 
	// 첨부파일 등록 시 이미지와 함께 X가 보여짐
     function showUploadResult(uploadResultArr) {
         if (!uploadResultArr || uploadResultArr.length == 0) {
             return;
         }

         var uploadUL = $(".uploadResult ul");

         var str = "";

         $(uploadResultArr).each(function (i, obj) {
             var fileCallPath = encodeURIComponent(obj.uploadPath + obj.uuid + "_" + obj.fileName);

             str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-ext='" +obj.ext+ "'><div>";
             str += "<span>" + obj.fileName + "</span>";
             str += "<button type='button' data-file=\'" + fileCallPath + "\' class='btn btn-secondary btn-sm'>";
             str += "<i class='fa fa-times'></i></button><br>";
             str += "<img style='width:80px' src='/hospitalinfo/display?fileName=" + fileCallPath + "'></div></li>";

         });

         uploadUL.append(str);
     }
	
	
     // 첨부파일 X 표시에 대한 이벤트(첨부파일 삭제)
     $(".uploadResult").on("click", "button", function (e) {
         console.log("delete file...");

         var targetFile = $(this).data("file");
         console.log(targetFile);
         var targetLi = $(this).closest("li");

         $.ajax({
             url: '/hospitalinfo/deleteFile',
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
    function goPopup() {
        var pop = window.open("jusoPopup", "pop",
            "width=570,height=420, scrollbars=yes, resizable=yes");
    }

    function jusoCallBack(roadFullAddr) {
        $("#address").val(roadFullAddr);
    }
</script>

<%@include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>