<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@include file="/WEB-INF/views/includes/header.jsp" %>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<%
    String ctx = request.getContextPath();
    pageContext.setAttribute("ctx", ctx);
%>
<link rel="stylesheet" href="/resources/css/scroll.css">
<title>마이페이지</title>
<body>
<a onclick="topFunction()" id="myBtn" title="Go to top"><img src="${ctx}/resources/img/GoToTop.png" width="50px;"></a>
<div class="container-fluid">
<div class="row d-flex d-md-block flex-nowrap wrapper">
<main id="main">

<div class="page-header row">
	<div class="col-2"></div>
	<div class="col-10">
	<br>
    <h2>${name}님의 마이페이지</h2>
    <input type='hidden' class="email" id="userEmail" value="${useremail}">
    <!-- js에서 	var userEmail = $(".email").val(); 이걸로 메일 호출 가능 -->
    <p>환영합니다!!</p>
    </div>
</div>

<div class="row">
		  <div class="col-2"></div>
		  <div class="col">
		    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
		      <a class="nav-link active" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true" style="padding:5px;">main</a>
		      <a class="nav-link" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false" style="padding:5px;">유저관리</a>
		      <a class="nav-link" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false" style="padding:5px;">병원관리</a>
		      <a class="nav-link" id="v-pills-4-tab" data-toggle="pill" href="#v-pills-4" role="tab" aria-controls="v-pills-4" aria-selected="false" style="padding:5px;">운영자 1:1 문의</a>
		      <a class="nav-link" id="v-pills-5-tab" data-toggle="pill" href="#v-pills-5" role="tab" aria-controls="v-pills-5" aria-selected="false" style="padding:5px;">몰라</a>
		    </div>
		  </div>
		  
		  <div class="col-6" style="border: 1.1px solid #04b1fb; border-radius: 4px;">
		    <div class="tab-content" id="v-pills-tabContent">
		    
		      <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-1-tab">
		      	<div class="todayReserve">
		      		<h2 align="center">예약 수</h2>
		      		<canvas id="myChart" width="400"></canvas>
		      	</div>
		      </div><!-- main -->
		      
		      <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-2-tab">
		      <br>
			  	<div class="container-fluid">          
				  <table class="table table-striped">
				    <thead>
				      <tr>
				        <th scope="col" class="mobile" style="text-align:center;">이름</th>
				        <th scope="col" class="mobile" style="text-align:center;">이메일</th>
				        <th scope="col" class="mobile" style="text-align:center;">전화번호</th>
				        <th scope="col" class="mobile" style="text-align:center;">가입일</th>
				        <th scope="col" class="mobile" style="width:80px; text-align:center;">삭제</th>
				      </tr>
				    </thead>
				    <tbody class="userList">
				      
				    </tbody>
				  </table>
				</div>
			   </div>
		     
		      <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-3-tab">
		      <br>
				<div class="container-fluid">          
				  <table class="table table-striped">
				    <thead>
				      <tr>
				        <th scope="col" class="mobile" style="text-align:center;">병원이름</th>
				        <th scope="col" class="mobile" style="text-align:center;">이메일</th>
				        <th scope="col" class="mobile" style="text-align:center;">전화번호</th>
				        <th scope="col" class="mobile" style="width:200px; text-align:center;">주소</th>
				        <th scope="col" class="mobile" style="width:60px; text-align:center;">삭제</th>
				      </tr>
				    </thead>
				    <tbody class="hospitalList">
				      
				    </tbody>
				  </table>
				</div>				
		      </div>
		      
		      <!-- 운영자 1:1 문의 -->
		      <div class="tab-pane" id="v-pills-4" role="tabpanel" aria-labelledby="v-pills-4-tab">
					<div id="main" class="col-md-12">
		       
			          <div class="row">
			      	     <div class="col-sm-10 msg">
			      	        <!-- admin message list 뜨는 곳  -->
			      	     </div>
			      	     <div class="col-sm-2"></div>
			      	  </div>

		       		</div>
		      </div><!-- 운영자 1:1 문의 -->
		      
		      <div class="tab-pane" id="v-pills-5" role="tabpanel" aria-labelledby="v-pills-5-tab">
		      	몰라
		      </div>
		    </div>
		  </div>
		  <div class="col-2"></div>
  
</div>

            
</main>
</div>
</div>

