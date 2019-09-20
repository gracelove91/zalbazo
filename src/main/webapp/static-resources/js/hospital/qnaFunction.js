	console.log("Hospital Get Module.....");
	
	var qnaService = (function(){
		
		function addQuestion(qna, callback, error) {
			console.log("add question.....");
			
			$.ajax({
				type : 'post',
				url : '/qna/question',
				data : JSON.stringify(qna),
				contentType : "application/json; charset=utf-8",
				success : function(result, status, xhr) {
					if(callback){
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
		
		function addAnswer(answer, callback, error) {
			console.log("add Answer.....");
			
			$.ajax({
				type : 'post',
				url : '/qna/answer',
				data : JSON.stringify(answer),
				contentType : "application/json; charset=utf-8",
				success : function(result, status, xhr) {
					if(callback){
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
		

		function getANo(contentId, callback, error){
			
			$.post("/qna/getANo/" + contentId + ".json", function(result){
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
			addAnswer : addAnswer,
			addQuestion : addQuestion,
			getList : getList,
			removeQna : removeQna,
			removeCon : removeCon,
			displayTime : displayTime,
			getANo : getANo
		};
		
	})();
