<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/6 0006
  Time: 0:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script>

        function update(sno) {
            location.href="${pageContext.request.contextPath}/main/super_adm_update?sno="+sno;
        }
        window.onload = function(){
            document.getElementById("first").onclick = function () {
                var checkboxs = document.getElementsByName("admid");
                for (var i =0 ;i<checkboxs.length;i++){
                    checkboxs[i].checked = this.checked;
                }
            }}
    </script>
    <title>宿管信息查询</title>
</head>
<body>
<div class="panel panel-info pull-right" style="width: 100%">
    <div class="panel-heading ">宿管信息查询</div>
    <div class="panel-body">

        <div>
            <form class="form-inline" action="${pageContext.request.contextPath}/admin/findAdminByPage" method="post">
                <div class="form-group">
                    <label for="name">姓名</label>
                    <input type="text" name="name" class="form-control" id="name" value="${name}">
                </div>
                <div class="form-group">
                    <label for="dorm">宿舍</label>
                    <input type="text" name="roomid" class="form-control" id="dorm" value="${roomid}">
                </div>
                <button type="submit" class="btn btn-default">查询</button>

            </form>
        </div>
        <form action="${pageContext.request.contextPath}/admin/delete" method="post">
            <button type="submit" class="btn btn-default" >删除</button>

            <table class="table table-bordered">
                <tr class="bg-success">
                    <th>
                        <input  type="checkbox" id="first" value="" />
                    </th>
                    <th>
                        编号
                    </th>
                    <th>
                        姓名
                    </th>
                    <th>
                        电话
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
                <c:forEach items="${pb.list}" var="admin" varStatus="s">
                    <tr>
                        <td>
                            <input name="admid" type="checkbox" value="${admin.sno}" />
                        </td>
                        <td>
                                ${s.count}
                        </td>
                        <td>
                                ${admin.name}
                        </td>
                        <td>
                                ${admin.tel}
                        </td>
                        <td>
                                ${admin.roomid}
                        </td>
                        <td>
                                ${admin.inroom}
                        </td>
                        <td>
                            <button type="button" class="btn btn-success" onclick="update(${admin.sno})">修改</button>
                        </td>
                    </tr>
                </c:forEach>

            </table></form>
        <div style="text-align: center">
            <span>${pb.totalCounts}条宿管信息，共${pb.totalPages}页</span>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/findAdminByPage?currentPage=${pb.currentPage-1}&rows=8&name=${name}&roomid=${roomid}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${pb.totalPages}" var="i">

                        <c:if test="${pb.currentPage == i}">
                            <li class="active"><a href="${pageContext.request.contextPath}/admin/findAdminByPage?currentPage=${i}&rows=8&name=${name}&roomid=${roomid}">${i}</a></li>
                        </c:if>
                        <c:if test="${pb.currentPage != i}">
                            <li ><a href="${pageContext.request.contextPath}/admin/findAdminByPage?currentPage=${i}&rows=8&name=${name}&roomid=${roomid}">${i}</a></li>
                        </c:if>
                    </c:forEach>


                    <li>
                        <a href="${pageContext.request.contextPath}/admin/findAdminByPage?currentPage=${pb.currentPage+1}&rows=8&name=${name}&roomid=${roomid}" aria-label="Next">
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
