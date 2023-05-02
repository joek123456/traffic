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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
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
<script>
    function publishComment(arr) {
        var content = document.getElementById("content").value;
        alert("cid="+arr[1]+"&uid="+arr[0]+"&content="+content)
        location.href="${pageContext.request.contextPath}/comment/add?cid="+arr[1]+"&uid="+arr[0]+"&content="+content;
    }

</script>
</body>
</html>
