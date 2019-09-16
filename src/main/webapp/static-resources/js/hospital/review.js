	console.log("Hospital Review.....");
	
	var reviewService = (function(){
		
		function getReviewList(param, callback, error) {
			
			var hospitalId = param.hospitalId;
			
			$.getJSON("/reviews/list/" + hospitalId + ".json",
					function(data){
					if(callback){
						callback(data);
					}
				}).fail(function(xhr, status, err){
					if(error){
						error();
					}
				});
		}
		
		return {
			getReviewList : getReviewList
		};
		
		
		
	})();