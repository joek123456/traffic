<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>欢迎使用交通系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <style>
        .top{
            padding: 20px;
            width: 50%;
            margin: 80px auto ;
            background: rgba(255, 255, 255, 0.7);
            border-radius: 30px;
        }
    </style>
</head>
<body style="background: url(${pageContext.request.contextPath}/images/index-bg.jpg); background-size: cover;">
<div class="container">
    哈哈
</div>


<div class="top">
    <h2 class="text-center" style="color: black;">欢迎使用智慧交通系统</h2>
    <div class="">
        <form method="post" action="${pageContext.request.contextPath}/user/login" onsubmit="return checkForm()" id="LoginForm" class="form-horizontal" style="margin-top: 50px; " >
            <div class="text-center" style="height: 40px; color: red"><b>${msg}</b></div>


            <div class="form-group row">
                <label   class="control-label col-md-3 text-right" >用户名</label>
                <div class="col-md-6">
                    <input  type="text" class="form-control" placeholder="请输入用户名" name="name" value="${name}">
                </div>
            </div>
            <div class="form-group row">
                <label   class="control-label col-md-3 text-right" >密码</label>
                <div class="col-md-6">
                    <input  type="password" class="form-control" placeholder="请输入密码" name="password">
                </div>
            </div>
            <div class="form-group row">
                <label   class="control-label col-md-3 text-right" >验证码</label>
                <div class="col-md-6 row">
                    <div class="col-md-7">
                        <input  type="number" class="form-control" placeholder="请输入验证码" name="checkNum">
                    </div>
                    <div class="col-md-5" id="loginCheck"></div>
                </div>
            </div>
            <div class="form-group row">
                <label   class="control-label col-md-3 text-right" >登录身份</label>
                <div class="col-md-6">
                    <label class="radio-inline">
                        <input type="radio" name="identity" value="0" checked>会员用户
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="identity" value="1">管理员
                    </label>

                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-2"></div>
                <button type="submit" class="btn btn-success col-md-3" >确认登录</button>
                <div class="col-md-2"></div>
                <a href="${pageContext.request.contextPath}/pages/user/userRegister.jsp" class="btn btn-light col-md-3">用户注册</a>
            </div>
        </form>
    </div>
</div>




</body>
<script>
    var res = 0;
    (function(){
        var num1 = Math.floor(Math.random()*10+1);
        var num2 = Math.floor(Math.random()*10+1);
        var behaviorNum = Math.floor(Math.random()*3);
        var behavior = [' + ',' - ',' × '];
        var strCheck = num1+behavior[behaviorNum]+num2;
        switch(behaviorNum){
            case 0:
                res = num1+num2;
                break
            case 1:
                res = num1-num2;
                break
            case 2:
                res = num1*num2;
                break
        }
        console.log(res)
        document.getElementById('loginCheck').innerHTML = '<h3>'+strCheck+'</h3>';

    })()
    function checkForm(){
        var flag = false;
        var name = document.getElementsByName('name')[0].value;
        var pwd = document.getElementsByName('password')[0].value;
        var checkNum = document.getElementsByName('checkNum')[0].value;
        if(!name){
            alert("用户名不能为空");
            return flag;
        }
        if(!pwd){
            alert("密码不能为空");
            return flag;
        }
        if(!checkNum){
            alert("请输入验证码");
            return flag;
        }
        if(res != checkNum){
            alert("验证码输入错误！")
            return false;
        }

        var loginForm = document.getElementById("LoginForm");
        var identity = document.getElementsByName("identity");
        for(var i = 0; i<identity.length; i++){
            if(identity[i].checked){
                if (identity[i].value == 0){
                    loginForm.action = "${pageContext.request.contextPath}/user/login"
                }else{
                    loginForm.action = "${pageContext.request.contextPath}/admin/login"
                }
            }
        }


        flag = true;
        return flag;
    }
</script>
</html>