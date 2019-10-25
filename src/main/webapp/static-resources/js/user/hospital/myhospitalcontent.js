$(document).ready(function() {
	console.log("myhospitalpage");
	
	var userEmail = $(".email").val();
	
	var qqq = $(".qqq"); // Q&A
	var answerCount = $(".answerCount");

	
    showQnaList(1);

    function showQnaList(page){
	MyHospitalContentService.getHospitalQList(userEmail, function(list) {
		var count = 0;
		var str = "";
		
		if (list == null || list.length == 0) {
        	return;
        }
		
        for (let i = 0, len = list.length || 0; i < len; i++) {
        	
            let type = list[i].qnaType;
            let group = list[i].cgroup;
            
            // A가 있는지 없는지 체크
            let aCheck = true;
            
            // Q 타입이면 출력 
            if (type === 'Q') {
   
                for (let j = 0, len = list.length || 0; j < len; j++) {

                	// (제목?)내용이 너무 길면 20자 내로 자르기
                	var iBody = list[i].body;
                	if(iBody.length > 20){
                		iBody = iBody.substring(0,19);
                	}
                	
                    // 같은 그룹의 A가 있다면 A 출력 태그
                	if (list[j].cgroup === group && list[j].qnaType === 'A') {
                		
                		// Q 출력 태그
                        str += "<div class='qqqaaa' data-qno='"+list[i].contentId+"' style='cursor:pointer'>";
                        str += "   &nbsp;&nbsp;&nbsp;&nbsp;<span style='color:#04b1fb;'>답변완료</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+ iBody + " ";
                        str += "	  <small class='float-right text-muted'>" + list[i].userEmail + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + MyHospitalContentService.displayTime(list[i].createdDate) + "</small>";
                        str += "</div><hr>";
                        
                        str += "<div class='card-body collapse "+list[i].contentId+"'>";
                        str += "   <img src='/resources/img/q.png' style='width:50px'> " + list[i].body + " <br><br>";
                        str += "   <img src='/resources/img/a.png' style='width:50px'> " + list[j].body + "&nbsp;&nbsp;&nbsp;<span class='del' data-ano='"+list[j].contentId+"' ";
                        str += "        style='cursor:pointer; font-weight:bold; color:#04b1fb'>X</span> <br>";
                        str += "	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<small class='primary-font text-muted'> "+list[j].name+ " ";
                        str += "	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +MyHospitalContentService.displayTime(list[j].createdDate)+ "</small><br><br>";
                        str += "<hr></div>";
                        
                        // A가 있는지 없는지 체크 
                        aCheck = false;
                    } 

                }
                
             // aCheck true이면 Q는 있지만 A는 없음 
                if(aCheck) {
                	
            		// Q 출력 태그
                    str += "<div class='qqqaaa' data-qno='"+list[i].contentId+"' style='cursor:pointer'>";
                    str += "   &nbsp;&nbsp;&nbsp;&nbsp;<span style='color:lightgray;'>검토중</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+ iBody + " ";
                    str += "	  <small class='float-right text-muted'>" + list[i].userEmail + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + MyHospitalContentService.displayTime(list[i].createdDate) + "</small>";
                    str += "</div><hr>";
                	
                    str += "<div class='card-body collapse "+list[i].contentId+"'>";
                    str += "   <img src='/resources/img/q.png' style='width:50px'> " + list[i].body + " <br><br>";
                    
                    str += "   <div class='row'><div class='col-sm-10'>";
                    str += "      <textarea class='form-control aaa"+list[i].contentId+"' id='body' name='body' rows='3'></textarea></div>";
                    str += "      <div class='col-sm-2'>"
                    str += "      <button id='userBtn' class='btn btn-sm btn-secondary answerBtn' data-hno = '"+list[i].hospitalId+"' data-cno='"+list[i].contentId+"'>답변</button>";
                    str += "   </div></div>";
                    str += "<hr></div>";
                    
                    count++;
                
                }
                
            }
        }
		qqq.html(str);
		answerCount.html("새로운 질문이 " + count+"건 있습니다.");
		
		}); // getQList
    }
    
    
    
    // collapse
    qqq.on("click", ".qqqaaa", function(e){
    	var qno = $(this).attr("data-qno");
    	$("."+qno).collapse('toggle');
    });

    
    // Answer Insert
    qqq.on("click", ".answerBtn", function(e){
    	var qno = $(this).attr("data-cno");
    	var body = $(".aaa"+qno).val();
    	var hospitalId = $(this).attr("data-hno");
    	
    	// 유효성 체크
    	if(body.trim() === ""){
    		alert("내용을 입력하세요!");
    		return;
    	}
    	
    	MyHospitalContentService.insertAnswer({
    		body : body,
    		userEmail : userEmail,
    		hospitalId : hospitalId,
    		cgroup : qno
    	},
    	function(result){
    		console.log(result);
    		showQnaList(1);
    		
    	});
    });
    
    
    // 해당 병원 Q&A에서 A 삭제
    qqq.on("click", ".del", function (e) {

        var ano = $(this).attr("data-ano");
        
        MyHospitalContentService.removeA(ano, function(result){
        		showQnaList(1);
        }, function(err) {
        	console.log('A Delete ERROR....');
        });

        alert("처리되었습니다");

    });
    
    
    
});