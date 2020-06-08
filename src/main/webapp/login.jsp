<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/13 0013
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>宿舍管理系统登录</title>

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<script>

    $(function () {
        $("#btn_sub").click(function () {
            $.post("login/login",$("#login_form").serialize(),function (data) {
                if(!data.flag){
                    document.getElementById("msg").className+=' alert-danger';
                    $("#msg").html(data.error_msg)

                }
                if(data.flag){
                    window.location.href="login/success"
                }
            })
        })
    })
</script>
<body>
<div class="container-fluid" >
    <div class="login-form login-form-bg col-lg-4 col-lg-offset-4  col-sm-6 col-sm-offset-3 col-xs-8 col-xs-offset-2 ">
        <div class="flex">
            <form id="login_form" action="login/login" method="post" role="form">
                <div id="msg" class="alert" role="alert"></div>
                <div class="input-group input-group-md" >
                    <span class="input-group-addon" id="sizing-addon1"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
                    <input type="text" class="form-control" id="userid" name="id" placeholder="请输入用户ID"/>
                </div>
                <div class="input-group input-group-md">
                    <span class="input-group-addon" id="sizing-addon2"><i class="glyphicon glyphicon-lock"></i></span>
                    <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码"/>
                </div>
                <br/>
                <select name="status" id="status" class="form-control"  style="width: 120px; float:left">
                    <option value ="" selected disabled style="display: none">选择身份</option>
                    <option value ="1">学生</option>
                    <option value ="2">宿管</option>
                    <option value ="3">学工处</option>
                </select>
                <a href="" style="float: right">找回密码</a><br><br><br>
                <button type="button" id="btn_sub" class="btn btn-success btn-size ">登录</button>
                <button type="button" class="btn btn-success btn-size ">退出</button>
            </form>
        </div>

    </div>

</div>

</body>
</html>