	console.log("Hospital Get Module.....");
	
	var favoriteService = (function(){
				
		function addFavorite(favorite, callback, error) {
			console.log("favorite...");
			
			$.ajax({
				type : 'post',
				url : '/hospital/register',
				data : JSON.stringify(favorite),
				contentType : "application/json; charset=utf-8",
				success : function(result, status, xhr) {
					if(callback) {
						callback(result);
					}
				},
				error : function(xhr, status, er) {
					if(error) {
						error(er);
					}
				}
				
				
			})
		}

		
		return {
			addFavorite : addFavorite
		};
		
	})();
