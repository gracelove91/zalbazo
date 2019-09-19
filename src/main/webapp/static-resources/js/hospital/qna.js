 $(document).ready(function () {

        var qnaUL = $(".qna");

        var info = $(".info");
        var hospitalId = info.find("input[name='hospitalId']");
        var user = info.find("input[name='userEmail']");
        var qnaBody = info.find("textarea[name='body']");

        var qna = $(".qnaqna");

        showQnaList(1);


        function showQnaList(page) {
            qnaService.getList({hospitalId: hospitalId.val()}, function (list) {
                var str = "";
                if (list == null || list.length == 0) return;

                qna.html("");

                for (let i = 0, len = list.length || 0; i < len; i++) {
                    let type = list[i].qnaType;
                    let group = list[i].cgroup;
                    
                    // Q 타입이면 출력 
                    if (type === 'Q') {
                        // Q 출력 태그
                        str += "<div class='card-header primary-font'> Q. " + list[i].body + "";
                        str += "<div class='del float-right' data-qno='"+list[i].contentId+"'> X </div>";
                        str += "<p><small class='float-right text-muted'>" + qnaService.displayTime(list[i].createdDate) + "</small></p>";
                        str += "<small class='primary-font'>" + list[i].userEmail + "</small></div>";
                        
                        for (let j = 0, len = list.length || 0; j < len; j++) {

                            // 같은 그룹의 A가 있다면 A 출력 태그
                            if (list[j].cgroup === group && list[j].qnaType === 'A') {
                       
                                str += "<div class='card-body' data-ano='"+list[j].contentId+"'> &nbsp;&nbsp;&nbsp; A: " + list[j].body + "";
                                str += "<p><small class='float-right text-muted'>" + qnaService.displayTime(list[j].createdDate) + "</small></p> ";
                                str += "<small class='primary-font'> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 관리자</small> ";
                                str += "</div>";
                            }
                        }
                        
                    }
                }

                qna.html(str);
            });
        }


        /* Q&A 등록  */
        var submitBtn = $("#regBtn");

        submitBtn.on("click", function (e) {
        	
        	qnaService.addHospitalQna(
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