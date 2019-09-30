<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%
	String ctx = request.getContextPath();
	pageContext.setAttribute("ctx", ctx);
%>
<!doctype html>
<html>
<head>
<title>커뮤니티 웹 사이트</title>
<meta charset="utf-8">
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
		<!-- 부트스트랩 자바스크립트 추가하기 -->
		<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">


<style>

div.zabuto_calendar {
    margin: 0;
    padding: 0;
}

div.zabuto_calendar .table {
    width: 500px;
    margin: 0;
    padding: 0;
}

div.zabuto_calendar .table th,
div.zabuto_calendar .table td {
    padding: 4px 2px;
    text-align: center;
}

div.zabuto_calendar .table tr th,
div.zabuto_calendar .table tr td {
    background-color: #ffffff;
}

div.zabuto_calendar .table tr.calendar-month-header th {
    background-color: #fafafa;
}

div.zabuto_calendar .table tr.calendar-month-header th span {
    cursor: pointer;
    display: inline-block;
    padding-bottom: 10px;
}

div.zabuto_calendar .table tr.calendar-dow-header th {
    background-color: #f0f0f0;
}

div.zabuto_calendar .table tr:last-child {
    border-bottom: 1px solid #dddddd;
}

div.zabuto_calendar .table tr.calendar-month-header th {
    padding-top: 12px;
    padding-bottom: 4px;
}

div.zabuto_calendar .table-bordered tr.calendar-month-header th {
    border-left: 0;
    border-right: 0;
}

div.zabuto_calendar .table-bordered tr.calendar-month-header th:first-child {
    border-left: 1px solid #dddddd;
}

div.zabuto_calendar div.calendar-month-navigation {
    cursor: pointer;
    margin: 0;
    padding: 0;
    padding-top: 5px;
}

div.zabuto_calendar tr.calendar-dow-header th,
div.zabuto_calendar tr.calendar-dow td {
    width: 14%;
}

div.zabuto_calendar .table tr td div.day {
    margin: 0;
    padding-top: 7px;
    padding-bottom: 7px;
}

/* actions and events */
div.zabuto_calendar .table tr td.event div.day,
div.zabuto_calendar ul.legend li.event {
    background-color: #fff0c3;
}

div.zabuto_calendar .table tr td.dow-clickable,
div.zabuto_calendar .table tr td.event-clickable {
    cursor: pointer;
}

/* badge */
div.zabuto_calendar .badge-today,
div.zabuto_calendar div.legend span.badge-today {
    background-color: #357ebd;
    color: #ffffff;
    text-shadow: none;
}

div.zabuto_calendar .badge-event,
div.zabuto_calendar div.legend span.badge-event {
    background-color: #ff9b08;
    color: #ffffff;
    text-shadow: none;
}

div.zabuto_calendar .badge-event {
    font-size: 0.95em;
    padding-left: 8px;
    padding-right: 8px;
    padding-bottom: 4px;
}

/* legend */
div.zabuto_calendar div.legend {
    margin-top: 5px;
    text-align: right;
}

div.zabuto_calendar div.legend span {
    color: #999999;
    font-size: 10px;
    font-weight: normal;
}

div.zabuto_calendar div.legend span.legend-text:after,
div.zabuto_calendar div.legend span.legend-block:after,
div.zabuto_calendar div.legend span.legend-list:after,
div.zabuto_calendar div.legend span.legend-spacer:after {
    content: ' ';
}

div.zabuto_calendar div.legend span.legend-spacer {
    padding-left: 25px;
}

div.zabuto_calendar ul.legend > span {
    padding-left: 2px;
}

div.zabuto_calendar ul.legend {
    display: inline-block;
    list-style: none outside none;
    margin: 0;
    padding: 0;
}

div.zabuto_calendar ul.legend li {
    display: inline-block;
    height: 11px;
    width: 11px;
    margin-left: 5px;
}

div.zabuto_calendar ul.legend
div.zabuto_calendar ul.legend li:first-child {
    margin-left: 7px;
}

div.zabuto_calendar ul.legend li:last-child {
    margin-right: 5px;
}

div.zabuto_calendar div.legend span.badge {
    font-size: 0.9em;
    border-radius: 5px 5px 5px 5px;
    padding-left: 5px;
    padding-right: 5px;
    padding-top: 2px;
    padding-bottom: 3px;
}

