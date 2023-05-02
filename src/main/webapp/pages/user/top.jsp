<%--
  Created by IntelliJ IDEA.
  User: 32113
  Date: 2023/4/16
  Time: 13:16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/setTarget.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
<body>

<div class="col-md-9">
    <h2>欢迎使用智慧交通系统<small style="font-size: 22px">&nbsp;&nbsp;当前时间：<span id="dateTime"></span></small></h2>
</div>
<div class="col-md-3" style="position: relative;">
    <div class="dropdown">
        <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">
            当前用户：${nowUser.name}
        </button>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item"
                   href="${pageContext.request.contextPath}/user/show_detail?id=${nowUser.id}">个人信息</a>
            </li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/">退出</a></li>
        </ul>
    </div>
</div>
<script>
    setInterval(getNowTime, 100);
    function getNowTime() {
        var date = new Date();
        var dateTime = date.toLocaleString();
        document.getElementById("dateTime").innerHTML = dateTime;
    }
</script>

</body>
</html>
