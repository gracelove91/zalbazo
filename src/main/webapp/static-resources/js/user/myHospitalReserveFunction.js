var MyHospitalReserveService = (function() {
	
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
	
	function getHospitalReserveList(param, callback, error) {
		
		var userEmail = param.userEmail;
		
		$.getJSON("/myhospitalreserve/list" + ".json",
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
		
		$.get("/myhospitalreserve/" + reserveId + ".json", function(result) {
			
			if(callback) {
				callback(result);
			}
			
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});	

	} // get
	
	function update(rrr, callback, error) {
		
		$.ajax({
			type : 'put',
			url : '/myhospitalreserve/update',
			data : JSON.stringify(rrr),
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
		
	} /// update
	
	function remove(reserveId, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/myhospitalreserve/' + reserveId,
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
	
	return{
		displayTime : displayTime,
		getHospitalReserveList : getHospitalReserveList,
		get : get,
		update : update,
		remove : remove
	}
	
})();