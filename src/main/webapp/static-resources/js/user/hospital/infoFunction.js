var infoService = (function(){
	
	function get(userEmail, callback, error) {
		
		$.get("/hospitalinfo/detail/" +userEmail+ ".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
		
	}
	
	
	return {
		get : get 
	};
	
	
})();