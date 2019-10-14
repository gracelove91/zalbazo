var userInfoService = (function(){

	function getUser(callback, error) {

		$.get("/user/getUser" + ".json", function(user) {
			if (callback) {
				callback(user);
			}
		}).fail(function(xhr, status, err) {

			if (error) {
				error();
			}

		});
		
	} // getUser
	
	
	function getWriter(contentId, callback, error) {
		
		$.get("/user/getWriter/" + contentId + ".json", function(writer) {
			if (callback) {
				callback(writer);
			}
		}).fail(function(xhr, status, err) {

			if (error) {
				error();
			}

		});
	} // getWriter

	return {
		getUser : getUser,
		getWriter : getWriter
	};
	
})();