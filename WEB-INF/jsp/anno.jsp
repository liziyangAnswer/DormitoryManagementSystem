<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/5 0005
  Time: 23:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>公告</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="j${pageContext.request.contextPath}/s/bootstrap.min.js"></script>
</head>
<body>
<div class="panel panel-info pull-right" style="width: 100%">
    <div class="panel-heading ">公告</div>
    <div class="panel-body">


        <table class="table table-bordered">
            <tr class="bg-success">
                <th>
                    编号
                </th>
                <th>
                    公告名称
                </th>
                <th>
                    发布时间
                </th>
                <th>
                    发布人
                </th>
            </tr>
            <tr>
                <td>
                    1
                </td>
                <td>
                   这是一条测试公告
                </td>
                <td>
                    2020年3月3号
                </td>
                <td>
                    张三
                </td>

            </tr>
            <tr>
                <td>
                    2
                </td>
                <td>
                    这是一条测试公告
                </td>
                <td>
                    2020年3月3号
                </td>
                <td>
                    张三
                </td>
            </tr>
            <tr>
                <td>
                    3
                </td>
                <td>
                    这是一条测试公告
                </td>
                <td>
                    2020年3月3号
                </td>
                <td>
                    张三
                </td>
            </tr>
            <tr>
                <td>
                    4
                </td>
                <td>
                    这是一条测试公告
                </td>
                <td>
                    2020年3月3号
                </td>
                <td>
                    张三
                </td>
            </tr>
            <tr>
                <td>
                    5
                </td>
                <td>
                    这是一条测试公告
                </td>
                <td>
                    2020年3月3号
                </td>
                <td>
                    张三
                </td>
            </tr>
            <tr>
                <td>
                    6
                </td>
                <td>
                    这是一条测试公告
                </td>
                <td>
                    2020年3月3号
                </td>
                <td>
                    张三
                </td>
            </tr>
            <tr>
                <td>
                    7
                </td>
                <td>
                    这是一条测试公告
                </td>
                <td>
                    2020年3月3号
                </td>
                <td>
                    张三
                </td>
            </tr>
            <tr>
                <td>
                    8
                </td>
                <td>
                    这是一条测试公告
                </td>
                <td>
                    2020年3月3号
                </td>
                <td>
                    张三
                </td>
            </tr>
        </table>
        <div style="text-align: center">
            <span>10条公告，共2页</span>
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
