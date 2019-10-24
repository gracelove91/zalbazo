$(document).ready(function() {
	
	var userEmail = $(".email").val();

	var fhlist = $(".fhlist");
	var fhremove = $(".fhremove");
	// var fhlabel = $(".fhlabel");
			
	showFavoriteList(userEmail);


	function showFavoriteList(userEmail) {
			
		favoriteService.getFavoriteList({userEmail: userEmail}, 
			function(list) {
				var str = "";

				if (list == null || list.length == 0) {
					fhlist.html(str);
					return;
				}

				for (var i = 0, len = list.length || 0; i < len; i++) {
					
					str += "<tr>";
					str += "	<th scope='row' class='mobile' style='width: 150px; text-align:center;'>"+ list[i].hospitalId+ "</th>";

					str += "<td style='width: 600px; text-align: center;'>";
					str += "  <a class='move' style='color : #000000;' href='/hospital/get?hospitalId="
							+ list[i].hospitalId+ "'>" + list[i].name + "</a>";
					str += "</td>";

					str += "<td style='width: 700px; text-align: center;'>";
					str += "  <a class='move' style='color : #000000;'>" + list[i].address + "</a>";
					str += "</td>";

					str += "<td style='width: 300px; text-align: center;'>";
					str += "  <a class='move' style='color : #000000;'>"
							+ list[i].tel + "</a>";
					str += "</td>";

					str += "<td style='width: 350px; text-align: center;'>";

					str += "<a class='move' style='color : #000000;' >";
					str += "<button class='fhremove' data-id='"	+ list[i].fhospitalId+ "'data-bt='btn'>삭제</button>";
					str += "</a></td>";

					str += "</tr>";

			}
			fhlist.html(str);
		});

	}      
		
			
	
	fhlist.on("click", ".fhremove",	function(list, e) {

		var fhospitalId = $(this).attr("data-id");
		
		favoriteService.removeFavorite(fhospitalId, 
			function(result) {
				alert("즐겨찾는 병원이 삭제되었습니다.");
				showFavoriteList(userEmail);
		});

	});
			
	
			
});