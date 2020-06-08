<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/5 0005
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>访客登记</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<div class="panel panel-info pull-right" style="width: 100%">
    <div class="panel-heading ">来访人员登记</div>
    <div class="panel-body">
        <div>
            <form class="form-inline" method="post" action="${pageContext.request.contextPath}/admin/visitor">

                <table class="bg-info table ">
                    <tr ></tr>
                    <tr>
                        <td style="width: 15%"></td>
                        <td style="width: 60%;">
                            <div class="form-group">
                                <label for="name">姓名</label>
                                <input type="text" class="form-control" name="name" id="name" placeholder="">
                            </div>
                            <div class="form-group">
                                <label for="tel">电话</label>
                                <input type="text" class="form-control"  name="tel" id="tel" placeholder="">
                            </div><br><br>
                            <div class="form-group">
                                <label for="roomid">到访宿舍</label>
                                <input type="text" class="form-control" name="roomid" id="roomid" placeholder="">
                            </div>
                            <div class="form-group">
                                <label for="time">来访时间</label>
                                <input type="text" class="form-control" name="date" id="time">
                            </div><br><br>

                        </td>

                        <td style="width: 15%"></td>
                    </tr>
                </table>
                <button type="submit" class="btn btn-default pull-right">登记</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
