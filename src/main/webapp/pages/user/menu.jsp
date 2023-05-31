<%--
  Created by IntelliJ IDEA.
  User: 32113
  Date: 2023/4/16
  Time: 13:10:58
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
            border-radius: 20px;
        }

        .list ul li {
            height: 30px;
            line-height: 30px;
            cursor: pointer;
        }

    </style>
</head>
<body>

<ul class="list" style="height: 100%;">
    <li>
        <a href="${pageContext.request.contextPath}/user/toHome">
            <%--                    <a href="${pageContext.request.contextPath}/user/toHome" target="showScreen">--%>
            <div>首页</div>
        </a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/notice/findAllByUser">
            <div>所有公告</div>
        </a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/pages/user/publish_condition.jsp">
            <div>发布路况信息</div>
        </a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/condition/list">
            <div>所有路况信息</div>
        </a>
    </li>

    <li>
        <a href="${pageContext.request.contextPath}/pages/user/map.jsp">
            <div>搜索线路</div>
        </a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/user/updateUI?id=${nowUser.id}">
            <div>我的信息</div>
        </a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/condition/findByUid?id=${nowUser.id}">
            <div>发表记录</div>
        </a>
    </li>
</ul>



</body>
</html>
