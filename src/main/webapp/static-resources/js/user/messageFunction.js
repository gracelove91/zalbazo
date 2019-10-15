console.log("message function...");

var messageService = (function() {
	
	function send(message, callback, error) {
		console.log("영자에게 메세지를 보내요,,");
		
		$.ajax({
			type : 'post',
			url : '/message/send',
			data : JSON.stringify(message),
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
	
	
	function reply(message, callback, error) {
		console.log("영자가 답장을 보내요,,");
		
		$.ajax({
			type : 'post',
			url : '/message/reply',
			data : JSON.stringify(message),
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
	
	
	function remove(contentId, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/message/remove/' + contentId,
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
	
	
	function getAdminList(callback, error) {

		$.get("/message/adminList" + ".json", function(result) {
			if (callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {

			if (error) {
				error();
			}

		});
	}
	
	
	function getUserList(userEmail, callback, error) {
		
		$.get("/message/userList/" + userEmail + ".json", 
			function(data){
				if(callback) {
					callback(data);
				}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	}

	
	function get(contentId, callback, error) {
		$.get("/message/get/" + contentId + ".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	
	function displayTime(timeValue) {
		var today = new Date();
		
		var gap = today.getTime() - timeValue;
		
		var dateObj = new Date(timeValue);
		var str = "";
		
		if(gap < (1000 * 60 * 60 * 24)) {
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [ (hh > 9 ? '':'0')+hh, ':', (mi > 9 ? '':'0')+mi, ':', (ss > 9 ? '':'0')+ss].join('');
			
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; 
			var dd = dateObj.getDate();
			
			return [yy, '/', (mm > 9 ? '':'0')+mm, '/', (dd > 9 ? '':'0')+dd].join('');
		}
	}
	
	
	return {
		send : send,
		reply : reply,
		remove : remove,
		getAdminList : getAdminList,
		getUserList : getUserList,
		get : get,
		displayTime : displayTime
	}
	
})();