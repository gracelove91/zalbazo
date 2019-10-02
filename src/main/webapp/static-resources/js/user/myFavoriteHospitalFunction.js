console.log("myFavorite");

var myFavoriteHospitalService = (function() {

	function getList(param, callback, error) {

		var userEmail = param.userEmail;

		$.getJSON("/user/mypage/favorite_list" + ".json", function(data) {
			if (callback) {
				callback(data);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
		
	} 

////	function removeMyFavorite(param, callback, error) {
//	function removeMyFavorite(hospitalId, callback, error) {
////		var hospitalId = param.hospitalId;
//
//		console.log("remove mypage favorite...");
//		$.ajax({
//			type : 'delete',
//			url : '/user/mypage/favorite_list/remove/' + hospitalId,
//			success : function(removeResult, status, xhr) {
//				if(callback) {
//					callback(removeResult);
//				}
//			},
//			error : function(xhr, status, er) {
//				if(error) {
//					error(er);
//				}
//			}
//		});
//	}
	
	function removeMyFavorite(hospitalId, callback, error) {
		
		
		
		console.log("remove my favorite...");
		$.ajax({
			type : 'delete',
			url : '/user/mypage/favorite_list/remove/' + hospitalId,
			success : function(removeResult, status, xhr) {
				if(callback) {
					callback(removeResult);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}

    return {

    	getList : getList,
        removeMyFavorite : removeMyFavorite

	};
	
})();