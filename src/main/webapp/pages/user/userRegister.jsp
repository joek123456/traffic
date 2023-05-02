<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <title>用户注册界面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script>
        // 定义判空的函数
        function isNull(obj) {
            // 去除空格之后与 "" 进行比较
            if (obj.value.trim() == "") {
                // 相等即为空  返回false
                alert(obj.attributes.tag.value + "不能为空！"); // 自定义一个 tag 属性
                obj.focus();
                return false;
            }
            // 不为空  返回true
            return true;
        }
        function registerCheck() {
            var objs = document.getElementsByTagName("input");	// 得到所有的 <input /> 控件
            for (let obj of objs) {	// 循环遍历
                if (!isNull(obj)) {	// 返回值为 false    表示是空  阻止表单提交
                    return false;
                }
            }
            var p1 = document.getElementsByName('password')[0];
            var p2 = document.getElementsByName('rePassword')[0];
            if (!(p1.value == p2.value)) {	// 判断两次输入的密码是否一直
                alert("两次密码不一致，请重新输入~");
                p2.focus();
                return false;	// 不一致返回false  阻止表单提交
            }
            var sex = document.getElementsByName('gender')[0];	//判断性别是否为空
            return isNull(sex);		// 因为是最后一项 其返回值可直接作为函数的返回值
        }
    </script>
</head>
<body style="background: url(${pageContext.request.contextPath}/images/register-bg.jpeg); background-size: cover;">
<div class="container" style="padding-top: 20px;">
    <h2 style="color: white;">欢迎使用智慧交通系统 <span class="small">（注册界面）</span></h2>
    <form action="${pageContext.request.contextPath}/user/register" method="post" onsubmit="return registerCheck()"
          role="form"
          style="width: 40%; margin-top: 50px; float: right; background: rgba(255,255,255,0.7); padding-top: 30px;border-radius: 30px;">
        <div style="height: 40px; color: red;text-align: center">
            <b>
                ${msg}
            </b>
        </div>
        <div class="form-group row">
            <label class="col-md-3 text-right">用户名</label>
            <input type="text" tag="用户名" class="col-md-8 form-control" name="name" placeholder="登录使用的账号">
        </div>
        <div class="form-group row">
            <label class="col-md-3 text-right">密码</label>
            <input type="password" tag="密码" class="col-md-8 form-control" name="password" placeholder="登录使用的密码">
        </div>
        <div class="form-group row">
            <label class="col-md-3 text-right">确认密码</label>
            <input type="password" tag="确认密码" class="col-md-8 form-control" name="rePassword" placeholder="确认你输入的密码">
        </div>
        <div class="form-group row">
            <label class="col-md-3 text-right">真实姓名</label>
            <input type="text" tag="真实姓名" class="col-md-8 form-control" name="trueName" placeholder="此选项用于账号的找回">
        </div>
        <div class="form-group row">
            <label class="col-md-3 text-right">性别</label>
            <select class="col-md-8 form-control form-control" tag="性别" name="gender">
                <option value="">选择性别</option>
                <option value="0">男</option>
                <option value="1">女</option>
                <option value="2">保密</option>
            </select>
        </div>
        <div class="form-group row">
            <label class="col-md-3 text-right">邮箱</label>
            <input type="email" tag="邮箱" class="col-md-8 form-control" name="email" placeholder="输入您的邮箱">
        </div>
        <div class="form-group row">
            <label class="col-md-3 text-right">联系电话</label>
            <input type="phone" tag="联系电话" class="col-md-8 form-control" name="phoneNumber" placeholder="输入您的手机号">
        </div>
        <div class="form-group text-center">
            <button type="submit" class="btn btn-success" style="width: 30%;">注册</button>
        </div>
    </form>
</div>
</body>
</html>