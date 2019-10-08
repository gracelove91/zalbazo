$(document).ready(function() {
	console.log("myHospitalReserveService");
	
	var userEmail = '<c:out value="${useremail}"/>';
	
	var myreservelist = $(".myreservelist");
		
	var modal = $(".modal");
	var modalInputAname = modal.find("input[id='aname']");
	var modalInputAnimalId = modal.find("input[id='animalId']");
	var modalInputRdate = modal.find("input[id='rdate']");
	var modalInputReserveId = modal.find("input[id='reserveId']");
	var modalInputStatusBefore = modal.find("input[id='진료 전']");
	var modalInputStatusAfter = modal.find("input[id='진료 완료']");
	var modalInputStatus = modal.find("input[id='status']");
	
	var modalStatusBtn = modal.find("button[id='modalStatusBtn']");
	
	var reserveId = $(this).attr("data-no");
	
	showList(userEmail);
	
	function showList(userEmail) {
		
		MyHospitalReserveService.getHospitalReserveList(userEmail, function(list) {
			
			var str = "";
			
			if(list == null || list.length == 0) {
				str = "";
				return;
			}
			
			for(var i = 0, len = list.length||0; i < len; i++) {
				console.log(list[i]);
				
				if(list[i].status == "리뷰 완료") {
					
					str += "<tr>";
					
					str += "<th scope='row' class='mobile' style='width:80px; text-align:center;'>"+ list[i].reserveId +"</th>";
					str += "<td style='text-align: center;'>";
					str += "  <a class='move' style='color : #000000;' href='#'>"+ MyHospitalReserveService.displayTime(list[i].rdate) +"</a>";
					str += "</td>";
					
					str += "<td style='text-align: center;'>";
					str += "  <a class='move' style='color : #000000;'>"+ list[i].aname +"</a>";
					str += "</td>";
					
					str += "<td style='text-align: center;'>";
					str += "  <a class='move' style='color : #000000;'>"+ list[i].age +"</a>";
					str += "</td>";					

					str += "<td style='text-align: center;'>";
					str += "  <a class='move' style='color : #000000;'>"+ list[i].sex +"</a>";
					str += "</td>";	
					
					str += "<td style='text-align: center;'>";
					str += "  <a class='move' style='color : #000000;'>"+ list[i].type +"</a>";
					str += "</td>";						
					
					str += "<td style='text-align: center;'>";
					str += "  <a class='move' style='color : #000000;'>"+ list[i].userEmail +"</a>";
					str += "</td>";
					
					str += "<td style='text-align: center;'>";
					str += "  <a class='move' style='color : #000000;'>"+ list[i].status +"</a>";
					str += "</td>";
					
					str += "<td style='text-align: center;'>";
					str += "  <a class='move' style='color : #000000;'>";
/*					str += "  <button class='status' id='status' data-no='"+ list[i].reserveId +"' style='font-size:14px'>상태 변경</button></a>";*/
					str += "</td>";
					
					str += "</tr>";
					
				} else{
					
				str += "<tr>";
				
				str += "<th scope='row' class='mobile' style='width:80px; text-align:center;'>"+ list[i].reserveId +"</th>";
				str += "<td style='text-align: center;'>";
				str += "  <a class='move' style='color : #000000;' href='#'>"+ MyHospitalReserveService.displayTime(list[i].rdate) +"</a>";
				str += "</td>";
				
				str += "<td style='text-align: center;'>";
				str += "  <a class='move' style='color : #000000;'>"+ list[i].aname +"</a>";
				str += "</td>";
				
				str += "<td style='text-align: center;'>";
				str += "  <a class='move' style='color : #000000;'>"+ list[i].age +"</a>";
				str += "</td>";					

				str += "<td style='text-align: center;'>";
				str += "  <a class='move' style='color : #000000;'>"+ list[i].sex +"</a>";
				str += "</td>";	
				
				str += "<td style='text-align: center;'>";
				str += "  <a class='move' style='color : #000000;'>"+ list[i].type +"</a>";
				str += "</td>";		
				
				str += "<td style='text-align: center;'>";
				str += "  <a class='move' style='color : #000000;'>"+ list[i].userEmail +"</a>";
				str += "</td>";
				
				str += "<td style='text-align: center;'>";
				str += "  <a class='move' style='color : #000000;'>"+ list[i].status +"</a>";
				str += "</td>";
				
				str += "<td style='text-align: center;'>";
				str += "  <a class='move' style='color : #000000;'>";
				str += "  <button class='status' id='status' data-no='"+ list[i].reserveId +"' style='font-size:14px'>상태 변경</button></a>";
				str += "</td>";
				
				str += "</tr>";
				}
				
			} // for
			
			myreservelist.html(str);
			
		}); // getHospitalReserveList
		
	} // showList
	
	myreservelist.on("click", ".status", function(list, e) {
		
		var reserveId = $(this).attr("data-no");
		
		console.log(reserveId);
		
		MyHospitalReserveService.get(reserveId, function(result) {
			
//			동물이름, 동물id, 예약시간, 예약번호, status
			
			modalInputAname.val(result.aname);
			modalInputAnimalId.val(result.animalId);
			modalInputRdate.val(MyHospitalReserveService.displayTime(result.rdate));
			modalInputReserveId.val(result.reserveId);

			if(modalInputStatus.val(result.status).val() == "진료 전") {
				modalInputStatusBefore.prop("checked", true);
				modalInputStatusAfter.prop("checked", false);
			} else {
				modalInputStatusBefore.prop("checked", false);
				modalInputStatusAfter.prop("checked", true);
			}
			
			modalInputStatusBefore.click(function(e) {
				modalInputStatus.val("진료 전");
				modalInputStatusBefore.prop("checked", true);
				modalInputStatusAfter.prop("checked", false);
			});
			
			modalInputStatusAfter.click(function(e) {
				modalInputStatus.val("진료 완료");
				modalInputStatusBefore.prop("checked", false);
				modalInputStatusAfter.prop("checked", true);
			});
			
			
			modalStatusBtn.on("click", function (e) {
				
				if(modalInputStatus.val() == null || modalInputStatus.val().trim() == "") {
					alert("진료 상태를 선택해주세요.");
					return;
				}
				
				var rrr = {status : modalInputStatus.val(), reserveId : modalInputReserveId.val()};
				
				// 여기서부터 update
				MyHospitalReserveService.update(rrr, function(result) {
					
					if(result === "success") {
						alert("진료 상태가 수정되었습니다.");	
					}
					
					modal.modal("hide");
					location.reload();
					
				}); // update
				
			}); // 상태버튼 클릭
			
		}); // get
		
		modal.modal("show");
		
	}); // myreservelist click
	
}); // ready