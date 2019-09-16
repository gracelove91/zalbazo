	console.log("Hospital Get Module.....");
	
	var qnaService = (function(){
		
		function addCon(con, callback, error) {
			console.log("con........");
			
			$.ajax({
				type : 'post',
				url : '/qna/newCon',
				data : JSON.stringify(con),
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
		
		function addQna(qna, callback, error) {
			console.log("qna........");
			
			$.ajax({
				type : 'post',
				url : '/qna/newQna',
				data : JSON.stringify(qna),
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
		
		
		function getList(param, callback, error) {
			
			var hospitalId = param.hospitalId;
			
			$.getJSON("/qna/list/" + hospitalId + ".json",
				function(data){
				if(callback){
					callback(data);
				}
			}).fail(function(xhr, status, err){
				if(error){
					error();
				}
			});
		}
		
		
		function removeQna(contentId, callback, error) {
			$.ajax({
				type : 'delete',
				url : '/qna/delQna/' + contentId,
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
		
		
		function removeCon(contentId, callback, error) {
			$.ajax({
				type : 'delete',
				url : '/qna/delCon/' + contentId,
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
			addCon : addCon,
			addQna : addQna,
			getList : getList,
			removeQna : removeQna,
			removeCon : removeCon,
			displayTime : displayTime
		};
		
	})();
