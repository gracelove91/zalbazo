<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: govlmo91
  Date: 02/09/2019
  Time: 8:26 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--    private Long id;
    private String title;
    private String body;
    private Long userId;
    private LocalDateTime createdDate;
    private LocalDateTime updatedDate;
    private Long categoryId;--%>
<table>
    <thead>
    <tr>
        <th>#번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>수정일</th>
        <th>카테고리</th>
    </tr>
    </thead>

    <c:out value="${list}"/>

    <c:forEach items="${list}" var="content">
        <td><c:out value="${content.id}"/></td>
        <td><c:out value="${content.title}"/></td>
        <td><c:out value="${content.userId}"/></td>
        <td><c:out value="${content.createdDate}"/> </td>
        <td><c:out value="${content.updatedDate}"/> </td>
        <td><c:out value="${content.categoryId}"/> </td>
    </c:forEach>
</table>

</body>
</html>
