//console.log("myFavorite");

var myAnimalService = (function() {

	function getList(param, callback, error) {

		var userEmail = param.userEmail;

		$.getJSON("/user/mypage/animal_list" + ".json", function(data) {
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
		getList : getList
	};
})();