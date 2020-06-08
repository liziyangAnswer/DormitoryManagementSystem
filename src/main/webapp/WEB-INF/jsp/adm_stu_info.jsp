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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <title>学生信息查询</title>
</head>
<body>
<div class="panel panel-info pull-right" style="width: 100%">
    <div class="panel-heading ">学生信息查询</div>
    <div class="panel-body">

        <div>
            <form class="form-inline" action="student/findByPage" method="post">
                <div class="form-group">
                    <label for="name">姓名</label>
                    <input type="text" class="form-control" id="name">
                </div>
                <div class="form-group">
                    <label for="dorm">宿舍</label>
                    <input type="text" class="form-control" id="dorm" >
                </div>
                <button type="submit" class="btn btn-default">查询</button>
            </form>
        </div>
        <table class="table table-bordered">
            <tr class="bg-success">
                <th>
                    编号
                </th>
                <th>
                    姓名
                </th>
                <th>
                    班级
                </th>
                <th>
                    宿舍
                </th>
                <th>
                    是否在宿舍
                </th>
                <th>
                    信息
                </th>
            </tr>
            <tr>
                <td>
                    1
                </td>
                <td>
                    李子杨
                </td>
                <td>
                    软件工程161401
                </td>
                <td>
                    澄园2号205
                </td>
                <td>
                    在宿舍
                </td>
                <td>
                    <button type="button" class="btn btn-success">修改</button>
                </td>
            </tr>
            <tr>
                <td>
                    2
                </td>
                <td>
                    李子杨
                </td>
                <td>
                    软件工程161401
                </td>
                <td>
                    澄园2号205
                </td>
                <td>
                    在宿舍
                </td>
                <td>
                    <button type="button" class="btn btn-success">修改</button>
                </td>
            </tr>
            <tr>
                <td>
                    3
                </td>
                <td>
                    李子杨
                </td>
                <td>
                    软件工程161401
                </td>
                <td>
                    澄园2号205
                </td>
                <td>
                    在宿舍
                </td>
                <td>
                    <button type="button" class="btn btn-success">修改</button>
                </td>
            </tr>
            <tr>
                <td>
                    4
                </td>
                <td>
                    李子杨
                </td>
                <td>
                    软件工程161401
                </td>
                <td>
                    澄园2号205
                </td>
                <td>
                    在宿舍
                </td>
                <td>
                    <button type="button" class="btn btn-success">修改</button>
                </td>
            </tr>
            <tr>
                <td>
                    5
                </td>
                <td>
                    李子杨
                </td>
                <td>
                    软件工程161401
                </td>
                <td>
                    澄园2号205
                </td>
                <td>
                    在宿舍
                </td>
                <td>
                    <button type="button" class="btn btn-success">修改</button>
                </td>
            </tr>
            <tr>
                <td>
                    6
                </td>
                <td>
                    李子杨
                </td>
                <td>
                    软件工程161401
                </td>
                <td>
                    澄园2号205
                </td>
                <td>
                    在宿舍
                </td>
                <td>
                    <button type="button" class="btn btn-success">修改</button>
                </td>
            </tr>
            <tr>
                <td>
                    7
                </td>
                <td>
                    李子杨
                </td>
                <td>
                    软件工程161401
                </td>
                <td>
                    澄园2号205
                </td>
                <td>
                    在宿舍
                </td>
                <td>
                    <button type="button" class="btn btn-success">修改</button>
                </td>
            </tr>
            <tr>
                <td>
                    8
                </td>
                <td>
                    李子杨
                </td>
                <td>
                    软件工程161401
                </td>
                <td>
                    澄园2号205
                </td>
                <td>
                    在宿舍
                </td>
                <td>
                    <button type="button" class="btn btn-success">修改</button>
                </td>
            </tr>
        </table>
        <div style="text-align: center">
            <span>10条学生信息，共2页</span>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>

                </ul>
            </nav>
        </div>

    </div>
</div>

</body>
</html>
