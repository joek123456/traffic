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
            <div class="container" style="background: rgba(255,255,255,0.7);height: 100%">
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
                    </tr>
                    <c:forEach items="${noticeList}" var="notice">

                        <tr>
                            <td colspan="2"><a href="${pageContext.request.contextPath}/notice/showDetail/${notice.id}">${notice.title}</a></td>
                            <td colspan="2" class="text-right">${notice.date}</td>
                        </tr>

                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>



</body>
</html>
