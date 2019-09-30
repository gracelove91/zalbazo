<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp" %>
<section class="feature-area">
    <div class="container">
        <div class="row">
            <main id="main" class="col-md-12 main">
                <div class="page-header mt-3">
                    <h2>병원 검색 결과</h2>
                </div>
                <p class="lead">병원 리스트</p>

                <table class="table table-striped" style="width: 1150px;">
                    <thead>
                    <tr>
                        <th scope="col" class="mobile"
                            style="width: 150px; text-align: center;">No.
                        </th>
                        <th scope="col" class="mobile"
                            style="width: 350px; text-align: center;"></th>
                        <th scope="col" class="mobile"
                            style="width: 600px; text-align: center;">병원명
                        </th>
                        <th scope="col" class="mobile"
                            style="width: 200px; text-align: center;">진료시작
                        </th>
                        <th scope="col" class="mobile"
                            style="width: 200px; text-align: center;">진료마감
                        </th>
                        <th scope="col" class="mobile"
                            style="width: 700px; text-align: center;">주소
                        </th>
                        <th scope="col" class="mobile"
                            style="width: 400px; text-align: center;">전화번호
                        </th>
                        <!-- 						<th scope="col" class="mobile"
                                                    style="width: 1000px; text-align: center;">정보</th> -->
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${hospitalList}" var="hospital">


                        <tr>
                            <td class="mobile" style="text-align: center;"><c:out
                                    value="${hospital.hospitalId}"/></td>

  <c:forEach items="${PicLib}" var="pic" varStatus="status">
                            <td class="mobile" style="text-align: center;"><a href="#">
                                <img class="img-fluid rounded mb-3 mb-md-0"
                                     src="${ctx}/resources/img/hospital/${pic.uuid}_1.${pic.ext}"
                                     alt="">
                            </a></td>

</c:forEach>
                            <td><a style="color: #000000;"
                                   href='/hospital/get?hospitalId=<c:out value="${hospital.hospitalId}"/>'>
                                    ${hospital.name}</a><br><br/>
                            <c:forEach items="${hospital.label}" var="label">
                                <c:if test="${label.labelCode == 1 }">
                                    <i class="material-icons"> local_convenience_store </i>
                                </c:if>

                                <c:if test="${label.labelCode == 2 }">
                                    <i class="material-icons"> local_florist </i>
                                </c:if>

                                <c:if test="${label.labelCode == 3 }">
                                    <i class="material-icons"> local_parking </i>
                                </c:if>

                                <c:if test="${label.labelCode == 4 }">
                                    <i class="material-icons"> emoji_nature </i>
                                </c:if>
                                
                                <c:if test="${label.labelCode == 5 }">
                                    <i class="material-icons"> check_circle </i>
                                </c:if>
                            </c:forEach></td>

                            <td class="mobile" style="text-align: center;"><c:out
                                    value="${hospital.treatStart}"/></td>

                            <td class="mobile" style="text-align: center;"><c:out
                                    value="${hospital.treatEnd}"/></td>

                            <td class="mobile" style="text-align: center;"><c:out
                                    value="${hospital.address}"/></td>

                            <td class="mobile" style="text-align: center;"><c:out
                                    value="${hospital.tel}"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </main>
        </div>
    </div>
</section>
<%@include file="../includes/footer.jsp" %>