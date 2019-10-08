$(document).ready(function() {
	
	
	var sft = start.substr(0, 2);
	var eft = end.substr(0, 2);
	var eet = end.substr(3);
	var rowcount = 0;
	var count = 0;
	var set = '00'
	var sset = '30';
	sft = parseInt(sft); // start 앞넘버값

	eft = parseInt(eft); // end 앞넘버값

	for (sft, count, rowcount; sft < eft; sft++, count++) {
		var obj = $('#tt tr');
		if (count < 2) {
			obj.eq(rowcount).append('<td class="time">' + sft + ':' + set + '</td>')
			obj.eq(rowcount).append('<td class="time">' + sft + ':' + sset + '</td>')
		}

		if (count == 2) {
			$('#tt').append(
					'<tr><td class="time">' + sft + ':' + set + '</td><td class="time">' + sft + ':' + sset
							+ '</td></tr>')
			rowcount++;
			count = 0;

		}

	}

	function setTreatTime(treatStart, treatEnd) {
		start = treatStart;
		end = treatEnd;
	}
	
	
	$("#my-calendar").zabuto_calendar({

		ajax : {
			url : "show_data.php?grade=1"

			
		}
	});

	/* $('#tt').on('click','td',function(e){alert($('this').text())}) */
	

	$('#tt').on('mouseenter', 'td', function(e) {
		$('td').css('cursor', 'pointer');
	}) // 마우스커서 바꾸기
	$('#my-calendar').on('mouseenter', '.day', function(e) {
		$('.day').css('cursor', 'pointer');
	}) // 마우스커서 바꾸기
	// 날짜입력, 클릭시 색바꿈
	$('#my-calendar').on('click', '.day', function(e) {
		var date = $(this).attr('id');
		$('#reservedate').html("예약날짜 :  " + $(this).attr('id'));
		$('#reservetime').html("예약시간 : ");
		$('.day').removeClass("selected");
		$(this).addClass("selected");
		$('#d').val($(this).attr('id'))
		$('.time').removeClass("block"); 	//이미 예약완료인 타임테이블 초기화
		$('.time').removeClass("selected");
		// 타임테이블 기능적용
		$(".time").each(function () {

				$(this).click(function() {
					var txt = $(this).text();
					var reservett = document.getElementById('reservetime').innerHTML;
					var reservedt = document.getElementById('reservedate').innerHTML;
					
					if (reservedt.length < 5) {
						alert('날짜먼저 선택해주세요');

					} else {
						document.getElementById('reservetime').innerHTML = "예약시간 : " + txt;
						$('#t').val(txt);
						$('.time').siblings().removeClass("selected");
						  $(this).addClass("selected"); //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
						
					}

				});
				   });
		
		//날짜별로 타임테이블 유효성검사 적용시키기
		$.ajax({
			type : "GET",
			url : "/reserve.do",
			error : function(error){
				
			},
			data : {date : $(this).attr('id'),hospitalId : $('#hospital').val() }  ,
			success : function(result){
			var adate = result.date;
			var ttable = $('#tt .time');
			//시간이 들어간 타임테이블 click 못하게하고 class block 추가하여 색깔변경
				$.each(adate, function( date, value ) {
					
					for(var i=0; i<ttable.length;i++){
						if((ttable[i].innerText)==value){
							$(ttable[i]).off('click');
							$(ttable[i]).addClass('block');
						
						};	
					}
				});
			}
			
			
		});
		
		
		
	});
	$('.animallist').on('click', 'li', function(e) {
		$('#animalId').val($(this).attr('id'));
		$('.animallist li').css('background-color', 'white');
		$(this).css('background-color', '#CEECF5');
	});

	
	
});//.ready



