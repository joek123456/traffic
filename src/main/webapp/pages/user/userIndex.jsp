<%--
  Created by IntelliJ IDEA.
  User: 32113
  Date: 2023/2/20
  Time: 19:10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>智慧交通管理系统</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/setTarget.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
<body style="">
<div style="height: 100%; margin: 0;background: url('${pageContext.request.contextPath}/images/index-bg.jpg');background-size: cover;">
    <div class="row" style=" background: rgba(255,255,255,0.8);height: 10%; padding: 20px 0;margin: 0">
        <jsp:include page="top.jsp"></jsp:include>

    </div>
    <div class="row" style="height: 90%;margin: 0">
        <div class="col-md-2" style="height: 100%; background: rgba(255,255,255,0.8); padding: 0;">
            <jsp:include page="menu.jsp"></jsp:include>
        </div>
        <div class="col-md-10" style="height: 100%;padding: 0;background: rgba(255,255,255,1);">
            <jsp:include page="${pageContext.request.contextPath}/user/toHome"></jsp:include>
        </div>
    </div>
</div>
</body>
<script>

    $(".list ul").hide();
    $(".list>li>div").click(function () {
        $(this).children("span>b").text("^");
        var aa = $(this).next().slideToggle(300).parent("li").siblings().children(".list>li>ul").slideUp(300);
    })

    /*setInterval(getNowTime, 100);

    function getNowTime() {
        var date = new Date();
        var dateTime = date.toLocaleString();
        document.getElementById("dateTime").innerHTML = dateTime;
    }*/


</script>
</html>
