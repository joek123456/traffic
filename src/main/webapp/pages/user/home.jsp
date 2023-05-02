<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 32113
  Date: 2023/3/28
  Time: 16:41:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/echarts.js"></script>
    <style>
        body{
            margin: 0;
            padding: 0;
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
        <div  id="child"  class="col-md-10" style="height: 100%;padding: 0;overflow-y: scroll">
            <div class="row text-center" style="width: 100%;padding: 0;margin: 0">
                <div class="col-md-12" style="height: 100px;background: linear-gradient( 135deg, #81FFEF 10%, #F067B4 100%);" id="main"></div>
            </div>
            <div class="row" style="margin: 0;padding: 0;height: 50%;overflow: hidden">
                <div class="col-md-6" style="overflow: hidden;padding: 0;margin: 0">
                    <video src="${pageContext.request.contextPath}/video/video1.mp4" loop autoplay muted width="100%"></video>
                </div>
                <div class="col-md-6" style="overflow: hidden;padding: 0;margin: 0">
                    <video src="${pageContext.request.contextPath}/video/video.mp4" loop autoplay muted width="100%"></video>
                </div>
            </div>
            <div class="container">
                <table class="table table-hover table-striped" style="background: rgba(255,255,255,0.7)">
                    <tr>
                        <th>公告：</th>
                        <th class="text-right"><a href="${pageContext.request.contextPath}/notice/findAllByUser">全部公告>></a></th>
                    </tr>
                    <c:forEach items="${noticeList}" var="notice">
                        <tr>
                            <td><a href="${pageContext.request.contextPath}/notice/showDetail/${notice.id}">${notice.title}</a></td>
                            <td class="text-right">${notice.date}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>







<script>
    var myChart = echarts.init(document.getElementById('main'));
    var option = {
        graphic: {
            elements: [
                {
                    type: 'text',
                    left: 'center',
                    top: 'center',
                    style: {
                        text: '欢迎使用智慧交通系统',
                        fontSize: 50,
                        fontWeight: 'bold',
                        lineDash: [0, 200],
                        lineDashOffset: 0,
                        fill: 'transparent',
                        stroke: '#000',
                        lineWidth: 1
                    },
                    keyframeAnimation: {
                        duration: 3000,
                        loop: true,
                        keyframes: [
                            {
                                percent: 0.7,
                                style: {
                                    fill: 'transparent',
                                    lineDashOffset: 200,
                                    lineDash: [200, 0]
                                }
                            },
                            {
                                // Stop for a while.
                                percent: 0.8,
                                style: {
                                    fill: 'transparent'
                                }
                            },
                            {
                                percent: 1,
                                style: {
                                    fill: 'black'
                                }
                            }
                        ]
                    }
                }
            ]
        }
    };
    myChart.setOption(option);

</script>


</body>
</html>
