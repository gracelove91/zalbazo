$(document).ready(function() {
	//console.log("mypage");
	
	var userEmail = '<c:out value="${useremail}"/>';
	var table1 = $(".table1"); // 커뮤니티
	var table2 = $(".table2"); // 지식동
	var table3 = $(".table3"); // 병원리뷰 
	var table4 = $(".table4"); // 병원Q&A
	var table5 = $(".table5"); // 댓글
	
	
	myContentService.getCommunityList(userEmail, function(list) {
		
		var str = "";
		
		if(list == null || list.length == 0) {
			return;
		}
		
		for(var i = 0, len = list.length||0; i < len; i++) {
			//console.log(list[i].contentId, list[i].title, list[i].createdDate);
			
			str += "<tr>";
			str += "	<th scope='row' class='mobile' style='text-align:center;'>" + list[i].contentId + "</th>";

			str += "<td>";
			str += "  <a class='move' style='color : #000000;' href='/community/get?contentId=" + list[i].contentId + "'>" + list[i].title + "</a>";
			str += "</td>";

			str += "<td class='mobile' style='text-align:center;'>" + myContentService.displayTime(list[i].createdDate) + "</td>";
			str += "</tr>";
          
		} // for
		
		table1.html(str);
	});
	
	myContentService.getJisikdongList(userEmail, function(list) {
		
		var str = "";
		
		if(list == null || list.length == 0) {
			return;
		}
		
		for(var i = 0, len = list.length||0; i < len; i++) {
			//console.log(list[i].contentId, list[i].title, list[i].createdDate);
			
			str += "<tr>";
			str += "	<th scope='row' class='mobile' style='text-align:center;'>" + list[i].contentId + "</th>";

			str += "<td>";
			str += "  <a class='move' style='color : #000000;' href='/jisikdong/get?contentId=" + list[i].contentId + "'>" + list[i].title + "</a>";
			str += "</td>";

			str += "<td class='mobile' style='text-align:center;'>" + myContentService.displayTime(list[i].createdDate) + "</td>";
			str += "</tr>";
          
		} // for
		
		table2.html(str);
	}); // jisikdong
	
	myContentService.getReviewList(userEmail, function(list) {
		
		var str = "";
		
		if(list == null || list.length == 0) {
			return;
		}
		
		for(var i = 0, len = list.length || 0; i<len; i++) {
			//console.log(list[i]);
			
			var star = "";
			var starPoint = list[i].starPoint;

			if(starPoint == 1) {
				star += "<i class='material-icons'>star</i>";
				star += "<i class='material-icons'>star_border</i>";
				star += "<i class='material-icons'>star_border</i>";
				star += "<i class='material-icons'>star_border</i>";
				star += "<i class='material-icons'>star_border</i>";
			} else if(starPoint == 1.5) {
				star += "<i class='material-icons'>star</i>";
				star += "<i class='material-icons'>star_half</i>";
				star += "<i class='material-icons'>star_border</i>";
				star += "<i class='material-icons'>star_border</i>";
				star += "<i class='material-icons'>star_border</i>";
			} else if(starPoint == 2) {
				star += "<i class='material-icons'>star</i>";
				star += "<i class='material-icons'>star</i>";
				star += "<i class='material-icons'>star_border</i>";
				star += "<i class='material-icons'>star_border</i>";
				star += "<i class='material-icons'>star_border</i>";
			} else if(starPoint == 2.5) {
				star += "<i class='material-icons'>star</i>";
				star += "<i class='material-icons'>star</i>";
				star += "<i class='material-icons'>star_half</i>";
				star += "<i class='material-icons'>star_border</i>";
				star += "<i class='material-icons'>star_border</i>";
			} else if(starPoint == 3) {
				star += "<i class='material-icons'>star</i>";
				star += "<i class='material-icons'>star</i>";
				star += "<i class='material-icons'>star</i>";
				star += "<i class='material-icons'>star_border</i>";
				star += "<i class='material-icons'>star_border</i>";
			} else if(starPoint == 3.5) {
				star += "<i class='material-icons'>star</i>";
				star += "<i class='material-icons'>star</i>";
				star += "<i class='material-icons'>star</i>";
				star += "<i class='material-icons'>star_half</i>";
				star += "<i class='material-icons'>star_border</i>";
			} else if(starPoint == 4) {
				star += "<i class='material-icons'>star</i>";
				star += "<i class='material-icons'>star</i>";
				star += "<i class='material-icons'>star</i>";
				star += "<i class='material-icons'>star</i>";
				star += "<i class='material-icons'>star_border</i>";
			} else if(starPoint == 4.5) {
				star += "<i class='material-icons'>star</i>";
				star += "<i class='material-icons'>star</i>";
				star += "<i class='material-icons'>star</i>";
				star += "<i class='material-icons'>star</i>";
				star += "<i class='material-icons'>star_half</i>";
			} else if(starPoint == 5) {
				star += "<i class='material-icons'>star</i>";
				star += "<i class='material-icons'>star</i>";
				star += "<i class='material-icons'>star</i>";
				star += "<i class='material-icons'>star</i>";
				star += "<i class='material-icons'>star</i>";
			}
			
			str += "<li class='left clearfix' data-rno='12'><div class='container mt-3'>";
			str += "  <div class='media border p-3'>";
			str += "	<img src='/resources/img/baba.png' class='mr-3 mt-3 rounded-circle' style='width:50px'>";
			str += "		<div class='media-body'>";
			str += "			<h4><i style='color:gold; font-weight:bold'>"+star+"</i>"+' '+list[i].starPoint+"</h4>";
			str += "				<small><i style='font-weight:bold'>"+list[i].userEmail+"</i>&nbsp;&nbsp;<i>"+ myContentService.displayTime(list[i].createdDate) +"</i></small>";
			str += "     				<a href='/hospital/get?hospitalId=" + list[i].hospitalId + "'><p>"+list[i].body+"</p></a></div></li>"; 
		}
		
		table3.html(str);
		
	}); // getReviewList
	
	showQnaList(1);
	
	function showQnaList(page) {
	myContentService.getQList(userEmail, function(list) {
		
		
		var str = "";
		
		if (list == null || list.length == 0) {
			
        	return;
        }
		
		for (let i = 0, len = list.length || 0; i < len; i++) {
			//console.log(list[i]);
	   		let type = list[i].qnaType;
	        let group = list[i].cgroup;
	        
	        // A가 있는지 없는지 체크
	        let aCheck = true;
	        
	        if (type === 'Q') {
	        	
	        	str += "<div id='accordion'><div class='card-header primary-font'> <a href='/hospital/get?hospitalId=" + list[i].hospitalId +"'>" + list[i].name + "</a><br>Q.&nbsp; <a class='card-link collapsed' data-toggle='collapse' href='#collapse"+list[i].contentId+"' aria-expanded='false'>" + list[i].body + "";
                str += "</a><div class='del float-right' data-qno='"+list[i].contentId+"' style='cursor:pointer'> X </div>";
                str += "<p><small class='float-right text-muted'>" + myContentService.displayTime(list[i].createdDate) + "</small></p>";
                str += "<small class='primary-font'>" + list[i].userEmail + "</small></div></div>";
                
               for (let j = 0, len = list.length || 0; j < len; j++) {
                   // 같은 그룹의 A가 있다면 A 출력 태그
                   if (list[j].cgroup === group && list[j].qnaType === 'A') {
                	   
                   	   str += "<div id='collapse"+list[i].contentId+"' style=''>";
                       str += "<div class='card-body' data-ano='"+list[j].contentId+"'> &nbsp;&nbsp;&nbsp; A: " + list[j].body + "";
                       str += "<p><small class='float-right text-muted'>" + myContentService.displayTime(list[i].createdDate) + "</small></p> ";
                       str += "<small class='primary-font'> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 관리자</small><hr> ";
                       str += "</div></div>";
                       
                       // A가 있는지 없는지 체크 
                       aCheck = false;
                   }

               } // for J
               
               if(aCheck) {
            	   
            	   str += "<div id='collapse"+list[i].contentId+"' style=''>";
                   str += "<div class='card-body'> &nbsp;&nbsp;&nbsp; 등록된 답변이 없습니다</div></div><hr> ";
                   
               }
	        
	       } // type Q
			
		} // for i
		table4.html(str);
		
	}); // getQList
	}
	
    /* Q&A 삭제  */
	table4.on("click", ".del", function (e) {

        var qno = $(this).attr("data-qno");
        //var qno = $(this).data("qno"); 이거 왜 안될까?
        
        // qno를 이용해서 ano를 얻어오는 메서드
        myContentService.getANo(qno, function(data) {
        	
        	var ano = data.contentId;
        	
        	// Q 삭제
        	myContentService.deleteQna(qno, function (count) {
                if (count === "success") {
                	myContentService.deleteContent(qno, function (count) {

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
        		
        		myContentService.deleteQna(ano, function (count) {
                    if (count === "success") {
                    	myContentService.deleteContent(ano, function (count) {

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
	
	myContentService.getReplyList(userEmail, function(list) {
		
		var str = "";
		
		if (list == null || list.length == 0) {
        	return;
        }
		
		for (let i = 0, len = list.length || 0; i < len; i++) {
           //console.log(list[i]);
           
        str += "<br>";
        str += "<li class='list-group-item'>";
        str += "	<div>";
        str += "		<div class='header'>";
        str += "			<strong class='primary-font'>[" + list[i].replyid + "]</strong>";
        str += "               <small class='pull-right text-muted'>" + myContentService.displayTime(list[i].createdDate) + "</small>";
        str += "        </div>";
        str += "           <a href='/jisikdong/get?contentId=" + list[i].contentId +"'><p>" + list[i].body + "</p></a>";
        str += "    </div>";
        str += "</li>";
          
        }
		
		table5.html(str);
		
	}); // getReplyList
	
});