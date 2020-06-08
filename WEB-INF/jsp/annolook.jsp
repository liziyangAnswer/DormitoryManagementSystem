<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/10 0010
  Time: 1:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>公告</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>

<div class="panel panel-info pull-right" style="width: 100%">
    <div class="panel-heading ">${annobyid.title}</div>
    <div class="panel-body">
        <div style="text-align: center ;width: 100%">
            <h3>${annobyid.title}</h3><br>
            <h4>${annobyid.author}-----${annobyid.position}</h4><hr>
            <span>${annobyid.body}</span>
        </div>
    </div>
</div>

</body>
</html>
