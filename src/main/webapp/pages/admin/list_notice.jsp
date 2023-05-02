<%--
  Created by IntelliJ IDEA.
  User: 32113
  Date: 2023/3/30
  Time: 14:38:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
<body>
<div class="container" style="">
    <div style="" class="rol-md-12 text-center ">
        <h3>全部公告列表</h3>
    </div>
    <table class="table table-hover table-striped" style="width: 100%">
        <%--<tr class="text-center">
            <th>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">关键字搜索：</span>
                    </div>
                    <input type="text" class="form-control col-md-9" placeholder="在此输入关键字"/>
                </div>
            </th>
            <th>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">开始日期：</span>
                    </div>
                    <input type="date" class="form-control col-md-9"/>
                </div>
            </th>
            <th>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">结束日期：</span>
                    </div>
                    <input type="date" class="form-control col-md-9" style="user-select: none"/>
                </div>
            </th>
            <th>
                <input type="button" class="btn btn-success" value="搜索">
            </th>
        </tr>--%>
        <tr class="text-center">
            <th colspan="2">标题</th>
            <th colspan="2" class="text-right">发布时间</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${noticeList}" var="notice">

            <tr>
                <td colspan="2"><a href="${pageContext.request.contextPath}/notice/showDetail/${notice.id}">${notice.title}</a></td>
                <td colspan="2" class="text-right">${notice.date}</td>
                <td class="text-center">
                    <a class="btn btn-danger" href="javascript:deleteById(${notice.id})" target="showScreen">删除公告</a>
                </td>
            </tr>

        </c:forEach>
    </table>
</div>
</body>
<script>
    function deleteById(id) {
        if (confirm("确定要删除该公告吗？")) {
            location.href="${pageContext.request.contextPath}/notice/deleteById?id="+id;
        }
    }



</script>
</html>
