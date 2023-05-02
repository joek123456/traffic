<%--
  Created by IntelliJ IDEA.
  User: 32113
  Date: 2023/2/27
  Time: 11:41:56
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script>
        function deleteRoadCondition(id) {
            if (confirm("确定要删除该评论吗？")){
                location.href = "${pageContext.request.contextPath}/condition/delete/"+id;
            }
        }

    </script>
</head>
<body>
<table class="table table-hover table-striped" style="width: 100%">
    <thead style="width: 100%">
    <tr>
        <th>序号</th>
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
    <c:forEach var="roadCondition" items = "${list.conditionList}">
        <tr>
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
                <a href="${pageContext.request.contextPath}/condition/a/${roadCondition.id}" class="btn btn-success text-light">查看详情</a>
                <a href="javascript:deleteRoadCondition(${roadCondition.id})" class="btn btn-danger text-light">删除评论</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="container text-center">
    <a  id="prePage" target="showScreen">
        <c:if test="${list.pageInfo.isFirstPage}"><button class="btn btn-info" disabled>上一页</button></c:if>
        <c:if test="${!list.pageInfo.isFirstPage}"><button class="btn btn-info">上一页</button></c:if>
    </a>
    <span style="font-size: 20px">共${list.pageInfo.total}条数据&nbsp;&nbsp;当前第${list.pageInfo.pageNum}页/共${list.pageInfo.pages}页</span>
    <a  id="nextPage"  target="showScreen">
        <c:if test="${list.pageInfo.isLastPage}"><button class="btn btn-info" disabled>下一页</button></c:if>
        <c:if test="${!list.pageInfo.isLastPage}"><button class="btn btn-info">下一页</button></c:if>
    </a>
</div>

<script>
    var prePage = document.getElementById("prePage");
    var date = null;
    prePage.onclick = function () {
        location.href = "${pageContext.request.contextPath}/condition/listPagePre_a?pageNum=${list.pageInfo.pageNum}";
    }

    var nextPage = document.getElementById("nextPage");
    nextPage.onclick = function () {
        location.href = "${pageContext.request.contextPath}/condition/listPageNext_a?pageNum=${list.pageInfo.pageNum}";
    }

</script>

</body>
</html>
