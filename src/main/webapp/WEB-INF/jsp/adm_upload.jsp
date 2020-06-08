<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/5 0005
  Time: 23:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传卫生情况</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<div class="panel panel-info pull-right" style="width: 100%">
    <div class="panel-heading ">上传卫生情况</div>
    <div class="panel-body">
        <div>
            <form method="post" action="${pageContext.request.contextPath}/admin/upload" enctype="multipart/form-data">
            <table class="table table-bordered bg-info">
               <tr>
                   <td>
                       <span style="font-size: large">请上传图片，图片将展示在系统主页面</span>
                       <img src="" id="img0" style="width: 20rem;height: 30rem;"><br>
                       <input type="file" name="photo" id="photo" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg"/>

                   </td>
               </tr>

            </table>
                <button type="submit">上传</button>
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
