<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/6 0006
  Time: 0:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加宿管</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<div class="panel panel-info pull-right" style="width: 100%">
    <div class="panel-heading ">添加宿管</div>
    <div class="panel-body">
        <div>
            <form class="form-inline" enctype="multipart/form-data" action="${pageContext.request.contextPath}/admin/insert" method="post">

                <table class="bg-info table ">
                    <tr ></tr>
                    <tr>
                        <td style="width: 15%"></td>
                        <td style="width: 60%;">
                            <div class="form-group">
                                <label for="sno">工号</label>
                                <input type="text" class="form-control"  name="sno" id="sno" placeholder="">
                            </div>
                            <div class="form-group">
                                <label for="name">姓名</label>
                                <input type="text" class="form-control" name="name" id="name" placeholder="">
                            </div><br><br>
                            <div class="form-group">
                                <label for="tel">电话</label>
                                <input type="text" class="form-control"  name="tel" id="tel" placeholder="">
                            </div>
                            <div class="form-group">
                                <label for="roomid">宿舍</label>
                                <input type="text" class="form-control" name="roomid" id="roomid" placeholder="">
                            </div>
                            <div class="form-group">
                                <img src="" id="img0" style="width: 20rem;height: 15rem;"><br>
                                <input type="file" name="photo" id="photo" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg"/>
                            </div><br><br>

                        </td>

                        <td style="width: 15%"></td>
                    </tr>
                </table>
                <button type="submit" class="btn btn-default pull-right">添加</button>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    $("#photo").change(function(){
        var objUrl = getObjectURL(this.files[0]) ;//获取文件信息
        console.log("objUrl = "+objUrl);
        if (objUrl) {
            $("#img0").attr("src", objUrl);
        }
    });

    function getObjectURL(file) {
        var url = null;
        if(window.createObjectURL!=undefined) {
            url = window.createObjectURL(file) ;
        }else if (window.URL!=undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file) ;
        }else if (window.webkitURL!=undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file) ;
        }
        return url ;
    }
</script>
</body>
</html>
