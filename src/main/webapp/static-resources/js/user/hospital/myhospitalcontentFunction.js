console.log("MyHospitalContentService");

var MyHospitalContentService = (function() {
	
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
	
	function getHospitalQList(param, callback, error) {
		
		var userEmail = param.userEmail;
		
		$.getJSON("/myhospitalcontent/list/qna" + ".json",
			function(data) {
				if(callback) {
					callback(data);
				}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});	
	} // getHospitalQList
	
	function insertAnswer(answer, callback, error) {
		console.log("add Answer.....");
		
		$.ajax({
			type : 'post',
			url : '/myhospitalcontent/answer',
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
	

	function removeA(contentId, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/myhospitalcontent/removeA/' + contentId,
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
	
	
	
	return{
		displayTime : displayTime,
		getHospitalQList : getHospitalQList,
		insertAnswer : insertAnswer,
		removeA : removeA
	}
})();