$(document).ready(function() {
	//console.log("mypage_myfavorite");
	
	var userEmail = '<c:out value="${useremail}"/>';
	var fhlist = $("#animalt");

	 showList(userEmail);
	
	function showList(userEmail) {
		myAnimalService.getList(userEmail, function(list) {
		
		var str = "";
		
			if(list == null || list.length == 0) {
			return;
			}
		
				for(var i = 0, len = list.length||0; i < len; i++) {
						
					console.log(list[i]);
			
					str += "<tr>";
					str += "	<th scope='row' class='mobile' style='width: 150px; text-align:center;'>" + list[i].animalId + "</th>";
			
		
					str += "<td style='width: 300px; text-align: center;'>";
					str += "  <a class='move' style='color : #000000;'>" + list[i].aname + "</a>";
					str += "</td>";
					str += "<td style='width: 300px; text-align: center;'>";
					str += "  <a class='move' style='color : #000000;'>" + list[i].type + "</a>";
					str += "</td>";
					str += "<td style='width: 300px; text-align: center;'>";
					str += " <a class='move' style='color : #000000;'>" + list[i].sex + "</a>";
					str += "</td>";
					str += "<td style='width: 300px; text-align: center;'>";
					str += "  <a class='move' style='color : #000000;'>" + list[i].weight + "</a>";
					str += "</td>";
					str += "<td style='width: 300px; text-align: center;'>";
					str += "  <a class='move' style='color : #000000;'>" + list[i].age + "</a>";
					str += "</td>";
					str += "<td style='width: 700px; text-align: center;'>";
					str += "  <a class='move' style='color : #000000;'>" + list[i].note + "</a>";
					str += "</td>";
					str += "<td style='width: 350px; text-align: center;'>";
					str += "<a class='move' style='color : #000000;' >";
					str += "<button class='remove' id='remove' onclick="+"location.href='/user/mypage/animal/remove?id="+list[i].animalId+"'>삭제</button></a>";
					str += "</td>"
					str += "</tr>";
			
				} // for
		
		fhlist.html(str);
		});
	}

	
}); // function end