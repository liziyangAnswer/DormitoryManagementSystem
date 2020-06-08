<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/10 0010
  Time: 1:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <title>来访人员列表</title>
    <script>
        window.onload = function(){
        document.getElementById("first").onclick = function () {
            var checkboxs = document.getElementsByName("visitorid");
            for (var i =0 ;i<checkboxs.length;i++){
                checkboxs[i].checked = this.checked;
            }
        }}
    </script>
</head>
<body>

<div class="panel panel-info pull-right" style="width: 100%">
    <div class="panel-heading ">来访人员列表</div>
    <div class="panel-body">

        <div>
            <form class="form-inline" action="${pageContext.request.contextPath}/admin/findVisitorByPage" method="post">
                <div class="form-group">
                    <label for="name">姓名</label>
                    <input type="text" name="name" class="form-control" id="name" value="${name}">
                </div>
                <div class="form-group">
                    <label for="dorm">来访宿舍</label>
                    <input type="text" name="roomid" class="form-control" id="dorm" value="${roomid}">
                </div>
                <button type="submit" class="btn btn-default">查询</button>

            </form>
        </div>
        <form action="${pageContext.request.contextPath}/admin/visitorDelete" method="post">
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
                        姓名
                    </th>
                    <th>
                        来访宿舍
                    </th>
                    <th>
                        电话
                    </th>
                    <th>
                        来访日期
                    </th>
                </tr>
                <c:forEach items="${pb.list}" var="visitor" varStatus="s">
                    <tr>
                        <td>
                            <input name="visitorid"  type="checkbox" value="${visitor.id}" />
                        </td>
                        <td>
                                ${s.count}
                        </td>
                        <td>
                                ${visitor.name}
                        </td>
                        <td>
                                ${visitor.roomid}
                        </td>
                        <td>
                                ${visitor.tel}
                        </td>
                        <td>
                                ${visitor.date}
                        </td>
                    </tr>
                </c:forEach>

            </table></form>
        <div style="text-align: center">
            <span>${pb.totalCounts}条来访信息，共${pb.totalPages}页</span>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/findVisitorByPage?currentPage=${pb.currentPage-1}&rows=8&name=${name}&roomid=${roomid}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${pb.totalPages}" var="i">

                        <c:if test="${pb.currentPage == i}">
                            <li class="active"><a href="${pageContext.request.contextPath}/admin/findVisitorByPage?currentPage=${i}&rows=8&name=${name}&roomid=${roomid}">${i}</a></li>
                        </c:if>
                        <c:if test="${pb.currentPage != i}">
                            <li ><a href="${pageContext.request.contextPath}/admin/findVisitorByPage?currentPage=${i}&rows=8&name=${name}&roomid=${roomid}">${i}</a></li>
                        </c:if>
                    </c:forEach>


                    <li>
                        <a href="${pageContext.request.contextPath}/admin/findVisitorByPage?currentPage=${pb.currentPage+1}&rows=8&name=${name}&roomid=${roomid}" aria-label="Next">
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
