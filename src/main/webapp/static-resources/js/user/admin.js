$(document).ready(function() {
	
	var userList = $(".userList");
	var userview = $("#userview");
	var hosview = $("#hosview");
	var hospitalList = $(".hospitalList");
	
	var refreshUser = $(".refreshUser");
	var refreshHos = $(".refreshHos");
	
	var str1 = "";
	var str2 = "";
	
	showUserList();
	showHosList();
	
	refreshUser.on("click",function(e) {
		showUserList();
	});
	
	refreshHos.on("click", function(e) {
		showHosList();
	});
	
	function showUserList(){
		adminService.getUserList(function(list) {
			
			for(var i = 0, len = list.length||0; i < len; i++) {
				//console.log(list[i]);
				
				str1 += "<tr>";
				str1 += "<th scope='row' class='mobile' style='text-align:center;'>" + list[i].name + "</th>";
				
				str1 += "<td class='move' style='text-align:center;'>" + list[i].userEmail + "</td>";
				str1 += "<td class='move' style='text-align:center;'>" + list[i].tel + "</td>";
				str1 += "<td class='move' style='text-align:center;'>" + adminService.displayTime(list[i].joinDate) + "</td>";
				str1 += "<td style='text-align:center;'><button class='btn btn-outline-secondary btn-sm removeUser' data-id='"+ list[i].userEmail+"'>X</button></td>";
				
				str1 += "</tr>";
			} // for
			
			userList.html(str1);
			str1 = "";
		}); // getUserList
	}
	
	userList.on("click", ".removeUser", function(list, e) {
		
		var userEmail = $(this).attr("data-id");
		var yes = confirm(userEmail + "의 모든 정보를 삭제하시겠습니까?");
		
		if(yes) {
			adminService.getUser(userEmail, function(result){
				alert("유저 삭제가 완료되었습니다");
				showUserList();
			}, function(error){
				console.log('에러에러');
			});
			
		}
		
	}); // 유저 삭제 버튼 클릭
	
	
	function showHosList(){
		adminService.getHosList(function(list) {
			
			for(var i = 0, len = list.length||0; i < len; i++) {
				//console.log(list[i]);
				
				str2 += "<tr>";
				
				str2 += "<th scope='row' class='mobile' style='text-align:center;'><a href='/hospital/get?hospitalId=" + list[i].hospitalId + "'>" + list[i].name + "</a></th>";
				str2 += "<td class='move' style='text-align:center;'>" + list[i].userEmail + "</td>";
				str2 += "<td class='move' style='text-align:center;'>" + list[i].tel + "</td>";
				str2 += "<td class='move' style='text-align:center;width:350px;'>" + list[i].address + "</td>";
				str2 += "<td style='text-align:center;width:60px;'><button class='btn btn-outline-secondary btn-sm removeHos' data-id='"+ list[i].userEmail+"'>X</button></td>";
				
				str2 += "</tr>";
			} // for
			
			hospitalList.html(str2);
			str2 = "";
		}); // getHosList
	}
	
	hospitalList.on("click", ".removeHos", function(list, e) {
		
		var hoshos = $(this).attr("data-id");
		var yes = confirm("병원 " + hoshos + "의 모든 정보를 삭제하시겠습니까?");
		
		if(yes) {
			
			adminService.getHos(hoshos, function(result){
				alert("병원 삭제가 완료되었습니다");
				//location.reload();
				showHosList();
			}, function(error){
				console.log('에러에러');
			});
			
		}
		
	}); // 병원 삭제 버튼 클릭
	
	userview.on("click","#userbtn",function(){
		
		$.ajax({
			type : "GET",
			url : "/admin/getsearchuser",
			error : function(error){
				
			},
			data : {"userEmail" : $('#searchuserEmail').val()}  ,
			dataType : 'json',
			success : function(result){
				var str1 = "";
				str1 += "<tr>";
				str1 += "<th scope='row' class='mobile' style='text-align:center;'>" + result.name + "</th>";
				
				str1 += "<td class='move' style='text-align:center;'>" + result.userEmail + "</td>";
				str1 += "<td class='move' style='text-align:center;'>" + result.tel + "</td>";
				str1 += "<td class='move' style='text-align:center;'>" + adminService.displayTime(result.joinDate) + "</td>";
				str1 += "<td style='text-align:center;'><button class='btn btn-outline-secondary btn-sm removeUser' data-id='"+ result.userEmail+"'>X</button></td>";
				
				str1 += "</tr>";
				userList.html(str1);
				$('#searchuserEmail').val("");
			}
			
			
		});
		
		});
	
	hosview.on("click","#hosbtn",function(){
		
		$.ajax({
			type : "GET",
			url : "/admin/getsearchhos",
			error : function(error){
				
			},
			data : {"userEmail" : $('#searchhosEmail').val()}  ,
			dataType : 'json',
			success : function(result){
				var str2 = "";
				str2 += "<tr>";
				
				str2 += "<th scope='row' class='mobile' style='text-align:center;'><a href='/hospital/get?hospitalId=" + result.hospitalId + "'>" + result.name + "</a></th>";
				str2 += "<td class='move' style='text-align:center;'>" + result.userEmail + "</td>";
				str2 += "<td class='move' style='text-align:center;'>" + result.tel + "</td>";
				str2 += "<td class='move' style='text-align:center;width:350px;'>" + result.address + "</td>";
				str2 += "<td style='text-align:center;width:60px;'><button class='btn btn-outline-secondary btn-sm removeHos' data-id='"+ result.userEmail+"'>X</button></td>";
				
				str2 += "</tr>";
				hospitalList.html(str2);
				$('#searchhosEmail').val("");
			}
			
			
		});
		
	});
	
}); // ready