/* responsive */
@media (max-width: 979px) {
    div.zabuto_calendar .table th,
    div.zabuto_calendar .table td {
        padding: 2px 1px;
    }
}
    #bb,.zabuto_calendar,
    #aa {
      display: inline;
    }
    
   #my-calendar,
    #aa {
      display: inline;
    }
    
    
    .day{
    cursur : pointer;
    }
    
    td{
   text-align:center
    }
    
ul.animallist, ol.animallist {
    list-style: none;
    margin: 0px;
    padding: 0px;
  
    max-width: 900px;
    width: 100%;
}
  
ul.animallist li, ol.animallist li {
	background-color: white; 
    display: inline-block;
    padding: 10px;
    margin-bottom: 5px;
    border: 1px solid black;
    font-size: 15px;
    cursor: pointer;
}
</style>

</head>

<title>풀캘린더</title>
<body>
<div class="text-center"><h1>예약관리</h1></div>

<br>
<br>

 




<div class="container">
      <div class="row"> 
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
<div id="my-calendar"></div>

<form  action ='/reserve'onsubmit="return check()" method="POST">
<br>
<input type="hidden" id='d' name='reservedate' value=''>   
<input type="hidden" id='t' name='reservetime' value=''>
<input type="hidden" id='animal' name='animalId' value=''>  
<input type="hidden" id='hospital' name='hospitalId' value='${hos.hospitalId}'>  
<input type="hidden" id='userEmail' name='userEmail' value=<sec:authentication property="principal.username"/>>
<input type="hidden" id='animalId' name='animalId' value=''>

<div id='reservedate'>예약날짜</div> 
<div id='reservetime'> 예약시간</div>
<br>
<h3>동물선택</h3>
<ul class="animallist">
  
<c:forEach items="${animal}" var="animallist">

	<li id="${animallist.animalId}">${animallist.name}</li>

</c:forEach>
        
    </ul>

<br>


<div class="timetable">  

<table class="table table-bordered">
  <thead>
    <tr>
      <th scope="col" colspan="4" style="text-align:center">예약시간</th>
    </tr>
  </thead>
  <tbody id="tt">  <!-- 테이블작성 -->
    <tr>
      
    </tr>
   
  </tbody>
</table>
<button type ="submit"" style='float: right')>예약하기</button>
</form>
<script>  		//예약시간 생성 

function check() {

	  if($('#d').val() == "") {

	    alert("날짜를 입력해 주세요.");

	    

	    return false;

	  }

	  else if($('#t').val() == "") {

	    alert("시간을 입력해 주세요.");

	    return false;

	  }

	  else return "index";
}



var start = '${hos.treatStart}';
var end = '${hos.treatEnd}';

var sft = start.substr(0,2);

var eft = end.substr(0,2);
var eet = end.substr(3);
var rowcount =0;
var count=0;
var set='00'
var sset='30';
sft = parseInt(sft); // start 앞넘버값

eft = parseInt(eft); // end 앞넘버값



for(sft,count,rowcount;sft<eft;sft++,count++){
	var obj =$('#tt tr');
	if(count<2){
		obj.eq(rowcount).append('<td>'+sft+':'+set+'</td>')
		obj.eq(rowcount).append('<td>'+sft+':'+sset+'</td>')
	}
	
	
	if(count==2){
		$('#tt').append('<tr><td>'+sft+':'+set+'</td><td>'+sft+':'+sset+'</td></tr>')
		rowcount++;
		count = 0;
		
	}
	
	
	
}








</script>


