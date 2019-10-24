 $(document).ready(function () {

        var qq = $(".qq");
        var hospitalId = qq.find("input[id='hospitalId']");
        var userEmail = qq.find("input[id='email']");
        var qnaBody = qq.find("textarea[id='body']");
        
        var qna = $(".qnaqna");

        showQnaList(1);

        function showQnaList(page) {
            qnaService.getList({hospitalId: hospitalId.val()}, function (list) {
                var str = "";

                if (list == null || list.length == 0) {
                	
                	str += "<div class='card-body primary-font'> 아직 등록된 글이 없습니다.</div>";
                	
                	qna.html(str);
                	return;
                }

                qna.html("");

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
                        		iBody = iBody.substring(0,19) + " (...)";
                        	}
                        	
                            // 같은 그룹의 A가 있다면 A 출력 태그
                        	if (list[j].cgroup === group && list[j].qnaType === 'A') {
                        		
                        		// Q 출력 태그
                                str += "<div class='qqqaaa' data-qno='"+list[i].contentId+"' style='cursor:pointer'>";
                                str += "   &nbsp;&nbsp;&nbsp;&nbsp;<span style='color:#04b1fb;'>답변완료</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+ iBody + " ";
                                str += "	  <small class='float-right text-muted'>" + list[i].userEmail + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + qnaService.displayTime(list[i].createdDate) + "</small>";
                                str += "   </div><hr>";
                                
                                str += "<div class='card-body collapse "+list[i].contentId+"'>";
                                str += "   <img src='/resources/img/q.png' style='width:30px'> " + list[i].body + " <br><br>";
                                str += "   <img src='/resources/img/a.png' style='width:30px'> " + list[j].body + " <br>";
                                str += "	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<small class='primary-font text-muted'> "+list[j].name+ " ";
                                str += "	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +qnaService.displayTime(list[j].createdDate)+ "</small><br><br>";
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
                            str += "	  <small class='float-right text-muted'>" + list[i].userEmail + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + qnaService.displayTime(list[i].createdDate) + "</small>";
                            str += "   </div><hr>";
                        	
                            str += "<div class='card-body collapse "+list[i].contentId+"'>";
                            str += "   <img src='/resources/img/q.png' style='width:30px'> " + list[i].body + " <br><br>";
                            str += "<hr></div>";
                        }
                        
                        
                    }
                }

                qna.html(str);
            });
        }
        
        
        // collapse
        qna.on("click", ".qqqaaa", function(e){
        	var qno = $(this).attr("data-qno");
        	$("."+qno).collapse('toggle');
        });


        // Question Add
        var submitBtn = $("#regBtn");

        submitBtn.on("click", function (e) {
        	
        	// 유효성 체크
        	if(qnaBody.val().trim() == "" || qnaBody.val().trim() == null){
        		alert("내용을 입력하세요!");
        		return;
        	}
        	
        	console.log('useremail : ' + userEmail.val());
        	
        	qnaService.addQuestion(
        			{
        				body: qnaBody.val(),
        				hospitalId : hospitalId.val(),
        				qnaType : "Q"
        			},
        			
        			function(result) {
        				console.log(result);
        				
        				 // DB에 insert 후 글 목록 리셋
        			     showQnaList(1);
                         // textarea 리셋
                         $(".txt").val('');
        				
        		}, function(error){
        			alert("일반회원만 입력가능합니다.");
        			$(".txt").val('');
        		});

        });
        
        
        
        // Answer Insert
        qna.on("click", ".answerBtn", function(e){
        	var qno = $(this).attr("data-qno");
        	var body = $("."+qno).val();
        	
        	// 유효성 체크
        	if(body.trim() === ""){
        		alert("내용을 입력하세요!");
        		return;
        	}
        	
        	qnaService.addAnswer({
        		body : body,
        		userEmail : userEmail.val(),
        		hospitalId : hospitalId.val(),
        		cgroup : qno
        	},
        	function(result){
        		console.log(result);
        		showQnaList(1);
        		
        	});
        });
        


        /* Q&A 삭제  */
        qna.on("click", ".del", function (e) {

            var qno = $(this).attr("data-qno");
            //var qno = $(this).data("qno"); 이거 왜 안될까?
            
            qnaService.removeQnA(qno, function(result){
            		showQnaList(1);
            }, function(err) {
            	console.log('QnA Delete ERROR....');
            });

            alert("처리되었습니다");

        });
        


    });