<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="includes/header.jsp"%>

<title>ZALBAZO</title>
<div class="container-fluid">
  
	<div class="row">
		<div class="col-xl-9 mx-auto">
		</div>

		<div class="babalogo" id="babalogo">
			<img src="/resources/img/c_baba_logo2.png"> </br> </br>

		</div>


		<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
			<form name="form1" method="Get" action="/hospital/searchedlist">

				<div class="form-row">
					
					<div class="dropdown">
					
					  <button class="btn btn-secondary dropdown-toggle hida" type="button" id="dropdownMenu1 sel" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"style="width:150px">
					    라벨검색
					  </button>
  
					  <div class="dropdown-menu" aria-labelledby="dropdownMenu1" style="width:100px">
					    <button class="dropdown-item" type="button" style="width:150px">24시간</button>
					    <button class="dropdown-item" type="button" style="width:150px">미용</button>
					    <button class="dropdown-item" type="button" style="width:150px">주차</button>
					    <button class="dropdown-item" type="button" style="width:150px">특수동물</button>
					  </div>
  
					</div>
					
					
					
					
					
					
					<!-- 라벨검색 -->
					<dl class="dropdown">
						<dt>
							<a id="sel"><span class="hida">Select</span>
								<p class="multiSel" />
							</a>
						</dt>
						<dd>
							<div class="mutliSelect">
								<ul>
									<li><input class="label" type="checkbox" name="label"
										id="시간" value="1" />24시</li>
									<li><input class="label" type="checkbox" name="label"
										id="미용" value="2" />미용</li>
									<li><input class="label" type="checkbox" name="label"
										id="주차" value="3" />주차</li>
									<li><input class="label" type="checkbox" name="label"
										id="특수" value="4" />특수</li>
								</ul>
							</div>
						</dd>
					</dl>
					
					<!-- 상세검색 -->
					<input type="hidden" id="length" name="length" value="">
					<select name="searchOption">
						<option value="all">전체검색</option>
						<option value="name">병원이름</option>
						<option value="address">주소</option>
						<option value="info">내용</option>
					</select>
					
					<!-- 검색창 -->
					<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
						<input name="keyword" type="keyword" class="form-control form-control-lg" placeholder="검색어를 입력해주세요.">
					</div>
					<div class="col-12 col-md-3">
						<button type="submit" class="btn btn-block btn-lg btn-primary">검색하기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<!-- Bootstrap core JavaScript -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript" src="/resources/js/index/search.js"></script>
</body>

</html>