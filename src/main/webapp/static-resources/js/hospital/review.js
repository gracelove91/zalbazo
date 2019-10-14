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
 		
 		var total = $(".getTotal");
 		
 		reviewService.getTotal(hospitalId.val(), function(data) {
 			console.log(data);
 			
 			var str = "";
 			
 			str += "<h3 style='color:#707070;' align='center'>전체 리뷰 수</h3>";
 			str += "<br>";
 			str += "<h2 style='color:#707070;' align='center'>"+ data +"개</h2>";
 			
 			total.html(str);
 		}); // getTotal
	
		reviewService.get(hospitalId.val(), function(data) {
			//console.log(data);
			
			var str = "";
			var star = "";

			if(data == 1) {
				star += "<div style='font-weight:bold;font-size: x-large;'>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star_border</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star_border</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star_border</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star_border</h1>";
				star += "</div>";
			} else if(data < 2) {
				star += "<div style='font-weight:bold;font-size: x-large;'>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star_half</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star_border</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star_border</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star_border</h1>";
				star += "</div>";
			} else if(data == 2) {
				star += "<div style='font-weight:bold;font-size: x-large;'>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star_border</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star_border</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star_border</h1>";
				star += "</div>";
			} else if(data < 3) {
				star += "<div style='font-weight:bold;font-size: x-large;'>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star_half</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star_border</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star_border</h1>";
				star += "</div>";
			} else if(data == 3) {
				star += "<div style='font-weight:bold;font-size: x-large;'>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star_border</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star_border</h1>";
				star += "</div>";
			} else if(data < 4) {
				star += "<div style='font-weight:bold;font-size: x-large;'>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star_half</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star_border</h1>";
				star += "</div>";
			} else if(data == 4) {
				star += "<div style='font-weight:bold;font-size: x-large;'>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star_border</h1>";
				star += "</div>";
			} else if(data < 5) {
				star += "<div style='font-weight:bold;font-size: x-large;'>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star_half</h1>";
				star += "</div>";
			} else if(data == 5) {
				star += "<div style='font-weight:bold;font-size: x-large;'>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "<h1 class='material-icons' style='font-weight:bold;color:gold;'>star</h1>";
				star += "</div>";
			}

			str += "<h3 style='color:#707070;' align='center'>사용자 총 평점</h3>";
			str += "	<h1 style='color:gold;font-weight:bold' align='center'>"+star+"</h1>";
			str += "	<h2 style='color:#707070;' align='center'>"+data+" / 5</h2>";

			rateUL.html(str);
		}); // get
		
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