<%--
  Created by IntelliJ IDEA.
  User: 32113
  Date: 2023/2/23
  Time: 21:37:02
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html style="width: 100%">
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
    <style>
        td{
             overflow: hidden;
             text-overflow: ellipsis;
             white-space: nowrap;
         }
        #child {
            background: url("${pageContext.request.contextPath}/images/userHomeBG.webp");
            background-size: cover;
        }

    </style>
</head>
<body style="width: 100%">


<div style="height: 100%; margin: 0;background: url('${pageContext.request.contextPath}/images/index-bg.jpg');background-size: cover;">
    <div class="row" style=" background: rgba(255,255,255,0.8);height: 10%; padding: 20px 0;margin: 0">
        <jsp:include page="top.jsp"></jsp:include>
    </div>
    <div class="row" style="height: 90%;margin: 0">
        <div class="col-md-2" style="height: 100%; background: rgba(255,255,255,0.8); padding: 0;">
            <jsp:include page="menu.jsp"></jsp:include>
        </div>
        <div id="child" class="col-md-10" style="height: 100%;padding: 0;overflow-y: scroll">
            <div style="width: 100%;height: 100%; background: rgba(255,255,255,0.7);">
                <table class="table table-hover table-striped" style="width: 100%">
                    <thead style="width: 100%">
                    <tr>
                        <th>本页序号</th>
                        <th>发表的用户</th>
                        <th>所在城市</th>
                        <th>详细地址</th>
                        <th>拥堵情况</th>
                        <th>发表时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody style="width: 100%">
                    <%int i = 0;%>
                    <c:forEach items = "${conditionList.conditionList}" var="roadCondition" >
                        <tr id="data">
                            <%i = i+1;%>
                            <td><%=i%></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/user/show_detail_a?id=${roadCondition.uid}">${roadCondition.user.name}</a>
                            </td>
                            <td>${roadCondition.city}</td>
                            <td>${roadCondition.address}</td>
                            <td>
                                <c:if test="${roadCondition.status==1}"><span class="text-success">畅通</span></c:if>
                                <c:if test="${roadCondition.status==2}"><span class="text-primary">基本畅通</span></c:if>
                                <c:if test="${roadCondition.status==3}"><span class="text-info">轻度拥堵</span></c:if>
                                <c:if test="${roadCondition.status==4}"><span class="text-warning">中度拥堵</span></c:if>
                                <c:if test="${roadCondition.status==5}"><span class="text-danger">严重拥堵</span></c:if>
                            </td>
                            <td>${roadCondition.publishDate}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/condition/${roadCondition.id}" class="btn btn-success">查看详情</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="container text-center">
                    <a  id="prePage">
                        <c:if test="${conditionList.pageInfo.isFirstPage}"><button class="btn btn-info" disabled>上一页</button></c:if>
                        <c:if test="${!conditionList.pageInfo.isFirstPage}"><button class="btn btn-info">上一页</button></c:if>
                    </a>
                    <span style="font-size: 20px">共${conditionList.pageInfo.total}条数据&nbsp;&nbsp;当前第${conditionList.pageInfo.pageNum}页/共${conditionList.pageInfo.pages}页</span>
                    <a  id="nextPage">
                        <c:if test="${conditionList.pageInfo.isLastPage}"><button class="btn btn-info" disabled>下一页</button></c:if>
                        <c:if test="${!conditionList.pageInfo.isLastPage}"><button class="btn btn-info">下一页</button></c:if>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>



<script>
    var prePage = document.getElementById("prePage");
    var date = null;
    prePage.onclick = function () {
        location.href = "${pageContext.request.contextPath}/condition/listPagePre?pageNum=${conditionList.pageInfo.pageNum}";
    }

    var nextPage = document.getElementById("nextPage");
    nextPage.onclick = function () {
        location.href = "${pageContext.request.contextPath}/condition/listPageNext?pageNum=${conditionList.pageInfo.pageNum}";
    }



</script>
</body>
</html>
