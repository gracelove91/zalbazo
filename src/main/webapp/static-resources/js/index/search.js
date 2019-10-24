	$('.wrap input[type="checkbox"]').on('click', function() {
		var chk_obj = document.getElementsByName("label");    //체크박스 갯수구현
	    var chk_leng = chk_obj.length;
	    var checked = 0;
	    for (i=0; i < chk_leng; i++) {
	        if (chk_obj[i].checked == true) {
	            checked += 1;
	        }
	    }
		$('#length').val(checked);
	
	});