$(document).ready(function() {
	
	var userEmail = '<c:out value="${useremail}"/>';
	
	var info = $(".infoinfo");
	
	myInfoService.getInfoList(userEmail, function(list){
		
		var str = "";
		
		for(var i = 0, len = list.length||0; i<len; i++) {
			
 			str += "<div class='form-group'>";
			str += "  <span>이메일</span>";
			str += "  <input type='text' class='form-control col-10' id='email' value='" + list[i].userEmail + "' readonly>";
			str += "</div>";
			
 			str += "<div class='form-group'>";
			str += "  <span>이름</span>";
			str += "  <input type='text' class='form-control col-10' id='name' value='" + list[i].name + "'>";
			str += "</div>";
			
 			str += "<div class='form-group'>";
			str += "  <span>전화번호</span>";
			str += "  <input type='text' class='form-control col-10' id='tel' value='" + list[i].tel + "'>";
			str += "</div>";

 			str += "<div class='form-group'>";
			str += "  <span>주소</span>";
			str += "  <input type='text' class='form-control col-10' id='address' value='" + list[i].address + "' readonly>";
			str += "  <input type='button' onClick='goPopup();' value='주소찾기'/>";
			str += "</div>";

 			str += "<div class='form-group'>";
			str += "  <span>가입일</span>";
			str += "  <input type='text' class='form-control col-10' id='joinDate' value='" + myInfoService.displayTime(list[i].joinDate) + "'readonly>";
			str += "</div>";

		}
		
		info.html(str);
	});
});