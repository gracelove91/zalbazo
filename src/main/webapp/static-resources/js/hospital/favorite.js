$(document).ready(function () {
	
var info = $(".info");
var userEmail = info.find("input[name='userEmail']");
var hospitalId = info.find("input[name='hospitalId']");
var h5 = $(".get");

// 로그인한 유저의 favorite 목록 중에 해당 병원이 있다면 검은 하트 출력 
userInfoService.getUser(function(data) {
	
	if(data.role === 'user'){
		
		favoriteService.getFavoriteList({userEmail: userEmail.val()}, 
			function(list) {
				var str = "";
				
				for (var i = 0, len = list.length || 0; i < len; i++) {
					
					if(list[i].hospitalId == hospitalId.val()) {
						
						str += "<i class='material-icons' id='reserve' style='cursor: pointer; font-size: 200%; vertical-align: text-bottom;' href='index'>event</i> 예약하기 ";
						str += "<img class='favorite' data-i='black' id=filled style='cursor: pointer; vertical-align: text-bottom;' src='/resources/img/pink_filled_heart.png' width='43px' height='43px'> 즐겨찾기";
						
						h5.html(str);
						break;
					}
				}
		});
		
	}

	
}, function(error){
	console.log('일반회원 아님');
});



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
				
				favoriteService.toFullHeart({
					userEmail:userEmail.val(), 
					hospitalId:hospitalId.val()}
						,
						function(result){
							alert("즐겨찾는 병원으로 등록되었습니다.");
							console.log("즐찾 등록 성공따리");

							str += "<i class='material-icons' id='reserve' style='cursor: pointer; font-size: 200%; vertical-align: text-bottom;' href='index'>event</i> 예약하기 ";
							str += "<img class='favorite' data-i='black' id=filled style='cursor: pointer; vertical-align: text-bottom;' src='/resources/img/pink_filled_heart.png' width='43px' height='43px'> 즐겨찾기";
							
							h5.html(str);
							
						});
				

			}

			
			/* 아이콘이 검정 하트면... 삭제 성공하고 빈 하트로 바뀜 */
			if (icon=="black") {
				var str ="";
				
				favoriteService.toEmptyHeart(hospitalId.val(),
					function(result){
						console.log(result);
					
						alert("즐겨찾는 병원에서 삭제되었습니다.");
						
						str += "<i class='material-icons' id='reserve' style='cursor: pointer; font-size: 200%; vertical-align: text-bottom;'>event</i> 예약하기 ";	
						str += "<img class='favorite' data-i='white' id=outlined style='cursor: pointer; vertical-align: text-bottom;' src='/resources/img/pink_outlined_heart.png' width='43px' height='43px'> 즐겨찾기";
						h5.html(str);
				});
				
			}
		             
			
			
		} else {
			alert('일반 유저만 가능합니다.');
		}

	}, function(error) {
		alert('로그인이 필요한 서비스입니다.');
		return;
	});
	
});

		
});