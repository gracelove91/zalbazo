<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
.uploadResult {
   width : 100%;
   background-color : lightgray;
}

.uploadResult ul {
   display : flex;
   flex-flow : row;
   justify-content : center;
   align-items : center;
}

.uploadResult ul li {
   list-style : none;
   padding : 50px;
}

.uploadResult ul li img {
   width : 100px;
}
</style>

</head>
<body>

<h1>Upload with Ajax</h1>

<div class='uploadDiv'>
	   <input type='file' name='uploadFile' multiple>
	</div>
	
	<div class='uploadResult'>
	   <ul>
	   </ul>
	</div>

<button id='uploadBtn'>Upload</button>


<!-- 제이쿼리 자바스크립트 추가하기 -->
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 자바스크립트 추가하기 -->
<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
$(document).ready(function(){

	var maxSize = 5242880; // 5MB
	
	// 유효성 체크 메서드
	function checkExtension(fileName, fileSize) {
		// 파일 사이즈 체크
		if(fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
		
		// 이미지 파일인지 체크
		if(fileName != "") {
			var ext = fileName.slice(fileName.lastIndexOf(".") +1).toLowerCase();
			
			if(!(ext == "gif" || ext == "jpg" || ext == "png" || ext == "jpeg" || ext == "bmp")) {
				alert("이미지파일 (jpg, jpeg, png, gif, bmp)만 업로드 가능합니다.");
				return false;
			}
		}
		return true;
	}
	
	
	
	var cloneObj = $(".uploadDiv").clone();
	
	
	$("#uploadBtn").on("click", function(e){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		console.log(files);
		
		// add filedate to formdata
		for(var i=0; i<files.length; i++) {
			
			// 첨부파일 유효성 체크
			if(!checkExtension(files[i].name, files[i].size)) {
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		
		
		$.ajax({
			url : '/community/uploadAjaxAction',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			success : function(result) {
				
				console.log(result);
				
				showUploadedFile(result);
				
				$(".uploadDiv").html(cloneObj.html());
				
			}
		}); // $.ajax
		
	});
	
	
	
	var uploadResult = $(".uploadResult ul");
	
	function showUploadedFile(uploadResultArr) {
		var str = "";
		
		// 우선 그냥 임의로 지정해둔 값 
		var picLibId = 11;
		
		$(uploadResultArr).each(function(i, obj) {
			
			var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + picLibId + "_"+obj.fileName);
			
			var originPath = obj.uploadPath+ "\\" + picLibId + "_" + obj.fileName;
			
			originPath = originPath.replace(new RegExp(/\\/g), "/");
			
			str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\">"+
			   "<img src='/community/display?fileName="+fileCallPath+"'></a>"+
			   "<span data-file=\'"+fileCallPath+"\'> x </span></li>";
			
		});
		uploadResult.append(str);
	}
	
	
	
	// x 표시에 대한 이벤트 (첨부파일 삭제)
	$(".uploadResult").on("click", "span", function(e){
		var targetFile = $(this).data("file");
		console.log(targetFile);
		
		$.ajax({
			url : '/community/deleteFile',
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result){
				alert(result);
			}
		});
		
	});
});

</script>
</body>
</html>