<!-- Bootstrap core JavaScript -->
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${ctx}/resources/js/user/adminFunction.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/admin.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/scroll.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/user/messageFunction.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<script>
$(document).ready(function() {
	var msgSpace = $(".msg");
	
	
	msgSpace.on("click", ".userBtn", function (e) {
	    var mgroup = $(this).attr("data-cno");
	    var mail = $(this).attr("data-mail");
	    var msg = $("."+mgroup).val();
    
		console.log(mgroup);
		console.log(mail);
		console.log(msg);
		
		var reply = {
			body : msg,
			mgroup : mgroup,
			userEmail : mail
		};
		
		messageService.reply(reply, function(result){
			console.log(result);
			showMessageList();
		},function(error){
			console.log('에러낫다링');
		});
		
	});
	
	
	
	showMessageList();
	
    function showMessageList() {
    	
    	messageService.getAdminList(function(list) {
    		
            var str = "";
            if (list == null || list.length == 0) {
            	
            	str += "<div class='card-body primary-font'> 아직 등록된 글이 없습니다.</div>";
            	
            	msgSpace.html(str);
            	return;
            }
            msgSpace.html("");
            for (let i = 0, len = list.length || 0; i < len; i++) {
                let type = list[i].type;
                let group = list[i].mgroup;
                
                // 운영자 답변이 있는지 없는지 체크
                let replyCheck = true;
                
                // send 타입이면 출력 
                if (type === 'send') {
                	
					// 동물캐릭터사진 무작위로 뽑기 위해서,,,
                	var random = Math.floor(Math.random() * 10) + 1;
                	
                    for (let j = 0, len = list.length || 0; j < len; j++) {
                        // 문의와 답변이 같이 있다면 아래의 태그를 출력
                    	if (list[j].mgroup === group && list[j].type === 'reply') {
                    		
    		                str += "<div class='row'>";
    		                str += "  <div class='media border-0 p-3 col-sm-7'>";
    		                str += "    <img src='/resources/img/animal/animal"+random+".png' class='mr-3 mt-2' style='width:60px; padding:5px;'>";
    		                str += "    <div class='media-body'>";
    		                str += "      <h4>" + list[i].userEmail + "<small><i>&nbsp;&nbsp;&nbsp; Posted on " +messageService.displayTime(list[i].createdDate)+ " ";
    		                str += "	   </i></small></h4>";
			                str += "      <p>"+ list[i].body + "</p>";      
			                str += "    </div>";
			                str += "  </div>";
			                str += "  <div class='col-sm-5'></div>";
			                str += "</div>";
			                
			                str += "<div class='row'>";
			                str += "  <div class='col-sm-6'></div>";
			                str += "  <div class='media border-0 p-3 col-sm-6'>";
			                str += "    <div class='media-body'>";
			                str += "      <h4>" + list[j].name + "<small><i>&nbsp;&nbsp;&nbsp;Posted on " +messageService.displayTime(list[j].createdDate)+ "</i></small></h4>";
			                str += "      <p>"+ list[j].body + "</p>";      
			                str += "    </div>";
			                str += "    <img src='/resources/img/baba.png' class='mr-2 mt-2' style='width:60px; padding-left:10px;'>";
			                str += "  </div>";
			                str += "</div><hr>";
	                
                            // 답변 있는지 없는지 체크 
                            replyCheck = false;
                        } 
                    }
                    
                    // replyCheck true이면 문의는 했지만 답변 못받음  
                    if(replyCheck) {
                    	
		                str += "<div class='row'>";
		                str += "  <div class='media border-0 p-3 col-sm-7'>";
		                str += "    <img src='/resources/img/animal/animal"+random+".png' class='mr-3 mt-2' style='width:60px; padding:5px;'>";
		                str += "    <div class='media-body'>";
		                str += "      <h4>" + list[i].userEmail + "<small><i>&nbsp;&nbsp;&nbsp; Posted on " +messageService.displayTime(list[i].createdDate)+ " ";
		                str += "	   </i></small></h4>";
		                str += "      <p>"+ list[i].body + "</p>";
		                str += "    </div>";
		                str += "  </div>";
		                str += "  <div class='col-sm-5'></div>";
		                str += "</div>";
		                
		                str += "<div class='row'>";
		                str += "  <div class='col-sm-6'></div>";
		                str += "  <div class='media border-0 p-3 col-sm-6'>";
		                str += "    <div class='media-body'>";
		                str += "      <p><textarea class='form-control "+list[i].contentId+"' name='toUser' rows='3' style='resize:none;'></textarea></p>";      
		                str += "    </div>";
		                str += "    <button id='userBtn' class='btn btn-sm btn-secondary userBtn ml-3 ";
		                str += "      mt-4' data-mail='"+list[i].userEmail+"' data-cno='"+list[i].contentId+"' '>답장</button>";
		                str += "  </div>";
		                str += "</div><hr>";
                    }
                    
                }
            }
            msgSpace.html(str);
        });
    }
	
	
});
</script>
<script>
// date, 요일 관련
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();

if(dd<10) {
    dd='0'+dd
} 

if(mm<10) {
    mm='0'+mm
}

var week = new Array('일', '월', '화', '수', '목', '금', '토');

console.log(week[today.getDay()]);
// date, 요일관련 끝!

var ctx = document.getElementById("myChart"); //캔버스 id값 가져오기
var myChart = new Chart(ctx, {
    type: 'bar', //그래프 형태 지정하기
    data: { labels: [yyyy + '-' + mm + '-' + dd, 
			         yyyy + '-' + mm + '-' + (dd + 1),
			         yyyy + '-' + mm + '-' + (dd + 2),
			         yyyy + '-' + mm + '-' + (dd + 3),
			         yyyy + '-' + mm + '-' + (dd + 4),
			         yyyy + '-' + mm + '-' + (dd + 5),
			         yyyy + '-' + mm + '-' + (dd + 6)], //X축 제목
        datasets: [{
            label: '# 요일별예약건수',
            data: [5, 10, 3, 5, 2, 3, 10],
            backgroundColor: [
                '#ffcccc', //1번째 그래프의 바탕색
                '#ffd9cc',
                '#fff2cc',
                '#e6ffcc',
                '#ccf2ff',
                '#ccd9ff',
                '#e6ccff'
            ],
            borderColor: [
            	'#ffcccc', //1번째 그래프의 선색
            	'#ffd9cc',
                '#fff2cc',
                '#e6ffcc',
                '#ccf2ff',
                '#ccd9ff',
                '#e6ccff'
            ],
            borderWidth: 1 //선굵기
        }]
    },
    options: {
        scales: { //X,Y축 옵션
            yAxes: [{
                ticks: {
                    beginAtZero:true  //Y축의 값이 0부터 시작
                }
            }]
        }
    }
});
</script>

<%@include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>