// 예약 시간 생성!!!
function check() { // 날짜 시간 체킹

	if ($('#d').val() == "") {

		alert("날짜를 입력해 주세요.");

		return false;

	}

	else if ($('#t').val() == "") {

		alert("시간을 입력해 주세요.");

		return false;

	}
	else if($('#animalId').val() ==""){
		alert("동물을 선택해 주세요.")
		
		return false;
	}

	else
		return "index";
}



// 캘린더 생성
$.fn.zabuto_calendar = function(options) {
	var opts = $.extend({}, $.fn.zabuto_calendar_defaults(), options);
	var languageSettings = $.fn.zabuto_calendar_language(opts.language);
	opts = $.extend({}, opts, languageSettings);
	
	this
			.each(function() {
				var $calendarElement = $(this);

				$calendarElement.data('initYear', opts.year);
				$calendarElement.data('initMonth', opts.month);
				$calendarElement.data('monthLabels', opts.month_labels);
				$calendarElement.data('weekStartsOn', opts.weekstartson);
				$calendarElement.data('navIcons', opts.nav_icon);
				$calendarElement.data('dowLabels', opts.dow_labels);
				$calendarElement.data('showToday', opts.today);
				$calendarElement.data('showDays', opts.show_days);
				$calendarElement.data('showPrevious', opts.show_previous);
				$calendarElement.data('showNext', opts.show_next);
				$calendarElement.data('cellBorder', opts.cell_border);
				$calendarElement.data('jsonData', opts.data);
				$calendarElement.data('ajaxSettings', opts.ajax);
				$calendarElement.data('actionFunction', opts.action);
				$calendarElement.data('actionNavFunction', opts.action_nav);

				drawCalendar();

				function drawCalendar() { // 처음에 달력 그려주기
					var dateInitYear = parseInt($calendarElement
							.data('initYear'));
					var dateInitMonth = parseInt($calendarElement
							.data('initMonth')) - 1;
					var dateInitObj = new Date(dateInitYear, dateInitMonth, 1,
							0, 0, 0, 0);
					$calendarElement.data('initDate', dateInitObj);

					var tableClassHtml = ($calendarElement.data('cellBorder') === true) ? ' table-bordered'
							: '';

					$tableObj = $('<table class="table' + tableClassHtml
							+ '"></table>');
					$tableObj = drawTable($calendarElement, $tableObj,
							dateInitObj.getFullYear(), dateInitObj.getMonth());

					var $containerHtml = $('<div class="zabuto_calendar" id="'
							+ $calendarElement.attr('id') + '"></div>');
					$containerHtml.append($tableObj);

					$calendarElement.append($containerHtml);

					var jsonData = $calendarElement.data('jsonData');
					if (false !== jsonData) {
						checkEvents($calendarElement,
								dateInitObj.getFullYear(), dateInitObj
										.getMonth());
						
						
					}
					var daycheck = $('.day');
					var today =new Date();
				for(var i=0; i<daycheck.length;i++){
				if(new Date(daycheck[i].id)<today){
					$(daycheck[i]).prop('disabled', true);
					$(daycheck[i]).addClass('block');

				};	
				}
					
				}

				function drawTable($calendarElement, $tableObj, year, month) { // 테이블
																				// 만들어주는매서드
					var dateCurrObj = new Date(year, month, 1, 0, 0, 0, 0);
					$calendarElement.data('currDate', dateCurrObj);

					$tableObj.empty();
					$tableObj = appendMonthHeader($calendarElement, $tableObj,
							year, month);
					$tableObj = appendDayOfWeekHeader($calendarElement,
							$tableObj);
					$tableObj = appendDaysOfMonth($calendarElement, $tableObj,
							year, month);
					checkEvents($calendarElement, year, month);
					var daycheck = $('.day');
					var today =new Date();
				for(var i=0; i<daycheck.length;i++){
				if(new Date(daycheck[i].id)<today){
					$(daycheck[i]).prop('disabled', true);
					$(daycheck[i]).addClass('block');

				};	
				}
					
					return $tableObj;
				}

				function appendMonthHeader($calendarElement, $tableObj, year,
						month) { // 위에 이전 다음 아이콘
					var navIcons = $calendarElement.data('navIcons');
					var $prevMonthNavIcon = $('<span><span class="glyphicon glyphicon-chevron-left"></span></span>');
					var $nextMonthNavIcon = $('<span><span class="glyphicon glyphicon-chevron-right"></span></span>');
					if (typeof (navIcons) === 'object') {
						if ('prev' in navIcons) {
							$prevMonthNavIcon.html(navIcons.prev);
						}
						if ('next' in navIcons) {
							$nextMonthNavIcon.html(navIcons.next);
						}
					}

					var prevIsValid = $calendarElement.data('showPrevious'); // 이전
																				// 보여주기는것
					if (typeof (prevIsValid) === 'number'
							|| prevIsValid === false) {
						prevIsValid = checkMonthLimit($calendarElement
								.data('showPrevious'), true);
					}

					var $prevMonthNav = $('<div class="calendar-month-navigation"></div>'); // 이전달
					$prevMonthNav.attr('id', $calendarElement.attr('id')
							+ '_nav-prev');
					$prevMonthNav.data('navigation', 'prev');
					if (prevIsValid !== false) {
						prevMonth = (month - 1);
						prevYear = year;
						if (prevMonth == -1) {
							prevYear = (prevYear - 1);
							prevMonth = 11;
						}
						$prevMonthNav.data('to', {
							year : prevYear,
							month : (prevMonth + 1)
						});
						$prevMonthNav.append($prevMonthNavIcon);
						if (typeof ($calendarElement.data('actionNavFunction')) === 'function') {
							$prevMonthNav.click($calendarElement
									.data('actionNavFunction'));
						}
						$prevMonthNav.click(function(e) {
							drawTable($calendarElement, $tableObj, prevYear,
									prevMonth);
						});
					}

					var nextIsValid = $calendarElement.data('showNext');
					if (typeof (nextIsValid) === 'number'
							|| nextIsValid === false) {
						nextIsValid = checkMonthLimit($calendarElement
								.data('showNext'), false);
					}

					var $nextMonthNav = $('<div class="calendar-month-navigation"></div>');
					$nextMonthNav.attr('id', $calendarElement.attr('id')
							+ '_nav-next');
					$nextMonthNav.data('navigation', 'next');
					if (nextIsValid !== false) {
						nextMonth = (month + 1);
						nextYear = year;
						if (nextMonth == 12) {
							nextYear = (nextYear + 1);
							nextMonth = 0;
						}
						$nextMonthNav.data('to', {
							year : nextYear,
							month : (nextMonth + 1)
						});
						$nextMonthNav.append($nextMonthNavIcon);
						if (typeof ($calendarElement.data('actionNavFunction')) === 'function') {
							$nextMonthNav.click($calendarElement
									.data('actionNavFunction'));
						}
						$nextMonthNav.click(function(e) {
							drawTable($calendarElement, $tableObj, nextYear,
									nextMonth);
						});
					}

					var monthLabels = $calendarElement.data('monthLabels');

					var $prevMonthCell = $('<th></th>').append($prevMonthNav);
					var $nextMonthCell = $('<th></th>').append($nextMonthNav);

					var $currMonthLabel = $('<span>' + year  + '년'+' '
							+ monthLabels[month] + '</span>');
					$currMonthLabel.dblclick(function() {
						var dateInitObj = $calendarElement.data('initDate');
						drawTable($calendarElement, $tableObj, dateInitObj
								.getFullYear(), dateInitObj.getMonth());
					});

					var $currMonthCell = $('<th colspan="5"></th>');
					$currMonthCell.append($currMonthLabel);

					var $monthHeaderRow = $('<tr class="calendar-month-header"></tr>');
					$monthHeaderRow.append($prevMonthCell, $currMonthCell,
							$nextMonthCell);

					$tableObj.append($monthHeaderRow);
					return $tableObj;
				}

				function appendDayOfWeekHeader($calendarElement, $tableObj) {
					if ($calendarElement.data('showDays') === true) {
						var weekStartsOn = $calendarElement
								.data('weekStartsOn');
						var dowLabels = $calendarElement.data('dowLabels');
						if (weekStartsOn === 0) {
							var dowFull = $.extend([], dowLabels);
							var sunArray = new Array(dowFull.pop());
							dowLabels = sunArray.concat(dowFull);
						}

						var $dowHeaderRow = $('<tr class="calendar-dow-header"></tr>');
						$(dowLabels).each(function(index, value) {
							$dowHeaderRow.append('<th>' + value + '</th>');
						});
						$tableObj.append($dowHeaderRow);
					}
					return $tableObj;
				}

				function appendDaysOfMonth($calendarElement, $tableObj, year,
						month) {
					var ajaxSettings = $calendarElement.data('ajaxSettings');
					var weeksInMonth = calcWeeksInMonth(year, month);
					var lastDayinMonth = calcLastDayInMonth(year, month);
					var firstDow = calcDayOfWeek(year, month, 1);
					var lastDow = calcDayOfWeek(year, month, lastDayinMonth);
					var currDayOfMonth = 1;

					var weekStartsOn = $calendarElement.data('weekStartsOn');
					if (weekStartsOn === 0) {
						if (lastDow == 6) {
							weeksInMonth++;
						}
						if (firstDow == 6
								&& (lastDow == 0 || lastDow == 1 || lastDow == 5)) {
							weeksInMonth--;
						}
						firstDow++;
						if (firstDow == 7) {
							firstDow = 0;
						}
					}

					for (var wk = 0; wk < weeksInMonth; wk++) {
						var $dowRow = $('<tr class="calendar-dow"></tr>');
						for (var dow = 0; dow < 7; dow++) {
							if (dow < firstDow
									|| currDayOfMonth > lastDayinMonth) {
								$dowRow.append('<td></td>');
							} else {
								var dateId = dateAsString(year, month,
										currDayOfMonth);
								var dayId = dateId;

								var $dayElement = $('<div id="' + dayId
										+ '" class="day"' + 'value="' + dateId
										+ '">' + currDayOfMonth + '</div>');
								$dayElement.data('day', currDayOfMonth);

								if ($calendarElement.data('showToday') === true) {
									if (isToday(year, month, currDayOfMonth)) {
										$dayElement
												.html('<span class="badge badge-today">'
														+ currDayOfMonth
														+ '</span>');
									}
								}

								var $dowElement = $('<td ></td>');
								$dowElement.append($dayElement);

								$dowElement.data('date', dateAsString(year,
										month, currDayOfMonth));
								$dowElement.data('hasEvent', false);

								if (typeof ($calendarElement
										.data('actionFunction')) === 'function') {
									$dowElement.addClass('dow-clickable');
									$dowElement.click(function() {
										$calendarElement.data('selectedDate',
												$(this).data('date'));
									});
									$dowElement.click($calendarElement
											.data('actionFunction'));
								}

								$dowRow.append($dowElement);

								currDayOfMonth++;
							}
							if (dow == 6) {
								firstDow = 0;
							}
						}

						$tableObj.append($dowRow);
					}
					return $tableObj;
				}

				/* ----- Modal functions ----- */

				function createModal(id, title, body, footer) {
					var $modalHeaderButton = $('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>');
					var $modalHeaderTitle = $('<h4 class="modal-title" id="'
							+ id + '_modal_title">' + title + '</h4>');

					var $modalHeader = $('<div class="modal-header"></div>');
					$modalHeader.append($modalHeaderButton);
					$modalHeader.append($modalHeaderTitle);

					var $modalBody = $('<div class="modal-body" id="' + id
							+ '_modal_body">' + body + '</div>');

					var $modalFooter = $('<div class="modal-footer" id="' + id
							+ '_modal_footer"></div>');
					if (typeof (footer) !== 'undefined') {
						var $modalFooterAddOn = $('<div>' + footer + '</div>');
						$modalFooter.append($modalFooterAddOn);
					}

					var $modalContent = $('<div class="modal-content"></div>');
					$modalContent.append($modalHeader);
					$modalContent.append($modalBody);
					$modalContent.append($modalFooter);

					var $modalDialog = $('<div class="modal-dialog"></div>');
					$modalDialog.append($modalContent);

					var $modalFade = $('<div class="modal fade" id="'
							+ id
							+ '_modal" tabindex="-1" role="dialog" aria-labelledby="'
							+ id + '_modal_title" aria-hidden="true"></div>');
					$modalFade.append($modalDialog);

					$modalFade.data('dateId', id);
					$modalFade.attr("dateId", id);

					return $modalFade;
				}

				/* ----- Event functions ----- */

				function checkEvents($calendarElement, year, month) {
					var jsonData = $calendarElement.data('jsonData');
					var ajaxSettings = $calendarElement.data('ajaxSettings');

					$calendarElement.data('events', false);

					if (false !== jsonData) {
						return jsonEvents($calendarElement);
					} else if (false !== ajaxSettings) {
						return ajaxEvents($calendarElement, year, month);
					}

					return true;
				}

				function jsonEvents($calendarElement) {
					var jsonData = $calendarElement.data('jsonData');
					$calendarElement.data('events', jsonData);
					drawEvents($calendarElement, 'json');
					return true;
				}

				function ajaxEvents($calendarElement, year, month) {
					var ajaxSettings = $calendarElement.data('ajaxSettings');

					if (typeof (ajaxSettings) != 'object'
							|| typeof (ajaxSettings.url) == 'undefined') {
						alert('Invalid calendar event settings');
						return false;
					}

					var data = {
						year : year,
						month : (month + 1)
					};

					$.ajax({
						type : 'GET',
						url : ajaxSettings.url,
						data : data,
						dataType : 'json'
					}).done(function(response) {
						var events = [];
						$.each(response, function(k, v) {
							events.push(response[k]);
						});
						$calendarElement.data('events', events);
						drawEvents($calendarElement, 'ajax');
					});

					return true;
				}

				function drawEvents($calendarElement, type) {
					var jsonData = $calendarElement.data('jsonData');
					var ajaxSettings = $calendarElement.data('ajaxSettings');

					var events = $calendarElement.data('events');
					if (events !== false) {
						$(events)
								.each(
										function(index, value) {
											var id = $calendarElement
													.attr('id')
													+ '_' + value.date;
											var $dowElement = $('#' + id);
											var $dayElement = $('#' + id
													+ '_day');

											$dowElement.data('hasEvent', true);

											if (typeof (value.title) !== 'undefined') {
												$dowElement.attr('title',
														value.title);
											}

											if (typeof (value.classname) === 'undefined') {
												$dowElement.addClass('event');
											} else {
												$dowElement
														.addClass('event-styled');
												$dayElement
														.addClass(value.classname);
											}

											if (typeof (value.badge) !== 'undefined'
													&& value.badge !== false) {
												var badgeClass = (value.badge === true) ? ''
														: ' badge-'
																+ value.badge;
												var dayLabel = $dayElement
														.data('day');
												$dayElement
														.html('<span class="badge badge-event'
																+ badgeClass
																+ '">'
																+ dayLabel
																+ '</span>');
											}

											if (typeof (value.body) !== 'undefined') {
												var modalUse = false;
												if (type === 'json'
														&& typeof (value.modal) !== 'undefined'
														&& value.modal === true) {
													modalUse = true;
												} else if (type === 'ajax'
														&& 'modal' in ajaxSettings
														&& ajaxSettings.modal === true) {
													modalUse = true;
												}

												if (modalUse === true) {
													$dowElement
															.addClass('event-clickable');

													var $modalElement = createModal(
															id, value.title,
															value.body,
															value.footer);
													$('body').append(
															$modalElement);

													$('#' + id)
															.click(
																	function() {
																		$(
																				'#'
																						+ id
																						+ '_modal')
																				.modal();
																	});
												}
											}
										});
					}
				}

				/* ----- Helper functions ----- */

				function isToday(year, month, day) {
					var todayObj = new Date();
					var dateObj = new Date(year, month, day);
					return (dateObj.toDateString() == todayObj.toDateString());
				}

				function dateAsString(year, month, day) {
					d = (day < 10) ? '0' + day : day;
					m = month + 1;
					m = (m < 10) ? '0' + m : m;
					return year + '-' + m + '-' + d;
				}

				function calcDayOfWeek(year, month, day) {
					var dateObj = new Date(year, month, day, 0, 0, 0, 0);
					var dow = dateObj.getDay();
					if (dow == 0) {
						dow = 6;
					} else {
						dow--;
					}
					return dow;
				}

				function calcLastDayInMonth(year, month) {
					var day = 28;
					while (checkValidDate(year, month + 1, day + 1)) {
						day++;
					}
					return day;
				}

				function calcWeeksInMonth(year, month) {
					var daysInMonth = calcLastDayInMonth(year, month);
					var firstDow = calcDayOfWeek(year, month, 1);
					var lastDow = calcDayOfWeek(year, month, daysInMonth);
					var days = daysInMonth;
					var correct = (firstDow - lastDow);
					if (correct > 0) {
						days += correct;
					}
					return Math.ceil(days / 7);
				}

				function checkValidDate(y, m, d) {
					return m > 0 && m < 13 && y > 0 && y < 32768 && d > 0
							&& d <= (new Date(y, m, 0)).getDate();
				}

				function checkMonthLimit(count, invert) {
					if (count === false) {
						count = 0;
					}
					var d1 = $calendarElement.data('currDate');
					var d2 = $calendarElement.data('initDate');

					var months;
					months = (d2.getFullYear() - d1.getFullYear()) * 12;
					months -= d1.getMonth() + 1;
					months += d2.getMonth();

					if (invert === true) {
						if (months < (parseInt(count) - 1)) {
							return true;
						}
					} else {
						if (months >= (0 - parseInt(count))) {
							return true;
						}
					}
					return false;
				}
			}); // each()

	return this;
};

