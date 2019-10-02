$(document).ready(function() {
			console.log("mypage_myfavorite");
			var userEmail = '<c:out value="${useremail}"/>';
			// var hh = '<c:out value="${hospitalId}"/>';

			var fhlist = $(".fhlist");
			var fhremove = $(".fhremove");
			// var fhlabel = $(".fhlabel");
			
			 showList(userEmail);

		function showList(userEmail) {
			
			myFavoriteHospitalService.getList(userEmail, 
					function(list) {

						var str = "";

						if (list == null || list.length == 0) {
							fhlist.html(str);
							return;
						}

						for (var i = 0, len = list.length || 0; i < len; i++) {

							console.log(list[i]);

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
							str += "<button class='fhremove' data-id='"
									+ list[i].hospitalId+ "'data-bt='btn'>삭제</button>";
							str += "</a></td>";

							str += "</tr>";

					}
					fhlist.html(str);
										
			});

		}      
			
		
			
			fhlist.on("click", ".fhremove",	function(list, e) {

				var hospitalId = $(this).attr("data-id");
				
				myFavoriteHospitalService.removeMyFavorite(
						hospitalId, function(removeResult) {
							alert("즐겨찾는 병원이 삭제되었습니다.");
							console.log("즐찾 삭제 성공쓰");
							showList(userEmail);
				});

			});
});