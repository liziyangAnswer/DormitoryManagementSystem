<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/4 0004
  Time: 22:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script>
        function look(id) {
            location.href="${pageContext.request.contextPath}/main/annolook?id="+id;
        }
    </script>
    <title>Title</title>

    <c:import url="WEB-INF/jsp/head.jsp"></c:import>

</head>
<body>
<div class="row">
    <div class="panel panel-success col-md-3">
        <div class="panel-heading">
            <h3 class="panel-title">今日卫生情况</h3>
        </div>
        <div class="panel-body">
            <img src="${pageContext.request.contextPath}/weisheng/weisheng.jpg" style="width: 100%">
        </div>
        <a href="login.jsp">s</a>
    </div>
    <div class="col-md-9">
        <table class="table table-bordered">
            <tr class="bg-success">

                <th>
                    编号
                </th>
                <th>
                    公告名称
                </th>
                <th>
                    发布时间
                </th>
                <th>
                    发布人
                </th>
                <th>
                    身份
                </th>
                <th>
                    查看
                </th>
            </tr>
            <c:forEach items="${pb.list}" var="announcement" varStatus="s">
                <tr>

                    <td>
                            ${s.count}
                    </td>

                    <td>
                            ${announcement.title}
                    </td>
                    <td>
                            ${announcement.date}
                    </td>
                    <td>
                            ${announcement.author}
                    </td>
                    <td>
                            ${announcement.position}
                    </td>
                    <td>
                        <button type="button" class="btn btn-success" onclick="look(${announcement.id})">查看</button>
                    </td>
                </tr>
            </c:forEach>

        </table>
    </div>
</div>
</body>
</html>