/**
 * Default settings
 * 
 * @returns object language: string, year: integer, month: integer,
 *          show_previous: boolean|integer, show_next: boolean|integer,
 *          cell_border: boolean, today: boolean, show_days: boolean,
 *          weekstartson: integer (0 = Sunday, 1 = Monday), nav_icon: object:
 *          prev: string, next: string ajax: object: url: string, modal:
 *          boolean, legend: object array, [{type: string, label: string,
 *          classname: string}] action: function action_nav: function
 */
$.fn.zabuto_calendar_defaults = function() {
	var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth() + 1;
	var settings = {
		language : false,
		year : year,
		month : month,
		show_previous : true,
		show_next : true,
		cell_border : false,
		today : false,
		show_days : true,
		weekstartson : 1,
		nav_icon : false,
		data : false,
		ajax : false,
		legend : false,
		action : false,
		action_nav : false
	};
	return settings;
};

/**
 * Language settings
 * 
 * @param lang
 * @returns {{month_labels: Array, dow_labels: Array}}
 */
$.fn.zabuto_calendar_language = function(lang) {
	if (typeof (lang) == 'undefined' || lang === false) {
		lang = 'kr';
	}

	switch (lang.toLowerCase()) {

	case 'kr':
		return {
			month_labels : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
					"9월", "10월", "11월", "12월" ],
			dow_labels : [ "월", "화", "수", "목", "금", "토", "일" ]
		};
		break;

	}

};
