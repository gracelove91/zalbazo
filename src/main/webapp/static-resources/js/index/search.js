$(".dropdown dt a").on('click', function() {
	  $(".dropdown dd ul").slideToggle('fast');
	});

	$(".dropdown dd ul li a").on('click', function() {
	  $(".dropdown dd ul").hide();
	});

	function getSelectedValue(id) {
	  return $("#" + id).find("dt a span.value").html();
	}

	$(document).bind('click', function(e) {
	  var $clicked = $(e.target);
	  if (!$clicked.parents().hasClass("dropdown")) $(".dropdown dd ul").hide();
	});

	$('.mutliSelect input[type="checkbox"]').on('click', function() {
		var chk_obj = document.getElementsByName("label");    //체크박스 갯수구현
	    var chk_leng = chk_obj.length;
	    var checked = 0;
	    for (i=0; i < chk_leng; i++) {
	        if (chk_obj[i].checked == true) {
	            checked += 1;
	        }
	    }
		$('#length').val(checked);
	  var title = $(this).closest('.mutliSelect').find('input[type="checkbox"]').attr('id'),
	    title = "["+$(this).attr('id') + "]";

	  if ($(this).is(':checked')) {
	    var html = '<span title="' + title + '">' + title + '</span>';
	    $('.multiSel').append(html);
	    $(".hida").hide();
	  } else {
	    $('span[title="' + title + '"]').remove();
	    var ret = $(".hida");
	    $('.dropdown dt a').append(ret);

	  }
	});