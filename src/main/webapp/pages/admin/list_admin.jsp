<%--
  Created by IntelliJ IDEA.
  User: 32113
  Date: 2023/2/27
  Time: 11:11:02
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
<body>
<table class="table table-hover table-striped" style="width: 100%">
    <thead style="width: 100%">
    <tr>
        <th>管理员id</th>
        <th>用户名</th>
<%--        <th>密码</th>--%>
        <th>真实姓名</th>
        <th>联系电话</th>
    </tr>
    </thead>
    <tbody style="width: 100%">
    <c:forEach var="admin" items = "${list}">
        <tr>
            <td>${admin.id}</td>
            <td>${admin.name}</td>
<%--            <td>${admin.pwd}</td>--%>
            <td>${admin.trueName}</td>
            <td>${admin.phone}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
