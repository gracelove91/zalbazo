var favoriteService = (function(){

    function toFullHeart(favorite, callback, error) {
        console.log("favorite...");
        
        $.ajax({
            type : 'post',
            url : '/favorite/insert',
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

        });
        
    }
    
    
	function removeFavorite(fhospitalId, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/favorite/remove/' + fhospitalId,
			success : function(deleteResult, status, xhr) {
				if(callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	
	
	
	
	function toEmptyHeart(hospitalId, callback, error){
		$.ajax({
			type : 'delete',
			url : '/favorite/heart/' + hospitalId,
			success : function(deleteResult, status, xhr) {
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	
	function getFavoriteList(userEmail, callback, error) {
		
		$.getJSON("/favorite/list/" + ".json", 
			function(data) {
			if (callback) {
				callback(data);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
		
	} 
	

	
		
    return {
    	toFullHeart : toFullHeart,
        removeFavorite : removeFavorite,
        getFavoriteList : getFavoriteList,
        toEmptyHeart : toEmptyHeart
    };
    
})();
