$(document).ready(function () {
	
var info = $(".info");
var hospitalId = info.find("input[name='hospitalId']");
var userEmail = info.find("input[name='userEmail']");

var favorite = $("#favorite"); // 즐겨찾기 버튼의 id
var reserve = $("#reserve"); // 예약하기 버튼의 id

var res = $(".res"); // 예약하기 버튼의 클래스
var fav = $(".fav"); // 즐겨찾기 버튼의 클래스


res.on('click','#reserve',function(e){
	location="../reserve?hospitalId="+hospitalId.val();+"&userEmail="+userEmail.val();})  //예약하기 페이지전송

fav.on("click", "#favorite", function(e){
	
	var icon = $(this).attr("data-i");
	/* 아이콘이 흰 하트면.. 검정 하트로 바뀌기 */
	if (icon=="white") {
		
		var str ="";
		
		str += "<i class='material-icons res' id='reserve' style='cursor: pointer;'>event</i> 예약하기";	
		str += "<i class='material-icons fav' data-i='black' id='favorite' style='cursor: pointer;'>favorite</i> 즐겨찾기";

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
		
		str += "<i class='material-icons res' id='reserve' style='cursor: pointer;'>event</i> 예약하기";	
		str += "<i class='material-icons fav' data-i='white' id='favorite' style='cursor: pointer;'>favorite_border</i> 즐겨찾기";

		var info = $(".info");
		var hospitalId = info.find("input[name='hospitalId']"); 


		favoriteService.removeFavorite(hospitalId.val(),
				function(result){ 
				alert("즐겨찾는 병원에서 삭제되었습니다.");
				console.log("즐찾 삭제 성공따리요");

 				}
			);
	}
             
	fav.html(str);
	res.html(str);
});

		
});