<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="includes/header.jsp" %>


<title>자주하는 질문</title>

 <head>             
       <style>
		#accordian li{list-style:none;}
		#accordian li > .question {color: #25ccf7; cursor:pointer;}
		li > ul{background-color: #25ccf7; display:none;}
		li > ul >li{ color:black;}

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
                

               <div class="col-md-10 col-lg-8 col-xl-7 mx-auto" style="float: left; width: 45%;">
						<form id='searchForm' action="/faq/faq/faqsearchedlist" method='get'>
                    <input class="form-control form-control-lg" type='text' type="keyword" name='keyword' placeholder="키워드를 입력하세요" value='<c:out value="${pageMaker.cri.keyword}"/>'/>
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
		<li>
			 <div class="question" id="header_1" style="border:1; font-size:20px; color:black; font-family: 'FontAwesome';" >가입은 어떻게 하나요?</div>
			<ul>
				<li>우측 상단 sign-up 버튼을 클릭하세요</li>
			</ul>
		</li>
		<li>
			<div class="question" id="header_1" style="border:1; font-size:20px; color:black;" >예약은 언제부터 가능한가요?</div>
			<ul>
				<li>방문일 한달 전부터 가능합니다</li>
			</ul>
		</li>
		<li>
			<div class="question" id="header_1" style="border:1; font-size:20px; color:black;">파충류도 치료 받을 수 있나요?</div>
			<ul>
				<li>특수동물 치료 가능 병원을 검색 해 주세요</li>
			</ul>
		</li>
		<li>
			<div class="question" id="header_1" style="border:1; font-size:20px; color:black;">동물병원을 개원했습니다. 병원 등록을 하고 싶은데 어떻게 해야 하나요?</div>
			<ul>
				<li>병원 등록 전용 페이지에서 가입 해 주세요</li>
			</ul>
		</li>
	</ul>
</div>	
                </div>
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