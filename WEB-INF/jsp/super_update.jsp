<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/6 0006
  Time: 0:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <title>个人信息修改</title>
</head>
<body>

<div class="panel panel-info pull-right" style="width: 100%">
    <div class="panel-heading ">个人信息修改</div>
    <div class="panel-body">
        <div>
            <form class="form-inline" method="post" action="${pageContext.request.contextPath}/super/update">

                <table class="bg-info table ">
                    <tr ></tr>
                    <tr>
                        <td style="width: 15%"></td>
                        <td style="width: 60%;">
                            <div class="form-group">
                                <label for="name">姓名</label>
                                <input type="text" class="form-control" name="name" id="name" placeholder="${user.name}">
                            </div>
                            <div class="form-group">
                                <label for="tel">电话</label>
                                <input type="text" class="form-control" name="tel" id="tel" placeholder="${user.tel}">
                            </div><br><br>
                            <div class="form-group">
                                <label for="position">职位</label>
                                <input type="text" class="form-control"  name="position" id="position" placeholder="${user.position}">
                            </div>
                            <div class="form-group">
                                <label for="password">密码</label>
                                <input type="password" class="form-control" name="password" id="password">
                            </div><br><br>

                        </td>
                        <td>
                           <%-- <!-- 保存用户自定义的背景图片 -->
                            <img id="cropedBigImg" value='custom' src="${pageContext.request.contextPath}/photos/162146140109.jpg" data-address='' title="个人照片"/>
                            <input type="file" id="chooseImage" name="file">--%>
                        </td>
                        <td style="width: 15%"></td>
                    </tr>
                </table>
                <button type="submit" class="btn btn-default pull-right">修改</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