</div> <!-- 타임테이블 -->

        </div><!--(./col-lg-12 col-md-12 col-sm-12 col-xs-12"BELOW ROW:)-->
      </div><!--(./row)-->
    </div><!--(./COntainer")-->
    
    
    
</body>



<script>

$.fn.zabuto_calendar = function (options) {
    var opts = $.extend({}, $.fn.zabuto_calendar_defaults(), options);
    var languageSettings = $.fn.zabuto_calendar_language(opts.language);
    opts = $.extend({}, opts, languageSettings);

    this.each(function () {
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

        function drawCalendar() { 		//처음에 달력 그려주기
            var dateInitYear = parseInt($calendarElement.data('initYear'));
            var dateInitMonth = parseInt($calendarElement.data('initMonth')) - 1;
            var dateInitObj = new Date(dateInitYear, dateInitMonth, 1, 0, 0, 0, 0);
            $calendarElement.data('initDate', dateInitObj);

            var tableClassHtml = ($calendarElement.data('cellBorder') === true) ? ' table-bordered' : '';

            $tableObj = $('<table class="table' + tableClassHtml + '"></table>');
            $tableObj = drawTable($calendarElement, $tableObj, dateInitObj.getFullYear(), dateInitObj.getMonth());

         

            var $containerHtml = $('<div class="zabuto_calendar" id="' + $calendarElement.attr('id') + '"></div>');
            $containerHtml.append($tableObj);
         

            $calendarElement.append($containerHtml);

            var jsonData = $calendarElement.data('jsonData');
            if (false !== jsonData) {
                checkEvents($calendarElement, dateInitObj.getFullYear(), dateInitObj.getMonth());
            }
        }

        function drawTable($calendarElement, $tableObj, year, month) { 	//테이블 만들어주는매서드
            var dateCurrObj = new Date(year, month, 1, 0, 0, 0, 0);
            $calendarElement.data('currDate', dateCurrObj);

            $tableObj.empty();
            $tableObj = appendMonthHeader($calendarElement, $tableObj, year, month);
            $tableObj = appendDayOfWeekHeader($calendarElement, $tableObj);
            $tableObj = appendDaysOfMonth($calendarElement, $tableObj, year, month);
            checkEvents($calendarElement, year, month);
            return $tableObj;
        }

       

        function appendMonthHeader($calendarElement, $tableObj, year, month) {		//위에 이전 다음 아이콘
            var navIcons = $calendarElement.data('navIcons');
            var $prevMonthNavIcon = $('<span><span class="glyphicon glyphicon-chevron-left"></span></span>');
            var $nextMonthNavIcon = $('<span><span class="glyphicon glyphicon-chevron-right"></span></span>');
            if (typeof(navIcons) === 'object') {
                if ('prev' in navIcons) {
                    $prevMonthNavIcon.html(navIcons.prev);
                }
                if ('next' in navIcons) {
                    $nextMonthNavIcon.html(navIcons.next);
                }
            }

            var prevIsValid = $calendarElement.data('showPrevious');		//이전 보여주기는것
            if (typeof(prevIsValid) === 'number' || prevIsValid === false) {
                prevIsValid = checkMonthLimit($calendarElement.data('showPrevious'), true);
            }

            var $prevMonthNav = $('<div class="calendar-month-navigation"></div>');			//이전달 
            $prevMonthNav.attr('id', $calendarElement.attr('id') + '_nav-prev');
            $prevMonthNav.data('navigation', 'prev');
            if (prevIsValid !== false) {
                prevMonth = (month - 1);
                prevYear = year;
                if (prevMonth == -1) {
                    prevYear = (prevYear - 1);
                    prevMonth = 11;
                }
                $prevMonthNav.data('to', {year: prevYear, month: (prevMonth + 1)});
                $prevMonthNav.append($prevMonthNavIcon);
                if (typeof($calendarElement.data('actionNavFunction')) === 'function') {
                    $prevMonthNav.click($calendarElement.data('actionNavFunction'));
                }
                $prevMonthNav.click(function (e) {
                    drawTable($calendarElement, $tableObj, prevYear, prevMonth);
                });
            }

            var nextIsValid = $calendarElement.data('showNext');
            if (typeof(nextIsValid) === 'number' || nextIsValid === false) {
                nextIsValid = checkMonthLimit($calendarElement.data('showNext'), false);
            }

            var $nextMonthNav = $('<div class="calendar-month-navigation"></div>');
            $nextMonthNav.attr('id', $calendarElement.attr('id') + '_nav-next');
            $nextMonthNav.data('navigation', 'next');
            if (nextIsValid !== false) {
                nextMonth = (month + 1);
                nextYear = year;
                if (nextMonth == 12) {
                    nextYear = (nextYear + 1);
                    nextMonth = 0;
                }
                $nextMonthNav.data('to', {year: nextYear, month: (nextMonth + 1)});
                $nextMonthNav.append($nextMonthNavIcon);
                if (typeof($calendarElement.data('actionNavFunction')) === 'function') {
                    $nextMonthNav.click($calendarElement.data('actionNavFunction'));
                }
                $nextMonthNav.click(function (e) {
                    drawTable($calendarElement, $tableObj, nextYear, nextMonth);
                });
            }

            var monthLabels = $calendarElement.data('monthLabels');

            var $prevMonthCell = $('<th></th>').append($prevMonthNav);
            var $nextMonthCell = $('<th></th>').append($nextMonthNav);

            var $currMonthLabel = $('<span>' + monthLabels[month] + ' ' + year + '</span>');
            $currMonthLabel.dblclick(function () {
                var dateInitObj = $calendarElement.data('initDate');
                drawTable($calendarElement, $tableObj, dateInitObj.getFullYear(), dateInitObj.getMonth());
            });

            var $currMonthCell = $('<th colspan="5"></th>');
            $currMonthCell.append($currMonthLabel);

            var $monthHeaderRow = $('<tr class="calendar-month-header"></tr>');
            $monthHeaderRow.append($prevMonthCell, $currMonthCell, $nextMonthCell);

            $tableObj.append($monthHeaderRow);
            return $tableObj;
        }

        function appendDayOfWeekHeader($calendarElement, $tableObj) {
            if ($calendarElement.data('showDays') === true) {
                var weekStartsOn = $calendarElement.data('weekStartsOn');
                var dowLabels = $calendarElement.data('dowLabels');
                if (weekStartsOn === 0) {
                    var dowFull = $.extend([], dowLabels);
                    var sunArray = new Array(dowFull.pop());
                    dowLabels = sunArray.concat(dowFull);
                }

                var $dowHeaderRow = $('<tr class="calendar-dow-header"></tr>');
                $(dowLabels).each(function (index, value) {
                    $dowHeaderRow.append('<th>' + value + '</th>');
                });
                $tableObj.append($dowHeaderRow);
            }
            return $tableObj;
        }

        function appendDaysOfMonth($calendarElement, $tableObj, year, month) {
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
                if (firstDow == 6 && (lastDow == 0 || lastDow == 1 || lastDow == 5)) {
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
                    if (dow < firstDow || currDayOfMonth > lastDayinMonth) {
                        $dowRow.append('<td></td>');
                    } else {
                        var dateId = dateAsString(year, month, currDayOfMonth);
                        var dayId = dateId;

                        var $dayElement = $('<div id="' + dayId + '" class="day"'+ 'value="'+ dateId +'">' + currDayOfMonth + '</div>');
                        $dayElement.data('day', currDayOfMonth);

                        if ($calendarElement.data('showToday') === true) {
                            if (isToday(year, month, currDayOfMonth)) {
                                $dayElement.html('<span class="badge badge-today">' + currDayOfMonth + '</span>');
                            }
                        }

                        var $dowElement = $('<td id="' + dateId + '"></td>');
                        $dowElement.append($dayElement);

                        $dowElement.data('date', dateAsString(year, month, currDayOfMonth));
                        $dowElement.data('hasEvent', false);

                        if (typeof($calendarElement.data('actionFunction')) === 'function') {
                            $dowElement.addClass('dow-clickable');
                            $dowElement.click(function () {
                                $calendarElement.data('selectedDate', $(this).data('date'));
                            });
                            $dowElement.click($calendarElement.data('actionFunction'));
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
            var $modalHeaderTitle = $('<h4 class="modal-title" id="' + id + '_modal_title">' + title + '</h4>');

            var $modalHeader = $('<div class="modal-header"></div>');
            $modalHeader.append($modalHeaderButton);
            $modalHeader.append($modalHeaderTitle);

            var $modalBody = $('<div class="modal-body" id="' + id + '_modal_body">' + body + '</div>');

            var $modalFooter = $('<div class="modal-footer" id="' + id + '_modal_footer"></div>');
            if (typeof(footer) !== 'undefined') {
                var $modalFooterAddOn = $('<div>' + footer + '</div>');
                $modalFooter.append($modalFooterAddOn);
            }

            var $modalContent = $('<div class="modal-content"></div>');
            $modalContent.append($modalHeader);
            $modalContent.append($modalBody);
            $modalContent.append($modalFooter);

            var $modalDialog = $('<div class="modal-dialog"></div>');
            $modalDialog.append($modalContent);

            var $modalFade = $('<div class="modal fade" id="' + id + '_modal" tabindex="-1" role="dialog" aria-labelledby="' + id + '_modal_title" aria-hidden="true"></div>');
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

            if (typeof(ajaxSettings) != 'object' || typeof(ajaxSettings.url) == 'undefined') {
                alert('Invalid calendar event settings');
                return false;
            }

            var data = {year: year, month: (month + 1)};

            $.ajax({
                type: 'GET',
                url: ajaxSettings.url,
                data: data,
                dataType: 'json'
            }).done(function (response) {
                var events = [];
                $.each(response, function (k, v) {
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
                $(events).each(function (index, value) {
                    var id = $calendarElement.attr('id') + '_' + value.date;
                    var $dowElement = $('#' + id);
                    var $dayElement = $('#' + id + '_day');

                    $dowElement.data('hasEvent', true);

                    if (typeof(value.title) !== 'undefined') {
                        $dowElement.attr('title', value.title);
                    }

                    if (typeof(value.classname) === 'undefined') {
                        $dowElement.addClass('event');
                    } else {
                        $dowElement.addClass('event-styled');
                        $dayElement.addClass(value.classname);
                    }

                    if (typeof(value.badge) !== 'undefined' && value.badge !== false) {
                        var badgeClass = (value.badge === true) ? '' : ' badge-' + value.badge;
                        var dayLabel = $dayElement.data('day');
                        $dayElement.html('<span class="badge badge-event' + badgeClass + '">' + dayLabel + '</span>');
                    }

                    if (typeof(value.body) !== 'undefined') {
                        var modalUse = false;
                        if (type === 'json' && typeof(value.modal) !== 'undefined' && value.modal === true) {
                            modalUse = true;
                        } else if (type === 'ajax' && 'modal' in ajaxSettings && ajaxSettings.modal === true) {
                            modalUse = true;
                        }

                        if (modalUse === true) {
                            $dowElement.addClass('event-clickable');

                            var $modalElement = createModal(id, value.title, value.body, value.footer);
                            $('body').append($modalElement);

                            $('#' + id).click(function () {
                                $('#' + id + '_modal').modal();
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
            return m > 0 && m < 13 && y > 0 && y < 32768 && d > 0 && d <= (new Date(y, m, 0)).getDate();
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
 * @returns object
 *   language:          string,
 *   year:              integer,
 *   month:             integer,
 *   show_previous:     boolean|integer,
 *   show_next:         boolean|integer,
 *   cell_border:       boolean,
 *   today:             boolean,
 *   show_days:         boolean,
 *   weekstartson:      integer (0 = Sunday, 1 = Monday),
 *   nav_icon:          object: prev: string, next: string
 *   ajax:              object: url: string, modal: boolean,
 *   legend:            object array, [{type: string, label: string, classname: string}]
 *   action:            function
 *   action_nav:        function
 */
$.fn.zabuto_calendar_defaults = function () {
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var settings = {
        language: false,
        year: year,
        month: month,
        show_previous: true,
        show_next: true,
        cell_border: false,
        today: false,
        show_days: true,
        weekstartson: 1,
        nav_icon: false,
        data: false,
        ajax: false,
        legend: false,
        action: false,
        action_nav: false
    };
    return settings;
};

/**
 * Language settings
 *
 * @param lang
 * @returns {{month_labels: Array, dow_labels: Array}}
 */
$.fn.zabuto_calendar_language = function (lang) {
    if (typeof(lang) == 'undefined' || lang === false) {
        lang = 'kr';
    }

    switch (lang.toLowerCase()) {
     

        case 'kr':
            return {
                month_labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                dow_labels: ["월", "화", "수", "목", "금", "토", "일"]
            };
            break;

     
    }

};


   $(document).ready(function () {
	   
	   
    $("#my-calendar").zabuto_calendar({
     
      ajax: {
        url: "show_data.php?grade=1"
      }
    });
    
    /* $('#tt').on('click','td',function(e){alert($('this').text())}) */
  
        $("#tt tr td").click(function(){
            var txt = $(this).text();
            var reservett = document.getElementById('reservetime').innerHTML;
            var reservedt = document.getElementById('reservedate').innerHTML;
            $('#tt tr td').css('background-color','white');
            if(reservedt.length<5){
            	alert('날짜먼저 선택해주세요');
            	
            }
            else { document.getElementById('reservetime').innerHTML="예약시간 : "+txt;
            $('#t').val(txt);
            $(this).css({"background-color": "#CEECF5"});	
            
            }
            
            
        });
	
        $('#tt').on('mouseenter','td',function(e){$('td').css('cursor','pointer');}) //마우스커서 바꾸기
    $('#my-calendar').on('mouseenter','.day',function(e){$('.day').css('cursor','pointer');}) //마우스커서 바꾸기
    //날짜입력, 클릭시 색바꿈
    $('#my-calendar').on('click','.day',function(e){$('#reservedate').html("예약날짜 :  "+$(this).attr('id')); $('.day').css('background-color','white'); $(this).css('background-color','#CEECF5');
    $('#d').val($(this).attr('id')) });
   	$('.animallist').on('click','li',function(e){$('#animalId').val($(this).attr("id")); $('li').css('background-color','white'); $(this).css('background-color','#CEECF5');});
        
   });

   
   
</script>

</html>
