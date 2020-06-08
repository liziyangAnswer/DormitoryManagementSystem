<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/6 0006
  Time: 1:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加个人物品</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<div class="panel panel-info pull-right" style="width: 100%">
    <div class="panel-heading ">添加个人物品</div>
    <div class="panel-body">
        <div>
            <form class="form-inline" action="${pageContext.request.contextPath}/student/effectInsert">

                <table class="bg-info table ">
                    <tr ></tr>
                    <tr>
                        <td style="width: 15%"></td>
                        <td style="width: 60%;">
                            <div class="form-group">
                                <label for="name">物品名称</label>
                                <input type="text" class="form-control" name="name" id="name" placeholder="">
                            </div>
                        </td>

                        <td style="width: 15%"></td>
                    </tr>
                </table>
                <button type="submit" class="btn btn-default pull-right">添加</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
