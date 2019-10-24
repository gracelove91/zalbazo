$(document).ready(function() {
	console.log("myreserve");
	
	// 모달
	var modal = $(".modal");	
	var modalInputName = modal.find("input[id='name']");
	var modalInputHospitalId = modal.find("input[id='hospitalId']");
	var modalInputRdate = modal.find("input[id='rdate']");
	var modalInputAname = modal.find("input[id='aname']");
	var modalReviewDate = modal.find("input[id='reviewDate']");
	var modalInputReserveId = modal.find("input[id='reserveId']");
	var modalInputuserEmail = modal.find("input[id='userEmail']");
	var modalInputReview = modal.find("textarea[id='review']");
	var modalInputStars = modal.find("i[id='stars']");
	
	// 모달 내 리뷰 작성 버튼
	var modalReviewBtn = modal.find("button[id='modalReviewBtn']");
	
	// 모달 내 별점
	var starUL = $(".stars");
	
	var userEmail = '<c:out value="${useremail}"/>';
	
	var myreservelist = $(".myreservelist");
	
	myReserveService.getReserveList(userEmail, function(list) {
		var str = "";
		
		if(list == null || list.length == 0) {
			myreservelist.html(str);
			return;
		}
		
		for(var i = 0, len = list.length||0; i < len; i++) {
			//console.log(myReserveService.displayTime(list[i].rdate));
			//console.log(list[i]);
			
			if(list[i].status != "진료 완료") {
				
				str += "<tr>";
		        str += " <th scope='row' class='mobile' style='width:80px; text-align:center;'>" + list[i].reserveId + "</th>";
		        str += "	<td style='text-align: center;'><a class='move' style='color : #000000;' href='/hospital/get?hospitalId="+ list[i].hospitalId +"'>"+ list[i].name +"</a></td>";
		        str += "	<td style='text-align: center;'>"+ myReserveService.displayTime(list[i].rdate) +"</td>";
		        str += "	<td style='text-align: center;'>"+ list[i].aname +"</td>";
		        str += "	<td style='text-align: center;'>"+ list[i].status +"</td>";
		        str += "	<td style='text-align: center;'><a class='move' style='color : #000000;'>";
/*		        str += "  	<button class='review' id='review' data-id='" + list[i].status + "' data-no='" + list[i].reserveId + "' style='font-size:14px'>리뷰 쓰기</button></a></td>";*/
		        str += "</tr>";
				
			} else {
				
	        str += "<tr>";
	        str += " <th scope='row' class='mobile' style='width:80px; text-align:center;'>" + list[i].reserveId + "</th>";
	        str += "	<td style='text-align: center;'><a class='move' style='color : #000000;' href='/hospital/get?hospitalId="+ list[i].hospitalId +"'>"+ list[i].name +"</a></td>";
	        str += "	<td style='text-align: center;'>"+ myReserveService.displayTime(list[i].rdate) +"</td>";
	        str += "	<td style='text-align: center;'>"+ list[i].aname +"</td>";
	        str += "	<td style='text-align: center;'>"+ list[i].status +"</td>";
	        str += "	<td style='text-align: center;'><a class='move' style='color : #000000;'>";
	        str += "  	<button class='review' id='review' data-id='" + list[i].status + "' data-no='" + list[i].reserveId + "' style='font-size:14px'>리뷰 쓰기</button></a></td>";
	        str += "</tr>";
	        
			}
		}
		
		myreservelist.html(str);
	
	}); // getReserveList
	
	myreservelist.on("click", ".review", function(list, e) {
		
		var status = $(this).attr("data-id");
		var reserveId = $(this).attr("data-no");
		
		if(status != "진료 완료") {
			alert("진료 완료 후, 리뷰 작성이 가능합니다.");
			
		} else {
			
			myReserveService.get(reserveId, function(result) {
				
				console.log(result.reserveId);
				console.log(reserveId);
				
				modalInputName.val(result.name);
				modalInputHospitalId.val(result.hospitalId);
				modalInputRdate.val(myReserveService.displayTime(result.rdate));
				modalInputAname.val(result.aname);
				
		 		starUL.on("click", ".star", function(e) {
		 			var star = $(this).attr("data-star");
		 			
		 			if(star == 1) {
		 				
		 				str = "";

		 	 			str += "<i class='material-icons star' id='star1' name='star1' data-star='1'>star</i>";
		 	 			str += "<i class='material-icons star' id='star2' name='star2' data-star='2'>star_border</i>";
		 	 			str += "<i class='material-icons star' id='star3' name='star3' data-star='3'>star_border</i>";
		 	 			str += "<i class='material-icons star' id='star4' name='star4' data-star='4'>star_border</i>";
		 	 			str += "<i class='material-icons star' id='star5' name='star5' data-star='5'>star_border</i>";

		 	 			starUL.html(str);
		 	 			modalInputStars = "1";
		 	 					
		 			} else if(star == 2) {
		 				
		 				str = "";

		 	 			str += "<i class='material-icons star' id='star1' name='star1' data-star='1'>star</i>";
		 	 			str += "<i class='material-icons star' id='star2' name='star2' data-star='2'>star</i>";
		 	 			str += "<i class='material-icons star' id='star3' name='star3' data-star='3'>star_border</i>";
		 	 			str += "<i class='material-icons star' id='star4' name='star4' data-star='4'>star_border</i>";
		 	 			str += "<i class='material-icons star' id='star5' name='star5' data-star='5'>star_border</i>";

		 	 			starUL.html(str);
		 	 			modalInputStars = "2";
		 				
		 			} else if(star == 3) {
		 				
		 				str = "";

		 	 			str += "<i class='material-icons star' id='star1' name='star1' data-star='1'>star</i>";
		 	 			str += "<i class='material-icons star' id='star2' name='star2' data-star='2'>star</i>";
		 	 			str += "<i class='material-icons star' id='star3' name='star3' data-star='3'>star</i>";
		 	 			str += "<i class='material-icons star' id='star4' name='star4' data-star='4'>star_border</i>";
		 	 			str += "<i class='material-icons star' id='star5' name='star5' data-star='5'>star_border</i>";

		 	 			starUL.html(str);
		 	 			modalInputStars = "3";
		 	 			
		 			} else if(star == 4) {
		 				
		 				str = "";

		 	 			str += "<i class='material-icons star' id='star1' name='star1' data-star='1'>star</i>";
		 	 			str += "<i class='material-icons star' id='star2' name='star2' data-star='2'>star</i>";
		 	 			str += "<i class='material-icons star' id='star3' name='star3' data-star='3'>star</i>";
		 	 			str += "<i class='material-icons star' id='star4' name='star4' data-star='4'>star</i>";
		 	 			str += "<i class='material-icons star' id='star5' name='star5' data-star='5'>star_border</i>";

		 	 			starUL.html(str);
		 	 			modalInputStars = "4";
		 				
		 			} else if(star == 5) {
		 				
		 				str = "";

		 	 			str += "<i class='material-icons star' id='star1' name='star1' data-star='1'>star</i>";
		 	 			str += "<i class='material-icons star' id='star2' name='star2' data-star='2'>star</i>";
		 	 			str += "<i class='material-icons star' id='star3' name='star3' data-star='3'>star</i>";
		 	 			str += "<i class='material-icons star' id='star4' name='star4' data-star='4'>star</i>";
		 	 			str += "<i class='material-icons star' id='star5' name='star5' data-star='5'>star</i>";

		 	 			starUL.html(str);
		 	 			modalInputStars = "5";
		 				
		 			}
		 			
		 			console.log(modalInputStars);
		 		}); // 별점
		 		
		 		modalReviewBtn.on("click", function (e) {
		 			
		 			if(modalInputReview.val().trim() === "" || modalInputReview.val().length < 10) {
						alert("10자 이상만 등록 가능합니다");
						return;
					}
		 			
		 			if(Number(modalInputStars) != 1 && Number(modalInputStars) != 2 && Number(modalInputStars) != 3 && Number(modalInputStars) != 4 && Number(modalInputStars) != 5) {
						alert("별점이 없습니다");
						return;
					}
		 			
		 			myReserveService.insertReview(
		 					{body:modalInputReview.val(), userEmail:modalInputuserEmail.val(), starPoint:Number(modalInputStars), hospitalId:modalInputHospitalId.val()}
		 		 			,
		 		 			function(result) {
		 		 				
		 		 				alert("리뷰가 등록되었습니다.");
		 		 				
		 		 				// textarea 리셋
		 		 	            $(".txt").val('');
		 		 				
		 		 	           var str = "";

		 		 	 			str += "<i class='material-icons star' id='star1' name='star1' data-star='1'>star_border</i>";
		 		 	 			str += "<i class='material-icons star' id='star2' name='star2' data-star='2'>star_border</i>";
		 		 	 			str += "<i class='material-icons star' id='star3' name='star3' data-star='3'>star_border</i>";
		 		 	 			str += "<i class='material-icons star' id='star4' name='star4' data-star='4'>star_border</i>";
		 		 	 			str += "<i class='material-icons star' id='star5' name='star5' data-star='5'>star_border</i>";

		 		 	 			starUL.html(str);
		 		 	 			
		 						var rrr = {status : '리뷰 완료', reserveId : reserveId};
		 						
		 						// 여기서부터 update
		 						myReserveService.update(rrr, function(result) {
		 							
		 							if(result === "success") {
		 								modal.modal("hide");
		 								location.reload();
		 							}
		 							
		 						}); // update
		 		 			}
		 	 			); // insert
		 			
		 		}); // modalReviewBtn
				
				modal.modal("show");
			});
			
		}
		
	});
	
}); // function