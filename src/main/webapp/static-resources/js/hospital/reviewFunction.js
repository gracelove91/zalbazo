console.log("병원리뷰!");

var reviewService = (function() {
	
	function getTotal(hospitalId, callback, error) {

		$.get("/reviews/total/" + hospitalId + ".json", function(result) {
			if (callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {

			if (error) {
				error();
			}

		});
	} // get

	function get(hospitalId, callback, error) {

		$.get("/reviews/" + hospitalId + ".json", function(result) {
			if (callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {

			if (error) {
				error();
			}

		});
	} // get

	function getReviewList(param, callback, error) {

		var hospitalId = param.hospitalId;

		$.getJSON("/reviews/list/" + hospitalId + ".json", function(data) {
			if (callback) {
				callback(data);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}

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

	return {
		getTotal : getTotal,
		get : get,
		getReviewList : getReviewList,
		displayTime : displayTime
	};

})();