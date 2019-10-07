//console.log("myContent");

var myContentService = (function() {
	
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
	
	function getCommunityList(param, callback, error) {
		
		var userEmail = param.userEmail;
		
		$.getJSON("/mycontent/list/1" + ".json",
			function(data) {
				if(callback) {
					callback(data);
				}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	} // getCommunityList 
	
	function getJisikdongList(param, callback, error) {
		
		var userEmail = param.userEmail;
		
		$.getJSON("/mycontent/list/2" + ".json",
			function(data) {
				if(callback) {
					callback(data);
				}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	} // getJisikdongList
	
	function getReviewList(param, callback, error) {
		
		var userEmail = param.userEmail;
		
		$.getJSON("/mycontent/list/3" + ".json",
			function(data) {
				if(callback) {
					callback(data);
				}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	} // getReviewList
	
	function getQList(param, callback, error) {
		
		var userEmail = param.userEmail;
		
		$.getJSON("/mycontent/list/4/1" + ".json",
			function(data) {
				if(callback) {
					callback(data);
				}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});	
	} // getQList
	
	function getReplyList(param, callback, error) {
		
		var userEmail = param.userEmail;
		
		$.getJSON("/mycontent/list/5" + ".json",
			function(data) {
				if(callback) {
					callback(data);
				}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});	
	} // getReplyList
	
	
	function getName(hospitalId, callback, error) {
		$.get("/mycontent/6/" + hospitalId + ".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function deleteQna(contentId, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/mycontent/delQna/' + contentId,
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
	
	
	function deleteContent(contentId, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/mycontent/delCon/' + contentId,
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
	
	function getANo(contentId, callback, error){
		
		$.post("/mycontent/getANo/" + contentId + ".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	return{
		displayTime : displayTime,
		getCommunityList : getCommunityList,
		getJisikdongList : getJisikdongList,
		getReviewList : getReviewList,
		getQList : getQList,
		getReplyList : getReplyList,
		getName : getName,
		deleteQna : deleteQna,
		deleteContent : deleteContent,
		getANo : getANo
	}
})();