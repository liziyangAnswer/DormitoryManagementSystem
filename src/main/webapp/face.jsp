<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/6 0006
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人脸识别</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</head>
<body>
<div class="panel panel-info pull-right" style="width: 100%">
    <div class="panel-heading ">人脸识别</div>
    <div class="panel-body">
        <div class="col-md-5 ">
<button id="take">拍照</button>
<button type="button" id="btn_sub" >提交</button><br />
<video id="v" style="width: 640px;height: 480px;"></video>
<canvas id="canvas" style="display:none;"></canvas><br />
<img src="" id="photo" alt="photo">
        </div>
<div class="col-md-2 col-md-offset-1">
    <table class="table-bordered">
        <caption id="facemsg" style="color: red">

        </caption>
        <tr>
            <td>
                姓名：
            </td>
            <td id="name">

            </td>
        </tr>
        <tr>
            <td >
                宿舍：
            </td>
            <td id="roomid">

            </td>
        </tr>
        <tr>
            <td >
                是否在宿舍：
            </td>
            <td id="inroom">

            </td>
        </tr>
    </table>
</div>
        <div class="col-md-3">
            <div class="panel panel-info pull-right" style="width: 100%">
                <div class="panel-heading ">采用密码方式验证</div>
                <div class="panel-body">
                    <form id="login_form" action="login/check" method="post" role="form">
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
                        <button type="button" id="btn_login" class="btn btn-success btn-size ">验证</button>

                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
<script>
    let data
    !(function () {
        // 老的浏览器可能根本没有实现 mediaDevices，所以我们可以先设置一个空的对象
        if (navigator.mediaDevices === undefined) {
            navigator.mediaDevices = {};
        }
        if (navigator.mediaDevices.getUserMedia === undefined) {
            navigator.mediaDevices.getUserMedia = function (constraints) {
                // 首先，如果有getUserMedia的话，就获得它
                var getUserMedia = navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;

                // 一些浏览器根本没实现它 - 那么就返回一个error到promise的reject来保持一个统一的接口
                if (!getUserMedia) {
                    return Promise.reject(new Error('getUserMedia is not implemented in this browser'));
                }

                // 否则，为老的navigator.getUserMedia方法包裹一个Promise
                return new Promise(function (resolve, reject) {
                    getUserMedia.call(navigator, constraints, resolve, reject);
                });
            }
        }
        const constraints = {
            video: true,
            audio: false
        };
        let videoPlaying = false;
        let v = document.getElementById('v');
        let promise = navigator.mediaDevices.getUserMedia(constraints);
        promise.then(stream => {
            // 旧的浏览器可能没有srcObject
            if ("srcObject" in v) {
                v.srcObject = stream;
            } else {
                // 防止再新的浏览器里使用它，应为它已经不再支持了
                v.src = window.URL.createObjectURL(stream);
            }
            v.onloadedmetadata = function (e) {
                v.play();
                videoPlaying = true;
            };
        }).catch(err => {
            console.error(err.name + ": " + err.message);
        })
        document.getElementById('take').addEventListener('click', function () {

            if (videoPlaying) {
                let canvas = document.getElementById('canvas');
                canvas.width = v.videoWidth;
                canvas.height = v.videoHeight;
                canvas.getContext('2d').drawImage(v, 0, 0);
                data = canvas.toDataURL('image/webp');
                document.getElementById('photo').setAttribute('src', data);


            }

        }, false);
    })();
    $(function () {
        $("#btn_sub").click(function () {
            $.post("face/face",{photo:data},function (data) {
                if(!data.flag){
                    /*document.getElementById("facemsg").className+=' alert-danger';*/
                    $("#facemsg").html(data.msg)

                }
                if(data.flag){
                    $("#facemsg").html(data.msg)
                    $("#name").html(data.name)
                    $("#roomid").html(data.roomId)
                    $("#inroom").html(data.inRoom)
                }
            })
        })
    })


    $(function () {
        $("#btn_login").click(function () {
            $.post("login/check",$("#login_form").serialize(),function (data) {
                if(!data.flag){
                    /*document.getElementById("facemsg").className+=' alert-danger';*/
                    $("#facemsg").html(data.msg)

                }
                if(data.flag){
                    console.log(data.msg)
                    console.log(data.name)
                    console.log(data.roomId)
                    $("#facemsg").html(data.msg)
                    $("#name").html(data.name)
                    $("#roomid").html(data.roomId)
                    $("#inroom").html(data.inRoom)
                }
            })
        })
    })
</script>
</body>
</html>
