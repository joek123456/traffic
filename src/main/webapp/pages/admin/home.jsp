<%--
  Created by IntelliJ IDEA.
  User: 32113
  Date: 2023/2/24
  Time: 21:46:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>智慧交通管理系统(Admin)</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/echarts.js"></script>
    <style>
        /* Make the image fully responsive */
        .carousel-inner img {
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>

<div id="demo" class="carousel slide" data-ride="carousel">

    <!-- 指示符 -->
    <ul class="carousel-indicators">
        <li data-target="#demo" data-slide-to="0" class="active"></li>
        <li data-target="#demo" data-slide-to="1"></li>
        <li data-target="#demo" data-slide-to="2"></li>
    </ul>
    <!-- 轮播图片 -->
    <div class="carousel-inner" style="height: 300px">
        <div class="carousel-item active">
            <img src="${pageContext.request.contextPath}/images/lunbo-01.webp">
            <div class="carousel-caption">
                <h3>智能交通管理系统后台管理系统</h3>
                <p>欢迎管理员${admin.name}</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="${pageContext.request.contextPath}/images/lunbo-02.webp">
            <div class="carousel-caption">
                <h3>~用双手成就市民的出行方便~</h3>
                <p>祝：${admin.trueName}家人出行方便！</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="${pageContext.request.contextPath}/images/lunbo-03.webp">
            <div class="carousel-caption">
                <h3>市民就是我们的动力</h3>
                <p>恭喜${admin.trueName}成为系统的第${admin.id}位管理员</p>
            </div>
        </div>
    </div>
    <!-- 左右切换按钮 -->
    <a class="carousel-control-prev" href="#demo" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </a>
    <a class="carousel-control-next" href="#demo" data-slide="next">
        <span class="carousel-control-next-icon"></span>
    </a>
</div>
<div class="row" style="margin: 0;padding: 0">
    <%--<div class="row text-center" style="margin-top: 20px;">
        <div class="col-md-4">
            <p>用户数量</p>
            <h4>${userCount}</h4>
        </div>
        <div class="col-md-4">
            <p>管理员数量</p>
            <h4>${adminCount}</h4>
        </div>
        <div class="col-md-4">
            <p>路况信息总量</p>
            <h4>${rcCount}</h4>
        </div>
    </div>--%>

    <div class="col-md-6" id="bing" style="height: 300px"></div>
    <div class="col-md-6" id="zhu" style="height: 300px"></div>

</div>


<script>

    var bing = echarts.init(document.getElementById("bing"));
    var zhu = echarts.init(document.getElementById("zhu"));
    var option1 = {
        title: {
            text: '数据总览',
            left: 'center'
        },
        tooltip: {
            trigger: 'item'
        },
        series: [
            {
                name: '来自统计',
                type: 'pie',
                radius: '50%',
                data: [
                    { value: ${userCount}, name: '用户数量' },
                    { value: ${adminCount}, name: '管理员数量' },
                    { value: ${rcCount}, name: '路况信息总量' }
                ],
                emphasis: {
                    itemStyle: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };

    var option2 = {
        title: {
            text: '每日注册用户统计',
            left: 'center'
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: [
            {
                type: 'category',
                data: ${dateArr},
                axisTick: {
                    alignWithLabel: true
                }
            }
        ],
        yAxis: [
            {
                type: 'value'
            }
        ],
        series: [
            {
                name: '注册数量',
                type: 'bar',
                barWidth: '60%',
                data: ${countArr}
            }
        ]
    };


    bing.setOption(option1);
    zhu.setOption(option2);


</script>


</body>
</html>
