<%@ page import="java.net.http.HttpRequest" %><%--
  Created by IntelliJ IDEA.
  User: 32113
  Date: 2023/3/28
  Time: 21:50:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <title>Title</title>
</head>
<body>
<%
    String author = request.getParameter("author");
%>
<div class="container">
    <table class="table">
        <form action="${pageContext.request.contextPath}/notice/publish" method="post">
            <tr style="opacity: 0">
                <td>用户编号：</td>
                <td>
                    <input type="text" class="form-control" name="author" value="<%=author%>" />
                </td>
            </tr>
            <tr>
                <td>公告标题：</td>
                <td>
                    <input type="text" style="font-size: 20px" class="form-control" name="title" placeholder="点击这里输入标题..."/>
                </td>
            </tr>
            <tr>
                <td>公告内容：</td>
                <td>
                    <textarea class="form-control" name="content" style="width: 100%;padding: 10px;font-size: 15px" rows="10;" required placeholder="在此处输入内容..."></textarea>
                </td>
            </tr>
            <tr>
                <td class="text-center" colspan="2">
                    <button type="submit" class="btn btn-success col-md-3" >发布</button>
                </td>
            </tr>
        </form>
    </table>
</div>
</body>
</html>
