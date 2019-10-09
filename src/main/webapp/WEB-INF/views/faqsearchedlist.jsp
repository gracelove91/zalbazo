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
		li > ul >li{color:black;}

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
                    <input class="form-control form-control-lg" type='text' name='keyword' placeholder="키워드를 입력하세요" />
                    </div>
                        <div  style="float: left; width: 20%;">
                            <button type="submit" class="btn btn-block btn-lg btn-primary">검색하기</button>
                            </div>
                            
                        </form>
                    </div>
                </div>
                
                  <br><br><br>
                
                
                <c:forEach items="${FaqList2}" var="FaqVO">
	    		    <h4 class="text-primary"><c:out value="${FaqVO.question}"/></h4>
				  <p class="font-weight-normal"><c:out value="${FaqVO.answer}"/></p>
				  <br>
				</c:forEach>  
                </div>
          </section> 
          
        
          
<script>
              
var searchForm = $("#searchForm");
$("#searchForm button").on("click", function (e) {

    searchForm.submit();
});


</script>
              
     <script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script>          
                           

<%@include file="includes/footer.jsp" %>