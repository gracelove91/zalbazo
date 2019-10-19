console.log("adminService");

var adminService = (function() {
	
	function displayTime(timeValue) {

		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str = "";

		if (gap < (1000 * 60 * 60 * 24)) {
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
					':', (ss > 9 ? '' : '0') + ss ].join('');

		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();

			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
					(dd > 9 ? '' : '0') + dd ].join('');
		}
	}
	
	function getUserList(callback, error) {
		
		$.getJSON("/admin/list/user" + ".json",
			function(data) {
				if(callback) {
					callback(data);
				}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	} // getUserList
	
	function getHosList(callback, error) {
		
		$.getJSON("/admin/list/hos" + ".json",
			function(data) {
				if(callback) {
					callback(data);
				}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	} // getUserList
	
	function remove(userEmail, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/admin/delete/' +userEmail,
			contentType : "application/json; charset=utf-8",
			success : function(deleteresult, status, xhr) {
				if (callback) {
					callback(deleteresult);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	} // remove
	
	
	function getUser(userEmail, callback, error) {
		$.get("/admin/getuser/" +userEmail+ ".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			error();
		});
	}
	
	function getHos(userEmail, callback, error) {
		$.get("/admin/gethos/" +userEmail+ ".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			error();
		});
	}
	
	return{
		displayTime : displayTime,
		getUserList : getUserList,
		getHosList : getHosList,
		remove : remove,
		getUser : getUser,
		getHos : getHos
	}
	
})();