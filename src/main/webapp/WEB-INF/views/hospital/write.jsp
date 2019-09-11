<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	contentId : ${content.contentId}
	<br> contentBody : ${content.body}
	<br> hospitalId : ${hospitalQna.hospitalId}
	<br> contentId : ${hospitalQna.contentId}
	<br> hospitalQnaId : ${hospitalQna.hospitalQnaId}

	<table class="table table-striped">
			<tr>
				<th>글 내용</th>
				<th>작성자</th>
				<th>DATE</th>
			</tr>

		<%-- <c:forEach items="${qna}" var="qna">
				<tr>
					<td>${qna.body}</td>
					<td>${qna.userEmail}</td>
					<td>${qna.createdDate}</td>
				</tr>
		</c:forEach> --%>
	</table>



</body>
</html>