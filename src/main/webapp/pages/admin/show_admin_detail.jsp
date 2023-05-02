<%--
  Created by IntelliJ IDEA.
  User: 32113
  Date: 2023/3/1
  Time: 19:57:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div style="height: 100px">

    </div>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <table class="table">
                <tr>
                    <td>id</td>
                    <td>${admin.id}</td>
                </tr>
                <tr>
                    <td>账号：</td>
                    <td>${admin.name}</td>
                </tr>
                <tr>
                    <td>真实姓名：</td>
                    <td>${admin.trueName}</td>
                </tr>
                <tr>
                    <td>联系电话:</td>
                    <td>${admin.phone}</td>
                </tr>
            </table>
        </div>
        <div class="col-md-3"></div>
    </div>

</div>
</body>
</html>
