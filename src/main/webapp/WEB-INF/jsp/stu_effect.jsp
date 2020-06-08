<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/6 0006
  Time: 1:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人物品</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="j${pageContext.request.contextPath}/s/bootstrap.min.js"></script>
    <script>
        window.onload = function(){
        document.getElementById("first").onclick = function () {
            var checkboxs = document.getElementsByName("effectid");
            for (var i =0 ;i<checkboxs.length;i++){
                checkboxs[i].checked = this.checked;
            }
        }}
    </script>
</head>
<body>
<div class="panel panel-info pull-right" style="width: 100%">
    <div class="panel-heading ">个人物品</div>
    <div class="panel-body">

        <form action="${pageContext.request.contextPath}/student/effectDelete" method="post">
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
                        物品名称
                    </th>

                </tr>
                <c:forEach items="${pb.list}" var="effect" varStatus="s">
                    <tr>
                        <td>
                            <input name="effectid"  type="checkbox" value="${effect.id}" />
                        </td>
                        <td>
                                ${s.count}
                        </td>
                        <td>
                                ${effect.name}
                        </td>
                    </tr>
                </c:forEach>

            </table></form>
        <div style="text-align: center">
            <span>${pb.totalCounts}条物品信息，共${pb.totalPages}页</span>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="${pageContext.request.contextPath}/student/findEffectByPage?currentPage=${pb.currentPage-1}&rows=8" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${pb.totalPages}" var="i">

                        <c:if test="${pb.currentPage == i}">
                            <li class="active"><a href="${pageContext.request.contextPath}/student/findEffectByPage?currentPage=${i}&rows=8">${i}</a></li>
                        </c:if>
                        <c:if test="${pb.currentPage != i}">
                            <li ><a href="${pageContext.request.contextPath}/student/findEffectByPage?currentPage=${i}&rows=8">${i}</a></li>
                        </c:if>
                    </c:forEach>


                    <li>
                        <a href="${pageContext.request.contextPath}/student/findEffectByPage?currentPage=${pb.currentPage+1}&rows=8" aria-label="Next">
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
