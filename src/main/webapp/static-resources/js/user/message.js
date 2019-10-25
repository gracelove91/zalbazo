$(document).ready(function(){
	
	var adminBtn = $(".adminBtn");

	var userEmail = $(".email").val();
	var name = $(".name").val();
	var message = $("textarea[name='toAdmin']");
	
	console.log(name);
	
	var msgSpace = $(".msg");
	
	showMessageList();
	
    function showMessageList() {
    	
    	messageService.getUserList(userEmail, function(list) {
    		
    		console.log(list);
    		
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
    		                str += "      <h4>" + list[i].name + "<small><i>&nbsp;&nbsp;&nbsp; Posted on " +messageService.displayTime(list[i].createdDate)+ " ";
    		                str += "	   </i></small>&nbsp;&nbsp;&nbsp;<span class='remove' style='cursor:pointer' data-cno='"+list[i].contentId+"'>X</span></h4>";
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
		                str += "      <h4>" + list[i].name + "<small><i>&nbsp;&nbsp;&nbsp; Posted on " +messageService.displayTime(list[i].createdDate)+ " ";
		                str += "	   </i></small>&nbsp;&nbsp;&nbsp;<span class='remove' style='cursor:pointer' data-cno='"+list[i].contentId+"'>X</span></h4>";
		                str += "      <p>"+ list[i].body + "</p>";      
		                str += "    </div>";
		                str += "  </div>";
		                str += "  <div class='col-sm-5'></div>";
		                str += "</div>";
		                
		                str += "<div class='row'>";
		                str += "  <div class='col-sm-6'></div>";
		                str += "  <div class='media border-0 p-3 col-sm-6'>";
		                str += "    <div class='media-body'>";
		                str += "      <p><small>보내주신 문의를 확인하고 있습니다.</small></p>";      
		                str += "    </div>";
		                str += "    <img src='/resources/img/baba.png' class='mr-2 mt-2' style='width:60px; padding-left:10px;'>";
		                str += "  </div>";
		                str += "</div><hr>";

                    }
                    
                }
            }

            msgSpace.html(str);
        });
    }


	
	adminBtn.on("click", function(e) {
		
		var msg = {
			body : message.val(),
			userEmail : userEmail,
			name : name
		};
		
		messageService.send(msg, function(result){
			showMessageList();
			message.val('');
		});
	});
	

	
	msgSpace.on("click", ".remove", function (e) {
		
        var contentId = $(this).attr("data-cno");
		
		var remove_confirm = function(){
	        if (confirm('삭제하시겠습니까?')) {
				messageService.remove(contentId, function(result){
					showMessageList();
				}, function(error){
					console.log('remove Message error,,,,,')
				});
	        }
	    }
		remove_confirm();
	});
	
	
	
});