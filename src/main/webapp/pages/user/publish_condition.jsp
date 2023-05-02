<%--
  Created by IntelliJ IDEA.
  User: 32113
  Date: 2023/2/23
  Time: 21:53:06
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
    <style>
        tr>td:nth-child(1){
            width: 10%;
        }
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
            <div class="container">
                <table class="table" style="background: rgba(255,255,255,0.7);border-radius: 30px;">
                    <form action="${pageContext.request.contextPath}/condition/publish" method="post"
                          >
                        <tr style="opacity: 0">
                            <td>用户编号：</td>
                            <td>
                                <%
                                    String uid = request.getParameter("id");
                                %>
                                <input type="text" class="form-control" name="uid" value="${nowUser.id}" />
                            </td>
                        </tr>
                        <tr>
                            <td>所在城市：</td>
                            <td>
                                <input type="text" class="form-control" name="city"/>
                            </td>
                        </tr>
                        <tr>
                            <td>详细地址：</td>
                            <td>
                                <input type="text" class="form-control" name="address"/>
                            </td>
                        </tr>
                        <tr>
                            <td>拥堵情况：</td>
                            <td>
                                <select class="form-control" name="status">
                                    <option value="">---选择道路情况---</option>
                                    <option value="1">畅通</option>
                                    <option value="2">基本畅通</option>
                                    <option value="3">轻度拥堵</option>
                                    <option value="4">中度拥堵</option>
                                    <option value="5">严重拥堵</option>
                                </select>
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
        </div>
    </div>
</div>


</body>
</html>
