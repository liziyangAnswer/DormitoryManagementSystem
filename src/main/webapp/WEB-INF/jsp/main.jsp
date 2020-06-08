<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/13 0013
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Main</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <c:import url="head.jsp"></c:import>

</head>
<body>
<div class="bg-info pull-left" style="width: 15% ;height: 800px " >
    <ul class="nav nav-pills nav-stacked">
        <%--学生菜单--%>
        <c:if test="${resoultinfo.status==1}">
            <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/main/welcome" target="inner"><i class="glyphicon glyphicon-tasks" aria-hidden="true"></i>&nbsp&nbsp 菜单</a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/main/stu_info" target="inner"><i class="glyphicon glyphicon-user" aria-hidden="true"></i>&nbsp&nbsp 个人信息 </a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/main/stu_update" target="inner"><i class="glyphicon glyphicon-user" aria-hidden="true"></i>&nbsp&nbsp 修改信息 </a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/student/findEffectByPage" target="inner"><i class="glyphicon glyphicon-search" aria-hidden="true"></i>&nbsp&nbsp 查看个人物品 </a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/main/stu_effect_insert" target="inner"><i class="glyphicon glyphicon-plus" aria-hidden="true"></i>&nbsp&nbsp 添加个人物品 </a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/anno/findAnnoByPage" target="inner"><i class="glyphicon glyphicon-volume-up" aria-hidden="true"></i>&nbsp&nbsp 公告 </a></li>
        </c:if>
            <%--宿管菜单--%>
        <c:if test="${resoultinfo.status==2}">
            <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/main/welcome" target="inner"><i class="glyphicon glyphicon-tasks" aria-hidden="true"></i>&nbsp&nbsp 菜单</a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/main/adm_info" target="inner"><i class="glyphicon glyphicon-user" aria-hidden="true"></i>&nbsp&nbsp 个人信息 </a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/main/adm_update" target="inner"><i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>&nbsp&nbsp 修改个人信息 </a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/student/findStudentByPage" target="inner"><i class="glyphicon glyphicon-search" aria-hidden="true"></i>&nbsp&nbsp 查询学生信息 </a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/main/adm_visitor" target="inner"><i class="glyphicon glyphicon-plus" aria-hidden="true"></i>&nbsp&nbsp 登记来访人员信息 </a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/admin/findVisitorByPage" target="inner"><i class="glyphicon glyphicon-search" aria-hidden="true"></i>&nbsp&nbsp 来访人员列表 </a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/main/adm_upload" target="inner"><i class="glyphicon glyphicon-upload" aria-hidden="true"></i>&nbsp&nbsp 上传卫生检查信息 </a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/anno/findAnnoByPage" target="inner"><i class="glyphicon glyphicon-volume-up" aria-hidden="true"></i>&nbsp&nbsp 公告 </a></li>
        </c:if>
            <%--学工处菜单--%>
        <c:if test="${resoultinfo.status==3}">
            <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/main/welcome" target="inner"><i class="glyphicon glyphicon-tasks" aria-hidden="true"></i>&nbsp&nbsp 菜单</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/main/super_update" target="inner"><i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>&nbsp&nbsp 修改个人信息</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/admin/findAdminByPage" target="inner"><i class="glyphicon glyphicon-search" aria-hidden="true"></i>&nbsp&nbsp 查询宿管信息</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/main/super_adm_insert" target="inner"><i class="glyphicon glyphicon-plus" aria-hidden="true"></i>&nbsp&nbsp 增加宿管信息</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/student/findStudentByPage" target="inner"><i class="glyphicon glyphicon-search" aria-hidden="true"></i>&nbsp&nbsp 查询学生信息</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/main/super_stu_insert" target="inner"><i class="glyphicon glyphicon-plus" aria-hidden="true"></i>&nbsp&nbsp 增加学生信息</a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/anno/findAnnoByPage" target="inner"><i class="glyphicon glyphicon-volume-up" aria-hidden="true"></i>&nbsp&nbsp 公告 </a></li>
        </c:if>
    </ul>
</div>
<div style="width: 85% ;"class="pull-right">
    <iframe name="inner" src="${pageContext.request.contextPath}/main/welcome" frameborder="0" scrolling="no" width="100%" height="100%"></iframe>
</div>
</body>
</html>
