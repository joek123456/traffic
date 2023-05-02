<%--
  Created by IntelliJ IDEA.
  User: 32113
  Date: 2023/3/30
  Time: 15:13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
    <style>
        .notice_content p{
            text-indent: 2em;
        }
    </style>
</head>
<body style="background-image: linear-gradient(25deg, #aab8f3, #c3cbde, #d8e0c9, #e9f4b2)">

<div style="height: 100%; margin: 0;background: url('${pageContext.request.contextPath}/images/index-bg.jpg');background-size: cover;">
    <div class="row" style=" background: rgba(255,255,255,0.8);height: 10%; padding: 20px 0;margin: 0">
        <jsp:include page="top.jsp"></jsp:include>

    </div>
    <div class="row" style="height: 90%;margin: 0">
        <div class="col-md-2" style="height: 100%; background: rgba(255,255,255,0.8); padding: 0;">
            <jsp:include page="menu.jsp"></jsp:include>
        </div>
        <div class="col-md-10" style="height: 100%;padding: 0;background: rgba(255,255,255,1);overflow-y: scroll">
            <div class="container">
                <div style="height: 50px"></div>
                <div class="text-center">
                    <h2>${notice.title}</h2>
                    <span style="font-size: 16px">发布人：${notice.admin.name}&nbsp;|&nbsp;发布日期：${notice.date}</span>
                </div>
                <hr>
                <div class="notice_content" style="font-size: 20px">
                    <p>${notice.content}</p>
                </div>
                <hr>
            </div>
        </div>
    </div>
</div>



</body>
</html>
