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
						
          if(list[i].note == null) {
        	  list[i].note = "";
          };
          
			
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
					str += "  <a class='move' style='color : #000000;'>" + list[i].weight +" kg </a>";
					str += "</td>";
					str += "<td style='width: 300px; text-align: center;'>";
					str += "  <a class='move' style='color : #000000;'>" + list[i].age + " 살</a>";
					str += "</td>";
					str += "<td style='width: 700px; text-align: center;'>";
					str += "  <a class='move' style='color : #000000;'>" + list[i].note + "</a>";
					str += "</td>";
					str += "<td style='width: 350px; text-align: center;'>";
					str += "<a class='move' style='color : #000000;' >";
					str += "<button class='modify' id='modify' onclick="+"location.href='/user/mypage/animal/modify?id="+list[i].animalId+"'>수정</button></a>";
					str += "<a class='move' style='color : #000000;' >";
					str += "<button class='remove' id='remove'>삭제</button></a>";
					str += "</td>"
					str += "</tr>";
			
				} // for
		
		fhlist.html(str);
		});
	}

	$(document).on("click",".remove",function() {
		$.ajax({
			url: '/user/mypage/animal/remove',
			type : 'post',
			data : {id : this.parentElement.parentElement.parentElement.children[0].innerText},
			success: function(result){
				showList(userEmail);
				alert('삭제되었습니다');
			}
			
		}); 
		});
	
	
	
}); // function end