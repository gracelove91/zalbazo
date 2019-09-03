<%--
  Created by IntelliJ IDEA.
  User: govlmo91
  Date: 02/09/2019
  Time: 7:24 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="webjars/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%--values (CONTENT_SEQ.nextval, #{title}, #{body}, #{userId}, sysdate, #{updateDate}, #{categoryId})--%>

<div class="panel-body">
    <form role="form" action="/jisikdong/register" method="post">
        <div class="form-group">
            <label>Title</label>
            <input class="form-control" name="title"/>
        </div>
        <div class="form-group">
            <label>Content</label>
            <textarea class="form-control" rows="3" name="body"></textarea>
        </div>
        <input type="hidden" name="userId" value="1"/>
        <button type="submit" class="btn btn-primary">전송</button>
    </form>
</div>


<script src="webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="webjars/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>
