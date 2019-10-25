console.log("aboutus");

var aboutUsService = (function() {
	
	function reseveCount(callback, error) {
		
		$.getJSON("/aboutus/reserve" + ".json",
			function(data) {
				if(callback) {
					callback(data);
				}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	} // reseveCount
	
	function reviewCount(callback, error) {
		
		$.getJSON("/aboutus/review" + ".json",
			function(data) {
				if(callback) {
					callback(data);
				}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	} // reviewCount
	
	function userCount(callback, error) {
		
		$.getJSON("/aboutus/user" + ".json",
			function(data) {
				if(callback) {
					callback(data);
				}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	} // userCount
	
	function hospitalCount(callback, error) {
		
		$.getJSON("/aboutus/hospital" + ".json",
			function(data) {
				if(callback) {
					callback(data);
				}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	} // hospitalCount
	
	return {
		reseveCount : reseveCount,
		reviewCount : reviewCount,
		userCount : userCount,
		hospitalCount : hospitalCount
	}
	
})();