	$(document).ready(function(){
		
		var info = $(".info");
        var hospitalId = info.find("input[name='hospitalId']");

		var reviewUL = $(".review");
		var rateUL = $(".rate");
		
		var user = info.find("input[name='userEmail']");
        var reviewBody = info.find("textarea[name='review']");
		
 		var reviewBtn = $("#reviewBtn");
 		
 		var starUL = $(".stars");
 		
 		var starPoint = info.find("i[name='stars']");

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
 	 			starPoint = "1";
 	 					
 			} else if(star == 2) {
 				
 				str = "";

 	 			str += "<i class='material-icons star' id='star1' name='star1' data-star='1'>star</i>";
 	 			str += "<i class='material-icons star' id='star2' name='star2' data-star='2'>star</i>";
 	 			str += "<i class='material-icons star' id='star3' name='star3' data-star='3'>star_border</i>";
 	 			str += "<i class='material-icons star' id='star4' name='star4' data-star='4'>star_border</i>";
 	 			str += "<i class='material-icons star' id='star5' name='star5' data-star='5'>star_border</i>";

 	 			starUL.html(str);
 	 			starPoint = "2";
 				
 			} else if(star == 3) {
 				
 				str = "";

 	 			str += "<i class='material-icons star' id='star1' name='star1' data-star='1'>star</i>";
 	 			str += "<i class='material-icons star' id='star2' name='star2' data-star='2'>star</i>";
 	 			str += "<i class='material-icons star' id='star3' name='star3' data-star='3'>star</i>";
 	 			str += "<i class='material-icons star' id='star4' name='star4' data-star='4'>star_border</i>";
 	 			str += "<i class='material-icons star' id='star5' name='star5' data-star='5'>star_border</i>";

 	 			starUL.html(str);
 	 			starPoint = "3";
 	 			
 			} else if(star == 4) {
 				
 				str = "";

 	 			str += "<i class='material-icons star' id='star1' name='star1' data-star='1'>star</i>";
 	 			str += "<i class='material-icons star' id='star2' name='star2' data-star='2'>star</i>";
 	 			str += "<i class='material-icons star' id='star3' name='star3' data-star='3'>star</i>";
 	 			str += "<i class='material-icons star' id='star4' name='star4' data-star='4'>star</i>";
 	 			str += "<i class='material-icons star' id='star5' name='star5' data-star='5'>star_border</i>";

 	 			starUL.html(str);
 	 			starPoint = "4";
 				
 			} else if(star == 5) {
 				
 				str = "";

 	 			str += "<i class='material-icons star' id='star1' name='star1' data-star='1'>star</i>";
 	 			str += "<i class='material-icons star' id='star2' name='star2' data-star='2'>star</i>";
 	 			str += "<i class='material-icons star' id='star3' name='star3' data-star='3'>star</i>";
 	 			str += "<i class='material-icons star' id='star4' name='star4' data-star='4'>star</i>";
 	 			str += "<i class='material-icons star' id='star5' name='star5' data-star='5'>star</i>";

 	 			starUL.html(str);
 	 			starPoint = "5";
 				
 			}
 			
 			console.log(starPoint);
 		}); // 별점

 		reviewBtn.on("click", function (e) {
			if(reviewBody.val().trim() === "" || reviewBody.val().length < 10) {
				alert("10자 이상만 등록 가능합니다");
				return;
			}
			if(Number(starPoint) != 1 && Number(starPoint) != 2 && Number(starPoint) != 3 && Number(starPoint) != 4 && Number(starPoint) != 5) {
				alert("별점이 없습니다");
				return;
			}
 			alert("리뷰등록");
 			
 			reviewService.addReview(
	 			{body:reviewBody.val(), userEmail:user.val(), starPoint:Number(starPoint), hospitalId:hospitalId.val()}
	 			,
	 			function(result) {
	 				alert("Result : "+result);
	 				// textarea 리셋
	 	            $(".txt").val('');
	 				
	 	           var str = "";

	 	 			str += "<i class='material-icons star' id='star1' name='star1' data-star='1'>star_border</i>";
	 	 			str += "<i class='material-icons star' id='star2' name='star2' data-star='2'>star_border</i>";
	 	 			str += "<i class='material-icons star' id='star3' name='star3' data-star='3'>star_border</i>";
	 	 			str += "<i class='material-icons star' id='star4' name='star4' data-star='4'>star_border</i>";
	 	 			str += "<i class='material-icons star' id='star5' name='star5' data-star='5'>star_border</i>";

	 	 			starUL.html(str);
	 			}
 			);
        }); // on
		
		reviewService.get(hospitalId.val(), function(data) {
			console.log("평균 : "+data);
			
			var str = "";
			var star = "";

			if(data == 1) {
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star_border</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star_border</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star_border</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star_border</span>";
			} else if(data < 2) {
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star_half</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star_border</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star_border</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star_border</span>";
			} else if(data == 2) {
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star_border</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star_border</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star_border</span>";
			} else if(data < 3) {
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star_half</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star_border</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star_border</span>";
			} else if(data == 3) {
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star_border</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star_border</span>";
			} else if(data < 4) {
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star_half</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star_border</span>";
			} else if(data == 4) {
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star_border</span>";
			} else if(data < 5) {
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star_half</span>";
			} else if(data == 5) {
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
				star += "<span class='material-icons' style='font-weight:bold'>star</span>";
			}

			str += "<span class='heading'><p style='font-weight:bold'>User Rating &nbsp;&nbsp;";
			str += "	<span style='color:gold;font-weight:bold'>"+star+"</span>&nbsp;&nbsp;"+data+"</p></span>";
			str += "		<p>평균평균</p>";

			rateUL.html(str);
		});


		reviewService.getReviewList({hospitalId:hospitalId.val()}, function(list){

			var str = "";

			if(list == null || list.length == 0) {
				//reviewUL.html("");
				return;
			}

			for(var i=0, len = list.length || 0; i<len; i++) {

				var star = "";
				var starPoint = list[i].starPoint;

				if(starPoint == 1) {
					star += "<i class='material-icons'>star</i>";
					star += "<i class='material-icons'>star_border</i>";
					star += "<i class='material-icons'>star_border</i>";
					star += "<i class='material-icons'>star_border</i>";
					star += "<i class='material-icons'>star_border</i>";
				} else if(starPoint == 1.5) {
					star += "<i class='material-icons'>star</i>";
					star += "<i class='material-icons'>star_half</i>";
					star += "<i class='material-icons'>star_border</i>";
					star += "<i class='material-icons'>star_border</i>";
					star += "<i class='material-icons'>star_border</i>";
				} else if(starPoint == 2) {
					star += "<i class='material-icons'>star</i>";
					star += "<i class='material-icons'>star</i>";
					star += "<i class='material-icons'>star_border</i>";
					star += "<i class='material-icons'>star_border</i>";
					star += "<i class='material-icons'>star_border</i>";
				} else if(starPoint == 2.5) {
					star += "<i class='material-icons'>star</i>";
					star += "<i class='material-icons'>star</i>";
					star += "<i class='material-icons'>star_half</i>";
					star += "<i class='material-icons'>star_border</i>";
					star += "<i class='material-icons'>star_border</i>";
				} else if(starPoint == 3) {
					star += "<i class='material-icons'>star</i>";
					star += "<i class='material-icons'>star</i>";
					star += "<i class='material-icons'>star</i>";
					star += "<i class='material-icons'>star_border</i>";
					star += "<i class='material-icons'>star_border</i>";
				} else if(starPoint == 3.5) {
					star += "<i class='material-icons'>star</i>";
					star += "<i class='material-icons'>star</i>";
					star += "<i class='material-icons'>star</i>";
					star += "<i class='material-icons'>star_half</i>";
					star += "<i class='material-icons'>star_border</i>";
				} else if(starPoint == 4) {
					star += "<i class='material-icons'>star</i>";
					star += "<i class='material-icons'>star</i>";
					star += "<i class='material-icons'>star</i>";
					star += "<i class='material-icons'>star</i>";
					star += "<i class='material-icons'>star_border</i>";
				} else if(starPoint == 4.5) {
					star += "<i class='material-icons'>star</i>";
					star += "<i class='material-icons'>star</i>";
					star += "<i class='material-icons'>star</i>";
					star += "<i class='material-icons'>star</i>";
					star += "<i class='material-icons'>star_half</i>";
				} else if(starPoint == 5) {
					star += "<i class='material-icons'>star</i>";
					star += "<i class='material-icons'>star</i>";
					star += "<i class='material-icons'>star</i>";
					star += "<i class='material-icons'>star</i>";
					star += "<i class='material-icons'>star</i>";
				}


				str += "<li class='left clearfix' data-rno='12'><div class='container mt-3'>";
				str += "  <div class='media border p-3'>";
				str += "	<img src='/resources/img/baba.png' class='mr-3 mt-3 rounded-circle' style='width:50px'>";
				str += "		<div class='media-body'>";
				str += "			<h4><i style='color:gold; font-weight:bold'>"+star+"</i>"+' '+list[i].starPoint+"</h4>";
				str += "				<small><i style='font-weight:bold'>"+list[i].userEmail+"</i>&nbsp;&nbsp;<i>"+reviewService.displayTime(list[i].createdDate)+"</i></small>";
				str += "     				<p>"+list[i].body+"</p></div></li>";

			}

			reviewUL.html(str);
		});
		
	}); // ready