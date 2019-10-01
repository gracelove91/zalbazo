 $(document).ready(function () {

        var info = $(".info");
        var hospitalId = info.find("input[name='hospitalId']");
        var user = info.find("input[name='userEmail']");
        var qnaBody = info.find("textarea[name='body']");

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
                        str += "<div id='accordion'><div class='card-header primary-font'> Q.&nbsp; <a class='card-link collapsed' data-toggle='collapse' href='#collapse"+list[i].contentId+"' aria-expanded='false'>" + list[i].body + "";
                        str += "</a><div class='del float-right' data-qno='"+list[i].contentId+"' style='cursor:pointer'> X </div>";
                        str += "<p><small class='float-right text-muted'>" + qnaService.displayTime(list[i].createdDate) + "</small></p>";
                        str += "<small class='primary-font'>" + list[i].userEmail + "</small></div></div>";
                        
                        for (let j = 0, len = list.length || 0; j < len; j++) {

                            // 같은 그룹의 A가 있다면 A 출력 태그
                            if (list[j].cgroup === group && list[j].qnaType === 'A') {
                            	str += "<div id='collapse"+list[i].contentId+"' class='collapse' data-parent='#accordion' style=''>";
                                str += "<div class='card-body' data-ano='"+list[j].contentId+"'> &nbsp;&nbsp;&nbsp; A: " + list[j].body + "";
                                str += "<p><small class='float-right text-muted'>" + qnaService.displayTime(list[j].createdDate) + "</small></p> ";
                                str += "<small class='primary-font'> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 관리자</small> ";
                                str += "</div></div>";
                                
                                // A가 있는지 없는지 체크 
                                aCheck = false;
                            } 

                        }
                        
                        // aCheck true이면 Q는 있지만 A는 없음 
                        // 병원 측에서 A를 입력할 수 있는 textarea를 출력
                        if(aCheck) {
                        	str += "<br><div class='info container' style='background-color:white;'>";
                        	str += "<input type='hidden' class='form-control' name='userEmail' value='dummy@gmail.com'>";
                        	str += "<input type='hidden' class='form-control' name='hospitalId' value='${hospital.hospitalId}'>";
                        	str += "	<div class='form-group'>";
                        	str += "    <textarea class='form-control "+list[i].contentId+"' rows='3' id='body' name='body'></textarea></div>";
                        	str += "<button type='submit' class='answerBtn btn btn-secondary float-right' data-qno='"+list[i].contentId+"'>Submit</button></div><br><br><br>";
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
        	if(qnaBody.val().trim() === ""){
        		alert("내용을 입력하세요!");
        		return;
        	}
        	
        	qnaService.addQuestion(
        			{
        				body: qnaBody.val(),
        				userEmail : user.val(),
        				hospitalId : hospitalId.val(),
        				qnaType : "Q"
        			},
        			function(result) {
        				console.log(result);
        				
        				 // DB에 insert 후 글 목록 리셋
        			     showQnaList(1);
                         // textarea 리셋
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
        		userEmail : user.val(),
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
            
            // qno를 이용해서 ano를 얻어오는 메서드
            qnaService.getANo(qno, function(data) {
            	
            	var ano = data.contentId;
            	
            	// Q 삭제
            	qnaService.removeQna(qno, function (count) {
                    if (count === "success") {
                        qnaService.removeCon(qno, function (count) {

                            if (count === "success") {
                                showQnaList(1);
                            }
                        }, function (err) {
                            console.log('Q Con Delete ERROR...');
                        });
                    }
                }, function (err) {
                    console.log('Q Qna Delete ERROR...');
                });
            	
            	// A가 존재한다면 A도 삭제
            	if(typeof ano !== "undefined") {
            		
            		qnaService.removeQna(ano, function (count) {
                        if (count === "success") {
                            qnaService.removeCon(ano, function (count) {

                                if (count === "success") {
                                    showQnaList(1);
                                }
                            }, function (err) {
                                console.log('A Con ERROR...');
                            });
                        }
                    }, function (err) {
                        alert('A Qna ERROR...');
                    });
            	}
            	
            	
            });

            alert("처리되었습니다");


        });


    });