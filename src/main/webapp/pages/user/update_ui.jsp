<%--
  Created by IntelliJ IDEA.
  User: 32113
  Date: 2023/2/23
  Time: 10:09:04
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<%--            <div style="height: 100%;width: 100%;">--%>
                <div class="container" style="padding-top: 20px;">
                    <form action="${pageContext.request.contextPath}/user/update" method="post"
                          onsubmit="return registerCheck()" role="form"
                          style="background: rgba(255,255,255,0.7); padding-top: 30px;border-radius: 30px;background: rgba(255,255,255,0.7);">
                        <table class="table">
                            <tr style="display: none">
                                <td>
                                    用户id
                                </td>
                                <td>
                                    <input type="text" name="id" value="${user.id}" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    用户名
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="name" placeholder="登录使用的账号"
                                           value="${user.name}" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    真实姓名
                                </td>
                                <td>
                                    <input type="text" value="${user.trueName}" class="form-control" name="trueName"
                                           placeholder="此选项用于账号的找回">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    性别
                                </td>
                                <td>
                                    <div class="row">
                                        <c:choose>
                                            <c:when test="${user.gender==0}">
                                                <label class="radio-inline col-md-4">
                                                    <input type="radio" name="gender" value="0" checked>男
                                                </label>
                                                <label class="radio-inline col-md-4">
                                                    <input type="radio" name="gender" value="1">女
                                                </label>
                                                <label class="radio-inline col-md-4">
                                                    <input type="radio" name="gender" value="2">保密
                                                </label>
                                            </c:when>
                                            <c:when test="${user.gender==1}">
                                                <label class="radio-inline col-md-4">
                                                    <input type="radio" name="gender" value="0">男
                                                </label>
                                                <label class="radio-inline col-md-4">
                                                    <input type="radio" name="gender" value="1" checked>女
                                                </label>
                                                <label class="radio-inline col-md-4">
                                                    <input type="radio" name="gender" value="2">保密
                                                </label>
                                            </c:when>
                                            <c:when test="${user.gender==2}">
                                                <label class="radio-inline col-md-4">
                                                    <input type="radio" name="gender" value="0">男
                                                </label>
                                                <label class="radio-inline col-md-4">
                                                    <input type="radio" name="gender" value="1">女
                                                </label>
                                                <label class="radio-inline col-md-4">
                                                    <input type="radio" name="gender" value="2" checked>保密
                                                </label>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    邮箱
                                </td>
                                <td>
                                    <input type="email" value="${user.email}" class="form-control" name="email">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    联系电话
                                </td>
                                <td>
                                    <input type="phone" value="${user.phoneNumber}" class="form-control"
                                           name="phoneNumber">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    注册时间
                                </td>
                                <td>
                                    <input type="text" value="${user.registerDate}&nbsp;${user.registerTime}"
                                           name="registerDate" readonly class="form-control">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    近期修改
                                </td>
                                <td>
                                    <input type="text" value="${user.updateDate}" name="updateDate" readonly
                                           class="form-control" placeholder="暂无修改记录">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="text-center">
                                    <button type="submit" class="btn btn-success col-md-3" style="width: 30%;">确定修改
                                    </button>
                                </td>
                            </tr>
                        </table>
                    </form>
<%--                </div>--%>
            </div>
        </div>
    </div>
</div>


<script>

    function registerCheck() {
        var uname = document.getElementsByName('name')[0];
        if (uname.value == "") {
            alert("用户名不能为空！")
            uname.focus();
            return false;
        }

        var trueName = document.getElementsByName('trueName')[0];
        if (trueName.value == "") {
            alert("真实姓名不能为空！")
            trueName.focus();
            return false;
        }
        return confirm("你的信息将发生变更！");
    }
</script>
</body>
</html>
