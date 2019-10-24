$(document).ready(function() {
	
	var reserve = $("#reserve");
	
	var review = $("#review");
	
	var user = $("#user");
	
	var hos = $("#hos");
	
	var str = "";
	
	aboutUsService.reseveCount(function(data) {
		console.log("reserve"+data);
		str = "";
		str += data;
		
		reserve.html(str);
	});
	
	aboutUsService.reviewCount(function(data) {
		console.log("review"+data);
		str = "";
		str += data;
		
		review.html(str);
	});
	
	aboutUsService.userCount(function(data) {
		console.log("user"+data);
		str = "";
		str += data;
		
		user.html(str);
	});
	
	aboutUsService.hospitalCount(function(data) {
		console.log("hos"+data);
		str = "";
		str += data;
		
		hos.html(str);
	});
	
});
