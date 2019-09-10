var replyService = (function() {

	function add(body, callback, error) {
		console.log("add reply");

		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(body),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})
	}

	function getList(param, callback, error) {
		
		var contentId = param.contentId;
		var page = param.page || 1;

		$.getJSON("/replies/pages/" + contentId + "/" + page + ".json",
				function(data) {
				  if(callback) {
					  callback(data.replyCnt, data.list); // 댓글 숫자와 목록을 가져오는 경우
				  }
				}).fail(function(xhr, status, err) {
			if(error){
				error();
			}
		});
	}
	
	function remove(replyid, callback, error) {
		console.log("remove : "+body.replyid);
		
		$.ajax({
			type : 'delete',
			url : '/replies/' + replyid,
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
	}
	
	function update(body, callback, error) {
		console.log("replyid : "+body.replyid);
		
		$.ajax({
			type : 'put',
			url : '/replies/' + body.replyid,
			data : JSON.stringify(body),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
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
	
	function get(replyid, callback, error) {
		console.log("get : "+replyid);
		
		$.get("/replies/" + replyid + ".json", function(result) {
			
			if(callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {
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
			
			return [(hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss].join('');
		
		} else{
			
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // 월[0]이 1월이니까
			var dd = dateObj.getDate();
			
			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd].join('');
		}
	};

	return {
		add : add,
		get : get,
		getList : getList,
		remove : remove,
		update : update,
		displayTime : displayTime
	};
})();