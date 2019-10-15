$(document).ready(function() {
	console.log("myHospitalReserveService");
	
	var userEmail = '<c:out value="${useremail}"/>';
	
	var myreservelist = $(".myreservelist");
	var countRlist = $(".countR");
		
	var modal = $(".modal");
	var modalInputAname = modal.find("input[id='aname']");
	var modalInputType = modal.find("input[id='type']");
	var modalInputAge = modal.find("input[id='age']");
	var modalInputSex = modal.find("input[id='sex']");
	var modalInputWeight = modal.find("input[id='weight']");
	var modalInputAnimalId = modal.find("input[id='animalId']");
	var modalInputRdate = modal.find("input[id='rdate']");
	var modalInputReserveId = modal.find("input[id='reserveId']");
	var modalInputStatusBefore = modal.find("input[id='진료 전']");
	var modalInputStatusAfter = modal.find("input[id='진료 완료']");
	var modalInputStatus = modal.find("input[id='status']");
	var modalInputNote = modal.find("textarea[id='note']");
	
	var modalStatusBtn = modal.find("button[id='modalStatusBtn']");
	
	var reserveId = $(this).attr("data-no");
		
		MyHospitalReserveService.getHospitalReserveList(userEmail, function(list) {
			
			var str = "";
			var str2 = "";
			
			if(list == null || list.length == 0) {
				myreservelist.html(str);
				return;
			}
			
			$('#my-calendar').on('click', '.day', function(e) {
				var date = $(this).attr('id');
				$('.day').removeClass("selected");
				$(this).addClass("selected");
				
			var countR = 0; // 예약 수
			
			for(var i = 0, len = list.length||0; i < len; i++) {
				var reserveDate = MyHospitalReserveService.displayTime(list[i].rdate).substring(0,10);
				
				
					if(date.toString() == reserveDate) {
						//console.log(list[i]);
						
						countR++;
						
						if(list[i].status == "리뷰 완료") {
							
							str += "<tr>";
							
							str += "<th scope='row' class='mobile' style='width:80px; text-align:center;'>"+ list[i].reserveId +"</th>";
							str += "<td style='text-align: center;'>";
							str += "  <p class='move' style='color : #000000;' href='#'>"+ MyHospitalReserveService.displayTime(list[i].rdate) +"</p>";
							str += "</td>";
							
							str += "<td style='text-align: center;'>";
							str += "  <p class='move' style='color : #000000;'>"+ list[i].aname +"</p>";
							str += "</td>";
							
							str += "<td style='text-align: center;'>";
							str += "  <p class='move' style='color : #000000;'>"+ list[i].userEmail +"</p>";
							str += "</td>";
							
							str += "<td style='text-align: center;'>";
							str += "  <p class='move' style='color : #000000;'>"+ list[i].status +"</p>";
							str += "</td>";
							
							str += "<td style='text-align: center;'>";
							str += "  <p class='move' style='color : #000000;'>";
							str += "  </p>";
							str += "</td>";
							
							str += "<td style='text-align: center;'>";
							str += "  <p class='move' style='color : #000000;'>";
							str += "  </p>";
							str += "</td>";
							
							str += "</tr>";
							
						} else{
							
							str += "<tr>";
							
							str += "<th scope='row' class='mobile' style='width:80px; text-align:center;'>"+ list[i].reserveId +"</th>";
							str += "<td style='text-align: center;'>";
							str += "  <p class='move' style='color : #000000;' href='#'>"+ MyHospitalReserveService.displayTime(list[i].rdate) +"</p>";
							str += "</td>";
							
							str += "<td style='text-align: center;'>";
							str += "  <p class='move' style='color : #000000;'>"+ list[i].aname +"</p>";
							str += "</td>";
							
							str += "<td style='text-align: center;'>";
							str += "  <p class='move' style='color : #000000;'>"+ list[i].userEmail +"</p>";
							str += "</td>";
							
							str += "<td style='text-align: center;'>";
							str += "  <p class='move' style='color : #000000;'>"+ list[i].status +"</p>";
							str += "</td>";
							
							str += "<td style='text-align: center;'>";
							str += "  <p class='move' style='color : #000000;'>";
							str += "  <button class='btn btn-outline-secondary btn-sm status' id='status' data-no='"+ list[i].reserveId +"' style='font-size:15px'>상세보기</button></p>";
							str += "</td>";
							
							str += "<td style='text-align: center;'>";
							str += "  <p class='move' style='color : #000000;'>";
							str += "  <button class='btn btn-outline-danger btn-sm delete' id='delete' data-no='"+ list[i].reserveId +"' style='font-size:15px'>예약삭제</button></p>";
							str += "</td>";
							
							str += "</tr>";
						}
						
					} // 날짜비교
				
			} // for
			myreservelist.html(str);
			
			var reserveDate = MyHospitalReserveService.displayTime(list[0].rdate).substring(0,10);
			console.log(reserveDate);
			console.log(countR);
			
			str2 += "<span style='font-weight:bold;'>총 예약 수 : <span style='font-weight:bold; font-size:20px; color:#04b1fb;'>"+ countR +"건</span></span>";
			countRlist.html(str2);
			
			str = "";
			str2 = "";

			}); // my-calendar click
			
		}); // getHospitalReserveList
		
	
	myreservelist.on("click", ".status", function(list, e) {
		
		var reserveId = $(this).attr("data-no");
		
		//console.log(reserveId);
		
		MyHospitalReserveService.get(reserveId, function(result) {
			
			//console.log(result);
			
			modalInputAname.val(result.aname);
			modalInputAnimalId.val(result.animalId);
			modalInputRdate.val(MyHospitalReserveService.displayTime(result.rdate));
			modalInputReserveId.val(result.reserveId);
			modalInputType.val(result.type);
			modalInputSex.val(result.sex);
			modalInputAge.val(result.age);
			modalInputWeight.val(result.weight);
			modalInputNote.val(result.note);

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
		
	}); // myreservelist status click
	
	myreservelist.on("click", ".delete", function(list, e) {
		var reserveId = $(this).attr("data-no");
		
		//console.log(reserveId);
		
		MyHospitalReserveService.remove(reserveId, function(result) {

			if(result === "success") {
				alert("예약이 삭제 되었습니다.");
	            modal.modal("hide");
	            location.reload();
			}
            
        });
	}); // myreservelist delete click
	
}); // ready