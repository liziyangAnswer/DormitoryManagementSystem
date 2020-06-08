<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/9 0009
  Time: 19:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改信息</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script>
        $('#chooseImage').on('change',function(){
            var filePath = $(this).val(),         //获取到input的value，里面是文件的路径
                fileFormat = filePath.substring(filePath.lastIndexOf(".")).toLowerCase();
            src = window.URL.createObjectURL(this.files[0]); //转成可以在本地预览的格式
            // 检查是否是图片
            if( !fileFormat.match(/.png|.jpg|.jpeg/) ) {
                alert('上传错误,文件格式必须为：png/jpg/jpeg');
                return;
            }
            $('#cropedBigImg').attr('src',filePath);
            $('#loding').show();
        });
    </script>
</head>
<body>
<div class="panel panel-info pull-right" style="width: 100%">
    <div class="panel-heading ">修改信息</div>
    <div class="panel-body">
        <div>
            <form class="form-inline" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/admin/update">

                <table class="bg-info table ">
                    <tr ></tr>
                    <tr>
                        <td style="width: 15%"></td>
                        <td style="width: 60%;">
                            <div class="form-group">
                                <label for="name">姓名</label>
                                <input type="text" class="form-control"  name="name" id="name" value="${admin.name}">
                            </div>
                            <div class="form-group">
                                <label for="sno">工号</label>
                                <input type="text" class="form-control" readonly="readonly" name="sno" id="sno" value="${admin.sno}">
                            </div><br><br>
                            <div class="form-group">
                                <label for="tel">电话</label>
                                <input type="text" class="form-control" name="tel" id="tel" value="${admin.tel}">
                            </div><br><br>
                            <div class="form-group">
                                <label for="roomid">宿舍</label>
                                <input type="text" class="form-control" name="roomid" id="roomid" value="${admin.roomid}">
                            </div>
                            <div class="form-group">
                                <label for="inroom">是否在宿舍</label>
                                <input type="text" class="form-control" readonly="readonly" name="inroom" id="inroom" value="${admin.inroom}">
                            </div>
                            <br><br>

                        </td>
                        <td><img src="${pageContext.request.contextPath}/${admin.photo}" id="img0" style="width: 20rem;height: 15rem;"><br>
                            <input type="file" name="photo" id="photo" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg"/></td>
                        <td style="width: 15%"></td>
                    </tr>
                </table>
                <button type="submit" class="btn btn-default pull-right">修改</button>
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
