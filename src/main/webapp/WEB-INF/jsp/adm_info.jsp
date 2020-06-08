<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/9 0009
  Time: 22:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>个人信息</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<div class="panel panel-info pull-right" style="width: 100%">
    <div class="panel-heading ">个人信息</div>
    <div class="panel-body">
        <div>
            <table class="table table-bordered bg-info">
                <tr>
                    <td width="70%">
                        <table class="table table-bordered table-hover">
                            <tr>
                                <td width="15%" class="bg-primary">姓名：</td>
                                <td>${user.name}</td>
                            </tr>
                            <tr>
                                <td class="bg-primary">电话：</td>
                                <td>${user.tel}</td>
                            </tr>
                            <tr>
                                <td class="bg-primary">宿舍：</td>
                                <td>${user.roomid}</td>
                            </tr>
                        </table>
                    </td>
                    <td align="center">

                        <img src="${pageContext.request.contextPath}/${user.photo}" style="width: 70%;">
                    </td>
                </tr>

            </table>
        </div>
    </div>
</div>

</body>
</html>
