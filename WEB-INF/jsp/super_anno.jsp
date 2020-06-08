<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/6 0006
  Time: 0:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <title>公告</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script>

    function look(id) {
        location.href="${pageContext.request.contextPath}/main/annolook?id="+id;
    }
    window.onload = function(){
        document.getElementById("first").onclick = function () {
            var checkboxs = document.getElementsByName("annoid");
            for (var i =0 ;i<checkboxs.length;i++){
                checkboxs[i].checked = this.checked;
            }
        }}
</script>
</head>
<body>
<div class="panel panel-info pull-right" style="width: 100%">
    <div class="panel-heading ">公告</div>
    <div class="panel-body">
<div class="pull-right">
        <a href="${pageContext.request.contextPath}/main/anno_insert"><button  class="btn btn-default">新建公告</button></a>

</div>
        <div>
            <form class="form-inline" action="${pageContext.request.contextPath}/anno/findAnnoByPage" method="post">
                <div class="form-group">
                    <label for="title">名称</label>
                    <input type="text" name="title" class="form-control" id="title" value="${title}">
                </div>
                <div class="form-group">
                    <label for="author">发布人</label>
                    <input type="text" name="author" class="form-control" id="author" value="${author}">
                </div>
                <button type="submit" class="btn btn-default">查询</button>

            </form>
        </div>

        <form action="${pageContext.request.contextPath}/anno/delete" method="post">
        <button type="submit" class="btn btn-default" >删除</button>

        <table class="table table-bordered">
            <tr class="bg-success">
                <th>
                    <input  type="checkbox"  id="first" value="" />
                </th>
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
                <th>
                    身份
                </th>
                <th>
                    查看
                </th>
            </tr>
            <c:forEach items="${pb.list}" var="announcement" varStatus="s">
                <tr>
                    <td>
                        <input name="annoid"  type="checkbox" value="${announcement.id}" />
                    </td>
                    <td>
                            ${s.count}
                    </td>

                    <td>
                            ${announcement.title}
                    </td>
                    <td>
                            ${announcement.date}
                    </td>
                    <td>
                            ${announcement.author}
                    </td>
                    <td>
                            ${announcement.position}
                    </td>
                    <td>
                        <button type="button" class="btn btn-success" onclick="look(${announcement.id})">查看</button>
                    </td>
                </tr>
            </c:forEach>

        </table></form>
        <div style="text-align: center">
            <span>${pb.totalCounts}条公告，共${pb.totalPages}页</span>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="${pageContext.request.contextPath}/anno/findAnnoByPage?currentPage=${pb.currentPage-1}&rows=8&title=${title}&author=${author}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${pb.totalPages}" var="i">

                        <c:if test="${pb.currentPage == i}">
                            <li class="active"><a href="${pageContext.request.contextPath}/anno/findAnnoByPage?currentPage=${i}&rows=8&title=${title}&author=${author}">${i}</a></li>
                        </c:if>
                        <c:if test="${pb.currentPage != i}">
                            <li ><a href="${pageContext.request.contextPath}/anno/findAnnoByPage?currentPage=${i}&rows=8&title=${title}&author=${author}">${i}</a></li>
                        </c:if>
                    </c:forEach>


                    <li>
                        <a href="${pageContext.request.contextPath}/anno/findAnnoByPage?currentPage=${pb.currentPage+1}&rows=8&title=${title}&author=${author}" aria-label="Next">
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
