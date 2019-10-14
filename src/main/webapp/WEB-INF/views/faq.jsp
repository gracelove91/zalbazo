<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="includes/header.jsp" %>

<title>자주하는 질문</title>

 <head>  
 
 <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
   <!--     Fonts and icons     -->
   <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />           
 <style>
       
.template_faq {
    background: #edf3fe none repeat scroll 0 0;
}

/* .panel-group {
    background: #fff none repeat scroll 0 0;
    border-radius: 3px;
    box-shadow: 0 5px 30px 0 rgba(0, 0, 0, 0.04);
    margin-bottom: 0;
    padding: 30px;
} */

#accordion .panel {
    border: medium none;
    border-radius: 0;
    box-shadow: none;
    margin: 0 0 15px 10px;
}
#accordion .panel-heading {
    border-radius: 30px;
    padding: 0;
}
#accordion .panel-title a {
    background: white none repeat scroll 0 0;
    border: 1px solid #ddd;;
    border-radius: 30px;
    color: black;
    display: block;
    font-size: 18px;
    font-weight: 600;
    padding: 12px 20px 12px 50px;
    position: relative;
    transition: all 0.3s ease 0s;
}
#accordion .panel-title a.collapsed {
    background: #fff none repeat scroll 0 0;
    border: 1px solid #ddd;
    color: #333;
}
#accordion .panel-title a::after, #accordion .panel-title a.collapsed::after {
    background: #fff none repeat scroll 0 0;
    border: 1px solid #ddd;
    border-radius: 50%;
    box-shadow: none;
    color: black;
    content: "";
    font-family: fontawesome;
    font-size: 25px;
    height: 55px;
    left: -20px;
    line-height: 55px;
    position: absolute;
    text-align: center;
    top: -5px;
    transition: all 0.3s ease 0s;
    width: 55px;
}
#accordion .panel-title a.collapsed::after {
    background: #fff none repeat scroll 0 0;
    border: 1px solid #ddd;
    box-shadow: none;
    color: #333;
    content: "";
}
#accordion .panel-body {
    background: transparent none repeat scroll 0 0;
    border-top: medium none;
    padding: 20px 25px 10px 9px;
    position: relative;
}


#accordion .panel-body p {
    border-left: 1px dashed #8c8c8c;
    padding-left: 25px;
}
		
</style> 
</head>

<section class="feature-area">
    <div class="container">
        <div class="row">
            <div id="main" class="col-md-12">
                <div class="page-header mt-3">
                    <h2>FAQ</h2>
                </div>
               <p class="lead">자주하는 질문들을 모았습니다</p>
               
                <!-- 검색창 -->
                   <div class="col-md-10 col-lg-8 col-xl-7 mx-auto" style="float: left; width: 45%;">
						<form id='searchForm' action="/faq/faqsearchedlist" method='get'>
                    <input class="form-control form-control-lg" type='text' name='keyword' placeholder="키워드를 입력하세요"/>
					</div>
					<div  style="float: left; width: 20%;">
						<button type="submit" class="btn btn-block btn-lg btn-primary">검색하기</button>
					</div>
                        </form>
                    </div>
                   </div>
                </div>
           </section>
                
<br><br>

 <div class="container">
        <div class="row">
            <div id="main" class="col-md-12">
                <div class="page-header mt-3">
					<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
						<c:forEach items="${FaqListAll}" var="FaqVO" varStatus="status">
						<c:set var="pre-fix" value="#" />
						<c:set var="cordinate" value="collapse" /> 
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingOne">
								<h4 class="panel-title" >
									<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="${'#'}${cordinate}${status.count}" aria-expanded="true" aria-controls="collapseOne">
									 	${FaqVO.question} 
									</a>
								</h4>
							</div>
							<div id="${cordinate}${status.count}" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body">
									<p>${FaqVO.answer}</p>
								</div>
							  </div>
						    </div>					
						  </c:forEach>
						  </div>
						</div>
					</div>
				</div><!--- END COL -->		
			</div><!--- END ROW -->			

<script>
              

(function($) {
	'use strict';
	
	jQuery(document).on('ready', function(){
	
			$('a.page-scroll').on('click', function(e){
				var anchor = $(this);
				$('html, body').stop().animate({
					scrollTop: $(anchor.attr('href')).offset().top - 50
				}, 1500);
				e.preventDefault();
			});		

	}); 	

				
})(jQuery);


</script>
              
<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script>          
                           

<%@include file="includes/footer.jsp" %>