<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/8 0008
  Time: 13:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>head</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<img src="${pageContext.request.contextPath}/images/top.jpg" style="width: 100%;">
<div class="bg-info" style="width:100% ;min-width:900px;height: 20px;">
   <div class="pull-left" style="width: 50%">
       <c:if test="${!empty user.name}">
           <span>&nbsp&nbsp&nbsp&nbsp<i class="glyphicon glyphicon-user" aria-hidden="true"></i>&nbsp&nbsp用户：${user.name}</span>&nbsp;&nbsp;
       </c:if>
       <c:if test="${empty user.name}">
           <span>&nbsp&nbsp&nbsp&nbsp<i class="glyphicon glyphicon-user" aria-hidden="true"></i><a href="${pageContext.request.contextPath}/login.jsp">&nbsp&nbsp请登录</a></span>&nbsp;&nbsp;
       </c:if>

   </div>
   <div class="pull-right " >

       <span><i class="glyphicon glyphicon-off" aria-hidden="true"></i>&nbsp&nbsp<a href="${pageContext.request.contextPath}/exit" >退出</a>&nbsp&nbsp&nbsp&nbsp</span>
    </div>
</div>

</body>
</html>
