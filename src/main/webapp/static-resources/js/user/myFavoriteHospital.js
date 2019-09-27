$(document).ready(function() {
	//console.log("mypage_myfavorite");
	
	var userEmail = '<c:out value="${useremail}"/>';
	var fhlist = $(".fhlist");
	
	myFavoriteHospitalService.getList(userEmail, function(list) {
		
		var str = "";
		
		if(list == null || list.length == 0) {
			return;
		}
		
		for(var i = 0, len = list.length||0; i < len; i++) {
						
          //console.log(list[i]);
			
			str += "<tr>";
			str += "	<th scope='row' class='mobile' style='width: 150px; text-align:center;'>" + list[i].hospitalId + "</th>";
			
			str += "<td style='width: 600px; text-align: center;'>";
			str += "  <a class='move' style='color : #000000;' href='/hospital/get?hospitalId=" + list[i].hospitalId + "'>" + list[i].name + "</a>";
			str += "</td>";
			
			str += "<td style='width: 700px; text-align: center;'>";
			str += "  <a class='move' style='color : #000000;'>" + list[i].address + "</a>";
			str += "</td>";
			
			str += "<td style='width: 300px; text-align: center;'>";
			str += "  <a class='move' style='color : #000000;'>" + list[i].tel + "</a>";
			str += "</td>";
			
			str += "<td style='width: 350px; text-align: center;'>";
			str += "  <a class='move' style='color : #000000;' >"+ 
			"<button class='remove' data-bt='btn'"+" onclick='location.href='remove?hospitalId="
			+list[i].hospitalId+"''>삭제</button>"+"</td></a>";
			str += "</td>";

			str += "</tr>";
		
		} // for
		
		
		
		
		
		
		
		fhlist.html(str);
	});

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	myFavoriteHospitalService.getLabelList(hospitalId, function(list) {
//		
//		var str = "";
//		
//		if(list == null || list.length == 0) {
//			return;
//		}
//		
//		for(var i = 0, len = list.length||0; i < len; i++) {
//	
//				str +=
//				str +=
//				str +=
//				str +=
//				str +=
//				str +=		
//		} 
//		
//		fhlabel.html(str);
//	});
	
});