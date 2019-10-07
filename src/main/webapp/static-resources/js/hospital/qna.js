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

                    	// Q 출력 태그
                        str += "<div id='accordion'><div class='card-header primary-font'> Q.&nbsp; "
                        str += "<a class='card-link collapsed' data-toggle='collapse' href='#collapse"+list[i].contentId+"' aria-expanded='false'>" + list[i].body + "</a>";
                        str += "<p><small class='float-right text-muted'>" + qnaService.displayTime(list[i].createdDate) + "</small></p>";
                        str += "<small class='primary-font'>" + list[i].userEmail + "</small></div></div>";
                        
                        for (let j = 0, len = list.length || 0; j < len; j++) {

                            // 같은 그룹의 A가 있다면 A 출력 태그
                        	if (list[j].cgroup === group && list[j].qnaType === 'A') {
                            	str += "<div id='collapse"+list[i].contentId+"'>";
                                str += "<div class='card-body'> &nbsp;&nbsp;&nbsp; A: " + list[j].body + " <br><br>";
                                str += "<small class='primary-font'> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; " +list[j].name+ " </small> ";
                                str += "<small class='float-right text-muted'>" + qnaService.displayTime(list[j].createdDate) + "</small><hr> ";
                                str += "</div></div>";
                                
                                // A가 있는지 없는지 체크 
                                aCheck = false;
                            } 

                        }
                        
                        // aCheck true이면 Q는 있지만 A는 없음 
                        // 병원 측에서 A를 입력할 수 있는 textarea를 출력
                        if(aCheck) {
                        	str += "<div id='collapse"+list[i].contentId+"' style=''>";
                            str += "<div class='card-body'> &nbsp;&nbsp;&nbsp; 등록된 답변이 없습니다</div></div><hr> ";
                        }
                        
                        
                    }
                }

                qna.html(str);
            });
        }


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