<%--
  Created by IntelliJ IDEA.
  User: govlmo91
  Date: 2019-08-25
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
	String ctx = request.getContextPath();
	pageContext.setAttribute("ctx", ctx);
%>
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

<title>uploadAjax</title>
</head>
<body>

	<h1>피카츄가 세상을 지배한다</h1>
	<img src="${ctx}/resources/img/pika.gif">

	<div class='uploadDiv'>
		<input type='file' name='uploadFile' multiple>
	</div>
	<button id='uploadBtn'>Upload</button>
	
	<div class='uploadResult'>
		<ul>
		</ul>
	</div>

	<div class='bigPictureWrapper'>
		<div class='bigPicture'>
		</div>
	</div>

	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<script>
	
	function showImage(fileCallPath) {
		// alert(fileCallPath);
			
		$(".bigPictureWrapper").css("display", "flex").show();
			
		$(".bigPicture")
		.html("<img src='/display?fileName="+encodeURI(fileCallPath)+"'>")
		.animate({width:'100%', height:'100%'}, 1000);
		
		$(".bigPictureWrapper").on("click", function(e){
			$(".bigPicture").animate({width:'0%', height:'0%'}, 1000);
			setTimeout(() => { $(this).hide();}, 1000);
		}); //bigPictureWrapper

	}
		$(document).ready(function() {
			
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
			
			var uploadResult = $(".uploadResult ul");

			function showUploadedFile(uploadResultArr) {

				var str = "";
				
				$(uploadResultArr).each(function(i, obj) {
					
					if(!obj.image) {
						
						var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
						
						var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
						
						str += "<li><div><a href='/download?fileName="+fileCallPath+"'>"
							+"<img src='/resources/img/attach.png'>"+obj.fileName+"</a>"
							+"<span data-file=\'"+fileCallPath+"\' data-type='file'>x</span>"+"</div></li>";
								
					} else {

						var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
						
						var originPath = obj.uploadPath+"\\"+obj.uuid +"_"+obj.fileName;
						
						originPath = originPath.replace(new RegExp(/\\/g), "/");
						
						str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\">"
						+"<img src='display?fileName="+fileCallPath+"'></a>"
						+"<span data-file=\'"+fileCallPath+"\' data-type='image'>x</span>"+"</li>";

					}
				});
				
				uploadResult.append(str);
			}
			
			$(".uploadResult").on("click", "span", function(e){
				
				var targetFile = $(this).data("file");
				var type = $(this).data("type");
				console.log(targetFile);
				
				$.ajax({
					url : '/deleteFile',
					data : {fileName:targetFile, type:type},
					dataType : 'text',
					type : 'POST',
						success : function(result) {
							alert(result);
						}
				}); // ajax
			}); // uploadResult
				
			
			var cloneObj = $(".uploadDiv").clone();
			
			$("#uploadBtn").on("click", function(e) {

				var formData = new FormData();

				var inputFile = $("input[name='uploadFile']");

				var files = inputFile[0].files;

				console.log(files);
				
				// add filedate to formdata
				for (var i = 0; i < files.length; i++) {

					if (!checkExtension(files[i].name, files[i].size)) {
						return false;
					}

					formData.append("uploadFile", files[i]);
				}
				
				$.ajax({
					url : '/uploadAjaxAction',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					dataType : 'json',
					success : function(result) {
						
						console.log(result);
						
						showUploadedFile(result);
						
						$(".uploadDiv").html(cloneObj.html());
					}
				}); // $.ajax
				
			});
		});
	</script>

</body>
</html>
