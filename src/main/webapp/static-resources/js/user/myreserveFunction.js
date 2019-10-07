console.log("myReserve");

var myReserveService = (function() {
	
	function displayTime(timeValue) {

		var dateObj = new Date(timeValue);
		
		var str = "";
			
		var yyyy = dateObj.getFullYear();
		var mm = dateObj.getMonth() + 1;
		var dd = dateObj.getDate();
		var hh = dateObj.getHours();
		var mi = dateObj.getMinutes();

		return [ yyyy, '-', (mm > 9 ? '' : '0') + mm, '-', (dd > 9 ? '' : '0') + dd,
				, ' ', (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi ].join('');

	}
	
	function getReserveList(param, callback, error) {
		
		var userEmail = param.userEmail;
		
		$.getJSON("/myreserve/r" + ".json",
			function(data) {
				if(callback) {
					callback(data);
				}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	} // getReserveList
	
	function get(reserveId, callback, error) {
		
		$.get("/myreserve/" + reserveId + ".json", function(result) {
			
			if(callback) {
				callback(result);
			}
			
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});	

	} // get
	
	function insertReview(review, callback, error) {
		
		$.ajax({
			type : 'post',
			url : '/myreserve/review',
			data : JSON.stringify(review),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			erorr : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		})
	} // addReview
	
	return{
		displayTime : displayTime,
		getReserveList : getReserveList,
		get : get,
		insertReview : insertReview
	}
	
})();