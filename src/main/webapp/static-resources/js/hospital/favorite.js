$(document).ready(function () {
	
var info = $(".info");
var hospitalId = info.find("input[name='hospitalId']");
var userEmail = info.find("input[name='userEmail']");
var h5 = $(".get");

h5.on('click','#reserve',function(e){
	userInfoService.getUser(function(data){
		
		if(data.role === 'user') {
			location="../reserve?hospitalId="+hospitalId.val();+"&userEmail="+userEmail.val();
		} else {
			alert('일반 유저만 가능합니다.');
		}

	}, function(error) {
		alert('로그인이 필요한 서비스입니다.');
		return;
	});
});  //예약하기 페이지전송


h5.on("click", ".favorite", function(e){
	
	var icon = $(this).attr("data-i");
	
	userInfoService.getUser(function(data){
		
		if(data.role === 'user') {
			/* 아이콘이 흰 하트면.. 검정 하트로 바뀌기 */
			if (icon=="white") {
				
				var str ="";
				
				str += "<i class='material-icons' id='reserve' style='cursor: pointer;' href='index'>event</i> 예약하기";	
				str += "<i class='material-icons favorite' data-i='black' id=filled style='cursor: pointer;'>favorite</i> 즐겨찾기";

				var info = $(".info");
				var hospitalId = info.find("input[name='hospitalId']");
				var userEmail = info.find("input[name='userEmail']");

				favoriteService.addFavorite({
					userEmail:userEmail.val(), 
					hospitalId:hospitalId.val()}
						,
						function(result){
							alert("즐겨찾는 병원으로 등록되었습니다.");
							console.log("즐찾 등록 성공따리");

						});

			}

			
			/* 아이콘이 검정 하트면... 빈 하트로 바뀌기 and 삭제되기 */
			if (icon=="black") {
				var str ="";
				
				str += "<i class='material-icons' id='reserve' style='cursor: pointer;'>event</i> 예약하기";	
				str += "<i class='material-icons favorite' data-i='white' id=outlined style='cursor: pointer;'>favorite_border</i> 즐겨찾기";

				var info = $(".info");
				var hospitalId = info.find("input[name='hospitalId']"); 


				favoriteService.removeFavorite(hospitalId.val(),
						function(result){ 
						alert("즐겨찾는 병원에서 삭제되었습니다.");
						console.log("즐찾 삭제 성공따리요");

		 				}
					);
			}
		             
			h5.html(str);
			
		} else {
			alert('일반 유저만 가능합니다.');
		}

	}, function(error) {
		alert('로그인이 필요한 서비스입니다.');
		return;
	});
	
});

		
});