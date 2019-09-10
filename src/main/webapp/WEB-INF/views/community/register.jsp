<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html>
 <head>
 
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

    <title>커뮤 글 쓰기</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 부트스트랩 CSS 추가하기 -->
    <link rel="stylesheet" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
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
              <h2>커뮤 글 쓰기</h2>
          </div>
          <p class="lead">게시글을 작성합니다.</p>
          <hr>
          <form class="pt-3 md-3" role='form' style="max-width: 920px" action="/jisikdong/register" method="post">
			<div class="form-group">
              <label>EMAIL</label>
              <input type="text" class="form-control" name="userEmail" placeholder="이메일을 입력하시오" value="dummy@gmail.com">
            </div>
            <div class="form-group">
              <label>제목</label>
              <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요.">
            </div>
            <div class="form-group">
              <label>내용</label>
              <textarea class="form-control" id="body" name="body" placeholder="내용을 입력하세요." style="height: 320px;"></textarea>
            </div>
            <button type="submit" class="btn btn-primary" id="regBtn" name="regBtn">글 쓰기</button>
          </form>
          
<!--           첨부파일관련
          <hr>
          <div class="row">
          	<div class="col-lg-12">
          		<div class="panel panel-default">
          			<div class="panel-heading">파일첨부</div>
          			<div class="panel-body">
          				<div class="form-group uploadDiv">
          					<input type="file" name='uploadFile' multiple>
          				</div>
          				<div class='uploadResult'>
          					<ul>
          					</ul>
          				</div>
          			</div>
          		</div>
          	</div>
          </div>
          첨부파일관련 끝 -->
          
          <footer class="text-center" style="max-width: 920px;">
            <p>Copyright ⓒ 2019 <b>잘바조</b> All Rights Reserved.</p>
          </footer>
        </main>
      </div>
    </div>
    <!-- 제이쿼리 자바스크립트 추가하기 -->
    <script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩 자바스크립트 추가하기 -->
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
    <script>
    $(document).ready(function(e) {
    		var formObj = $("form[role='form']");
    		
    		 $("button[type='submit']").on("click", function(e){
    		    console.log(formObj);
    		    e.preventDefault();
   			    
    			console.log("submit clicked");
    		    
    		    var str = "";
    		    
   			    $(".uploadResult ul li").each(function(i, obj){
   			      
   			      var jobj = $(obj);
    			      
    			  console.dir(jobj);
    			     
    			     str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
    			     str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
    			     str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
    			     str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
    			});
    			    
    			formObj.append(str).submit();
    		});
    		
    		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880; // 5MB

			function checkExtension(fileName, fileSize) {

				if (fileSize >= maxSize) {
					alert("파일 사이즈 초과");
					return false;
				}

				if (regex.test(fileName)) {
					alert("해당 확장자 파일은 업로드 ㄴㄴ");
					return false;
				}
				return true;
			}
			
			function showUploadResult(uploadResultArr) {
				
				if(!uploadResultArr || uploadResultArr.length == 0) {return; }
				
				var uploadUL = $(".uploadResult ul");

				var str = "";
				
				$(uploadResultArr).each(function(i, obj) {
						
					if(obj.image){
						
						var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
						
						str += "<li data-path='"+obj.uploadPath+"'";
						str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
						str +" ><div>";
						str += "<span> "+ obj.fileName+"</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' "
						str += "data-type='image' class='btn btn-warning btn-circle btn-sm'>x</button><br>";
						str += "<img src='/display?fileName="+fileCallPath+"'>";
						str += "</div>";
						str +"</li>";
						
					}else{
						
						var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
					    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
					      
						str += "<li "
						str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
						str += "<span> "+ obj.fileName+"</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
						str += "class='btn btn-warning btn-circle btn-sm'>x</button><br>";
						str += "<img src='/resources/img/attach.png'></a>";
						str += "</div>";
						str +"</li>";
					}

			});
				
				uploadUL.append(str);
			}
			
			$("input[type='file']").change(function(e) {
				
				var formData = new FormData();

				var inputFile = $("input[name='uploadFile']");

				var files = inputFile[0].files;
				
				for (var i = 0; i < files.length; i++) {

					if (!checkExtension(files[i].name, files[i].size)) {
						return false;
					}

					formData.append("uploadFile", files[i]);
				}
				
				$(".uploadResult").on("click", "button", function(e) {
					console.log("delete");
					
					var targetFile = $(this).data("file");
					var type = $(this).data("type");
					
					var targetLi = $(this).closest("li");
					
					$.ajax({
						url : '/deleteFile',
						data : {fileName:targetFile, type:type},
						dataType : 'text',
						type : 'POST',
							success : function(result) {
								alert(result);
								targetLi.remove();
							}
					}); // ajax
				})
				
				$.ajax({
					url : '/uploadAjaxAction',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					dataType : 'json',
					success : function(result) {
						console.log(result);
						showUploadResult(result);
					}
				}); // $.ajax
				
			});
    		
			
    	
    		
    	}); // document function ready
    </script>
  </body>
</html>
