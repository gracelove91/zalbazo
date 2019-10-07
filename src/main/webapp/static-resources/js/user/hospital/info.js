$(document).ready(function(){

	var userEmail = $(".email").val();
	var hospitalGet = $(".hospitalGet");
	
	var str = "";

	console.log(userEmail);
	
	infoService.get(userEmail, function(data){
		
		var no = data.name;
		console.log(no);
		
		str += "<div class='form-group'>";
		str += "   <label class='font-weight-bold'>병원명</label>";
		str += "   <input type='text' class='form-control' id='name' name='name' "
		str += "	value='"+data.name+"' readonly='readonly'>";
		str += "</div><br />";
		
		str += "<div class='form-group'>";
		str += "   <label class='font-weight-bold'>전화번호</label>";
		str += "   <input type='text' class='form-control' id='tel' name='tel' " 
		str += "    value='" +data.tel+ "' readonly='readonly'>";
		str += "</div><br />";
		
		str += "<div class='form-group'>";
		str += "   <p class='font-weight-bold'>제공 서비스</p>";
		
		for(var i=0, len = data.label.length; i<len; i++) {
			
			console.log(data.label[i].labelCode);
			
			if(data.label[i].labelCode === 1) {
				str += " <i class='material-icons'> local_convenience_store </i>";
				str += "	24시간&nbsp;&nbsp;&nbsp";
			}
			if(data.label[i].labelCode === 2) {
				str += " <i class='material-icons'> local_florist </i>";
				str += "	미용&nbsp;&nbsp;&nbsp";
			}
			if(data.label[i].labelCode === 3) {
				str += " <i class='material-icons'> local_parking </i>";
				str += "	주차&nbsp;&nbsp;&nbsp";
			}
			if(data.label[i].labelCode === 4) {
				str += " <i class='material-icons'> emoji_nature </i>";
				str += "	특수동물&nbsp;&nbsp;&nbsp";
			}
			if(data.label[i].labelCode === 5) {
				str += " <i class='material-icons'> check_circle </i>";
				str += "	수술&nbsp;&nbsp;&nbsp";
			}
			  
		}
		
		str += "</div><br />";
		
		
		str += "<div class='form-group'>";
		str += "   <label class='font-weight-bold'>주소</label>";
		str += "   <input type='text' class='form-control' name='address' id='address' " 
		str += "	value='" +data.address+ "' readonly='readonly'/>";
		str += "</div><br />";
		
		
		str += "<div class='row'>";
		str += "   <div class='form-group col-md-6'>";
		str += "      <label for='sel1' class='font-weight-bold'>문 여는 시간</label>";
		str += "      <input class='form-control' id='treatStart' name='treatStart' "
		str += "	   value='" +data.treatStart+ "' readonly='readonly' />";
		str += "   </div>";
		
		str += "   <div class='form-group col-md-6'>";
		str += "      <label for='sel1' class='font-weight-bold'>문 닫는 시간</label>";
		str += "      <input class='form-control' id='treatEnd' name='treatEnd' ";
		str += "       value='" +data.treatEnd+ "' readonly='readonly' />";
		str += "   </div>";
	    str += "</div><br />";
	    
	    
	    str += "<div class='form-group'>";
	    str += "   <label class='font-weight-bold'>세부사항</label>";
	    str += "   <input class='form-control' id='info' name='info' "
	    str += "    value='" +data.info+ "' readonly='readonly' />";
	    str += "</div><br />";
	    
	    
	    str += "<div class='form-group'>";
	    str += "   <p class='font-weight-bold'>병원사진</p>";
	    
  
        $.getJSON("/hospitalinfo/getAttachList", {userEmail: userEmail}, function (arr) {
            console.log(arr);

            $(arr).each(function (i, attach) {
                var fileCallPath = encodeURIComponent(attach.uploadPath + "/" + attach.uuid + "_" + attach.fileName);
                
                str += "<img width='120px' height='120px' src='/hospitalinfo/display?fileName=" + fileCallPath + "'>";
            });
            
            str += "</div><br />";
            hospitalGet.html(str);
        });	    
        
        
		
	});
	
});

