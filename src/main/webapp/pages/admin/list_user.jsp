<%--
  Created by IntelliJ IDEA.
  User: 32113
  Date: 2023/2/27
  Time: 10:11:22
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
        <th>序号</th>
        <th>用户名</th>
        <th>真实姓名</th>
        <th>性别</th>
        <th>邮箱</th>
        <th>联系电话</th>
        <th>注册时间</th>
        <th>近期修改时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody style="width: 100%">
    <%int i = 0;%>
    <c:forEach var="user" items = "${list}">
        <tr>
            <%i = i+1;%>
            <td><%=i%></td>
            <td>
                <a href="${pageContext.request.contextPath}/user/show_detail_a?id=${user.id}">${user.name}</a>
            </td>
            <td>${user.trueName}</td>
            <td>
                <c:choose>
                    <c:when test="${user.gender=='0'}">
                        男
                    </c:when>
                    <c:when test="${user.gender=='1'}">
                        女
                    </c:when>
                    <c:when test="${user.gender=='2'}">
                        保密
                    </c:when>
                </c:choose>
            </td>
            <td>${user.email}</td>
            <td>${user.phoneNumber}</td>
            <td>${user.registerDate}&nbsp;${user.registerTime}</td>
            <td>${user.updateDate}</td>
            <td>
                <a href="${pageContext.request.contextPath}/user/show_detail_a?id=${user.id}" class="btn btn-success">查看信息</a>
                <a href="javascript:deleteById(${user.id})" class="btn btn-danger" >删除用户</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<script>
    function deleteById(id) {
        if (confirm("确定要删除该用户吗？")) {
            location.href="${pageContext.request.contextPath}/user/deleteById?id="+id;
        }
    }

</script>
</body>
</html>
