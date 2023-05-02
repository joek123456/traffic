<%--
  Created by IntelliJ IDEA.
  User: 32113
  Date: 2023/3/1
  Time: 9:23:31
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"
    <script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
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
            <div class="container" style="background: rgba(255,255,255,0.7); height: 100%">
                <div style="height: 100px;"></div>
                <div class="text-center">
                    <img style="width: 100px; height: 100px; border-radius: 50%;" src="${pageContext.request.contextPath}/images/userHeader03.jpeg" alt=""><br />
                    <span class="h3">${roadCondition.user.name}</span>
                </div>
                <div style="height: 30px;"></div>
                <hr/>
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-9">
                                <h4 class="card-title">
                                    ${roadCondition.user.name}<small style="font-size: 65%">(发布城市：${roadCondition.city})</small>
                                </h4>
                            </div>
                            <div class="col-md-3 text-center">
                                <span>${roadCondition.publishDate}</span>
                            </div>
                        </div>
                        <hr>
                        <p class="card-text" >
                            <<
                            <c:if test="${roadCondition.status==1}"><span style="font-size: 20px" class="text-success">畅通</span></c:if>
                            <c:if test="${roadCondition.status==2}"><span style="font-size: 20px" class="text-primary">基本畅通</span></c:if>
                            <c:if test="${roadCondition.status==3}"><span style="font-size: 20px" class="text-info">轻度拥堵</span></c:if>
                            <c:if test="${roadCondition.status==4}"><span style="font-size: 20px" class="text-warning">中度拥堵</span></c:if>
                            <c:if test="${roadCondition.status==5}"><span style="font-size: 20px" class="text-danger">严重拥堵</span></c:if>
                            >>
                            ${roadCondition.address}
                        </p>
                        <hr>
                        <div class="row">
                            <div class= "col-md-10">
                                <input type="text" class = " form-control" name="content" id="content"/>
                            </div>
                            <div class= "col-md-2">
                                <a href="javascript:publishComment([${nowUser.id},${roadCondition.id}])" style="width: 100%;" class = "btn btn-success">发布评论</a>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <ul class="list-group">
                            <c:forEach var="conmment" items="${roadCondition.commentList}">
                                <li class="list-group-item row">
                                    <div class="col-md-12" style="position: relative">
                                        <b>${conmment.user.name}：</b>${conmment.content}
                                        <span class="text-right" style="position: absolute;right: 10px;font-size: 15px">${conmment.date}</span>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<script>
    function publishComment(arr) {
        var content = document.getElementById("content").value;
        // alert("cid="+arr[1]+"&uid="+arr[0]+"&content="+content)
        location.href="${pageContext.request.contextPath}/comment/add?cid="+arr[1]+"&uid="+arr[0]+"&content="+content;
    }

</script>
</body>
</html>
