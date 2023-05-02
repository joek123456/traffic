<%--
  Created by IntelliJ IDEA.
  User: 32113
  Date: 2023/2/25
  Time: 14:36:33
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
    <title>Title</title>
    <style>
        #child {
            background: url("${pageContext.request.contextPath}/images/userHomeBG.webp");
            background-size: cover;
        }
    </style>
</head>
<body>

<div style="height: 100%; margin: 0;background: url('${pageContext.request.contextPath}/images/index-bg.jpg');background-size: cover;">
    <div class="row" style=" background: rgba(255,255,255,0.8);height: 10%; padding: 20px 0;margin: 0">
        <jsp:include page="top.jsp"></jsp:include>

    </div>
    <div class="row" style="height: 90%;margin: 0">
        <div class="col-md-2" style="height: 100%; background: rgba(255,255,255,0.8); padding: 0;">
            <jsp:include page="menu.jsp"></jsp:include>
        </div>
        <div id="child" class="col-md-10" style="height: 100%;padding: 0;overflow-y: scroll">
            <div class="container" style="background: rgba(255, 255, 255, 0.7);">
                <div style="height: 100px;"></div>
                <div class="text-center">
                    <img style="width: 100px; height: 100px; border-radius: 50%;" src="${pageContext.request.contextPath}/images/userHeader03.jpeg" alt=""><br />
                    <span class="h3">${user.name}</span>
                </div>
                <div style="height: 30px;"></div>
                <hr/>
                <div class="row text-center">
                    <div class="col-md-3">
                        <p>已发动态</p>
                        <h5>${count}</h5>
                    </div>
                    <div class="col-md-3">
                        <p>真实姓名</p>
                        <h5>${user.trueName}</h5>
                    </div>
                    <div class="col-md-3">
                        <p>性别</p>
                        <h5>
                            <c:if test="${user.gender==0}">男</c:if>
                            <c:if test="${user.gender==1}">女</c:if>
                            <c:if test="${user.gender==2}">保密</c:if>
                        </h5>
                    </div>
                    <div class="col-md-3">
                        <p>注册时间</p>
                        <h5>${user.registerDate}&nbsp;${user.registerTime}</h5>
                    </div>
                </div>
                <hr/>
                <div class="row text-center">
                    <div class="col-md-3">
                        <p>邮箱</p>
                        <h5>${user.email}</h5>
                    </div>
                    <div class="col-md-3">
                        <p>联系电话</p>
                        <h5>${user.phoneNumber}</h5>
                    </div>
                    <div class="col-md-3">
                        <p>用户排名</p>
                        <h5>${user.id}</h5>
                    </div>
                    <div class="col-md-3">
                        <p>近期修改时间</p>
                        <h5>${user.updateDate}</h5>
                    </div>
                </div>
                <hr/>
                <div class="row text-center" style="margin: 10px 0">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <a href="${pageContext.request.contextPath}/user/updateUI?id=${nowUser.id}" class="btn btn-success"
                        >点这里修改资料</a>
                    </div>
                    <div class="col-md-4"></div>
                </div>
                <div class="">
                    <c:forEach var="roadCondition" items="${conditionList}">
                        <div class="card" style="margin: 5px 0;">
                            <div class="card-body">
                                <div class="card-header row">
                                    <div class="col-md-10">
                                        <h4 class="card-title">
                                                ${user.name}
                                            <span class="small" style="font-size: 15px;">
                                    (发布地点：${roadCondition.city})
                                    </span>
                                        </h4>
                                    </div>
                                    <div class="col-md-2 text-center">
                                        <a class=" text-light text-center btn btn-danger" href="${pageContext.request.contextPath}/condition/${roadCondition.id}/${user.id}">~删除~</a>
                                    </div>
                                </div>
                                <div class="card-body">
                            <span style="font-size: 20px">
                                <<
                                    <c:if test="${roadCondition.status==1}"><span class="text-success">畅通</span></c:if>
                                    <c:if test="${roadCondition.status==2}"><span class="text-primary">基本畅通</span></c:if>
                                    <c:if test="${roadCondition.status==3}"><span class="text-info">轻度拥堵</span></c:if>
                                    <c:if test="${roadCondition.status==4}"><span class="text-warning">中度拥堵</span></c:if>
                                    <c:if test="${roadCondition.status==5}"><span class="text-danger">严重拥堵</span></c:if>
                                >></span>
                                        ${roadCondition.address}
                                </div>
                                <p class="card-footer">${roadCondition.publishDate}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>



</body>
</html>
