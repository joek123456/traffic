<%--
  Created by IntelliJ IDEA.
  User: 32113
  Date: 2023/2/24
  Time: 20:33:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>智慧交通管理系统(管理员)</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <style>
        ul {
            list-style: none;
            padding-left: 20px;
        }

        .list > li div {
            padding: 0 15px;
            height: 40px;
            line-height: 40px;
            cursor: pointer;
        }

        .list div:hover, .list ul li:hover {
            background: silver;
        }

        .list ul li {
            height: 30px;
            line-height: 30px;
            cursor: pointer;
        }

        .col-md-2 {
            /* overflow-y: scroll; */
        }

        body {

        }
    </style>
</head>
<body style="">
<div class=""
     style="height: 100%;background: url('${pageContext.request.contextPath}/images/index-bg.jpg');background-size: cover;">
    <div class="row" style="margin: 0; background: rgba(255,255,255,0.8);height: 10%; padding: 20px 0 ">
        <div class="col-md-9">
            <h2>欢迎使用智慧交通系统</h2>
        </div>
        <div class="col-md-3" style="position: relative;">
            <div class="dropdown">
                <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">
                    管理员：${admin.name}
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/selectById?id=${admin.id}" target="showScreen">管理员信息</a>
                    </li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/">退出</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="row" style="height: 90%;margin: 0;">
        <div class="col-md-2" style="height: 100%; background: rgba(255,255,255,0.8); padding: 0;">
            <ul class="list" style="height: 100%;">
                <li>
                    <a href="${pageContext.request.contextPath}/admin/loadIndex?id=${admin.id}" target="showScreen">
                        <div>首页</div>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/listUser" target="showScreen">
                        <div>用户总览</div>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/listCondition" target="showScreen">
                        <div>路况总览</div>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/listAdmin" target="showScreen">
                        <div>管理员总览</div>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/pages/admin/publish_notice.jsp?author=${admin.id}"
                       target="showScreen">
                        <div>发布公告</div>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/notice/findAllByAdmin"
                       target="showScreen">
                        <div>已发布公告</div>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/selectById?id=${admin.id}"
                       target="showScreen">
                        <div>我的信息</div>
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-md-10" style="height: 100%;background: #c8cbcf;padding: 0">
            <iframe src="${pageContext.request.contextPath}/admin/loadIndex?id=${admin.id}" frameborder="0"
                    style="width: 100%; height: 100%;" name="showScreen">

            </iframe>
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

</script>
</html>
