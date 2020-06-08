<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/4 0004
  Time: 22:14
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
            <form class="form-inline">

                <table class="bg-info table ">
                    <tr ></tr>
                    <tr>
                        <td style="width: 15%"></td>
                        <td style="width: 60%;">
                            <div class="form-group">
                                <label for="name">姓名</label>
                                <input type="text" class="form-control" readonly="readonly" id="name" placeholder="李子杨">
                            </div>
                            <div class="form-group">
                                <label for="sno">学号</label>
                                <input type="text" class="form-control" readonly="readonly" id="sno" placeholder="162146140109">
                            </div><br><br>
                            <div class="form-group">
                                <label for="gender">性别</label>
                                <input type="text" class="form-control" readonly="readonly" id="gender" placeholder="男">
                            </div>
                            <div class="form-group">
                                <label for="tel">电话</label>
                                <input type="text" class="form-control"  id="tel" placeholder="13101897411">
                            </div><br><br>
                            <div class="form-group">
                                <label for="roomid">宿舍</label>
                                <input type="text" class="form-control" readonly="readonly" id="roomid" placeholder="205">
                            </div>
                            <div class="form-group">
                                <label for="college">学院</label>
                                <input type="text" class="form-control" readonly="readonly" id="college" placeholder="信息工程">
                            </div><br><br>
                            <div class="form-group">
                                <label for="clase">班级</label>
                                <input type="text" class="form-control" readonly="readonly" id="clase" placeholder="软件工程161401">
                            </div>
                            <div class="form-group">
                                <label for="clase">是否在宿舍</label>
                                <input type="text" class="form-control"  id="inroom" placeholder="在宿舍">
                            </div>
                            <br><br>

                        </td>
                        <td>
                            <!-- 保存用户自定义的背景图片 -->
                            <img id="cropedBigImg" value='custom' src="${pageContext.request.contextPath}/photos/162146140109.jpg" data-address='' title="个人照片"/>
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
