<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="includes/header.jsp" %>


<title>자주하는 질문</title>

 <head>             
       <style>
       
.template_faq {
    background: #edf3fe none repeat scroll 0 0;
}
.panel-group {
    background: #fff none repeat scroll 0 0;
    border-radius: 3px;
    box-shadow: 0 5px 30px 0 rgba(0, 0, 0, 0.04);
    margin-bottom: 0;
    padding: 30px;
}
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
    background: #25ccf7 none repeat scroll 0 0;
    border: 1px solid transparent;
    border-radius: 30px;
    color: #fff;
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
    background: #ffb900 none repeat scroll 0 0;
    border: 1px solid transparent;
    border-radius: 50%;
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.58);
    color: #fff;
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
		
		
		#accordian li{list-style:none;}
		#accordian li > .question {color: text-primary; cursor:pointer;}
		li > ul{display:none;}
		li > ul >li{ color:text-primary;}
		
		

    </style> 
    	
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    	<!--     Fonts and icons     -->
    	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

</head>

<section class="feature-area">
    <div class="container">
        <div class="row">
            <div id="main" class="col-md-12">
                <div class="page-header mt-3">
                    <h2>FAQ</h2>
                </div>
                <p class="lead">자주하는 질문들을 모았습니다</p>
                

               <div class="col-md-10 col-lg-8 col-xl-7 mx-auto" style="float: left; width: 45%;">
						<form id='searchForm' action="/faq/faq/faqsearchedlist" method='get'>
                    <input class="form-control form-control-lg" type='text' name='keyword' placeholder="키워드를 입력하세요"/>
					</div>
					<div  style="float: left; width: 20%;">
						<button type="submit" class="btn btn-block btn-lg btn-primary">검색하기</button>
					</div>
                        </form>
                    </div>
                </div>

                   <br><br><br>



 <div id="accordian">
	<ul>
	 	<c:forEach items="${FaqList}" var="FaqVO">
			 <li>
				<div class ="question" style="border:1; font-size:20px;" > <h3 class="text-primary" >${FaqVO.question} </h3></div>
				<ul>
					<li><h4>${FaqVO.answer}</h4></li>
				</ul>
			</li>
		</c:forEach>
	</ul> 
</div>
	
  
  </div>
 </section>
 



       
<script>
              
$(function(){
	$(".question").click(function(){
		
		$("#accordian ul ul").slideUp();
		
		$('.ico_ar').css('transform','none');
		if(!$(this).next().is(":visible"))
		{
			$(this).next().slideDown();
			$(this).find('.ico_ar:eq(0)').css('transform','rotate(180deg)');
		}
	})
})

</script>
              
<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script>          
                           

<%@include file="includes/footer.jsp" %>