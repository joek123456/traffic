<%--
  Created by IntelliJ IDEA.
  User: 32113
  Date: 2023/2/22
  Time: 21:09:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html style="height: 100%;">
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
    <style>
        #inp1,#inp2{
            width: 76%;
        }
    </style>
</head>
<body style="height: 100%;">

<div style="height: 100%; margin: 0;background: url('${pageContext.request.contextPath}/images/index-bg.jpg');background-size: cover;">
    <div class="row" style=" background: rgba(255,255,255,0.8);height: 10%; padding: 20px 0;margin: 0">
        <jsp:include page="top.jsp"></jsp:include>

    </div>
    <div class="row" style="height: 90%;margin: 0">
        <div class="col-md-2" style="height: 100%; background: rgba(255,255,255,0.8); padding: 0;">
            <jsp:include page="menu.jsp"></jsp:include>
        </div>
        <div class="col-md-10" style="height: 100%;padding: 0;background: rgba(255,255,255,1);overflow-y: scroll">
            <div class="row" style="padding: 10px 0; margin: 0;height: 10%;">
                <div class="col-md-4">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">起始位置：</span>
                        </div>
                        <input type="text" list="select1" id="inp1" class="form-control col-md-9"
                               oninput="search(document.getElementById('inp1'))" />
                    </div>
                    <div style="width: 100%;">
                        <datalist name="aaa" id="select1" style="width: 100%;">

                        </datalist>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">终点位置：</span>
                        </div>
                        <input type="text" list="select2" id="inp2" class="form-control"
                               oninput="search(document.getElementById('inp2'))" />
                    </div>
                    <div style="width: 100%;">
                        <datalist name="aaa" id="select2" style="width: 100%;">

                        </datalist>
                    </div>
                </div>
                <div class="col-md-2">
                    <button id="btn" class="btn btn-primary">导航</button>
                </div>
            </div>
            <div class="row" style="margin: 0;height: 90%;">
                <div id="q123" style="height: 100%; background: rebeccapurple;" class="col-md-9"></div>
                <div class="col-md-3">
                    <%--<div style="height: 100px;"></div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <strong>总路程：</strong>
                            <span id="distance"></span>
                        </li>
                        <li class="list-group-item">
                            <strong>总时间：</strong>
                            <span id="time"></span>
                        </li>
                    </ul>--%>
                </div>
            </div>
        </div>
    </div>
</div>



<script src="https://api.map.baidu.com/api?v=3.0&ak=yUrzqWAOrRpuQxoUpUp4V4CAAzdaRDa8"></script>
<!-- <script src="js/baiduAPI.js"></script> -->
<script>
    var aaaa = "";
    var map = new BMap.Map("q123");
    var point = new BMap.Point(116.404, 39.915);
    map.centerAndZoom(point, 15)
    map.enableScrollWheelZoom(true);
    map.addControl(new BMap.ScaleControl());
    var traffic = new BMap.TrafficLayer(); // 创建交通流量图层实例
    map.addTileLayer(traffic); // 将图层添加到地图上

    //  浏览器定位
    var geolocation = new BMap.Geolocation();
    geolocation.getCurrentPosition(function(r) {
        console.log(r.address)
        if (this.getStatus() == BMAP_STATUS_SUCCESS) {
            var mk = new BMap.Marker(r.point);
            map.addOverlay(mk);
            map.panTo(r.point);
        }
    });


    // 添加定位控件
    var geolocationControl = new BMap.GeolocationControl({
        anchor: BMAP_ANCHOR_BOTTOM_RIGHT,
    })
    map.addControl(geolocationControl);
    geolocationControl.addEventListener("locationSuccess", function(e) {
        console.log(e)
    })



    function search(obj) {
        console.log(obj.value)
        var options = {
            onSearchComplete: function(results) {
                if (local.getStatus() == BMAP_STATUS_SUCCESS) {
                    console.log(results)
                    var sel_options = "";
                    for (var i = 0; i < results
                        .getCurrentNumPois(); i++) { //[results.getPoi(i).point.lng,results.getPoi(i).point.lat]
                        // sel_options += "<option value='"+ results.getPoi(i).title+","+ results.getPoi(i).address +"'>"+ [results.getPoi(i).point.lng , results.getPoi(i).point.lat] +"</option>"
                        sel_options += "<option >" + results.getPoi(i).title + "," + results.getPoi(i).address +
                            "</option>"
                        // sel_options += "<option value='"+ [results.getPoi(i).point.lng,results.getPoi(i).point.lat] +"'>"

                    }
                    obj.parentNode.nextElementSibling.children[0].innerHTML = sel_options;

                }
            }
        };
        var local = new BMap.LocalSearch(map, options);
        local.search(obj.value);
    }



    var driving = new BMap.DrivingRoute(map, {
        renderOptions: {
            map: map,
            autoViewport: true
        },
        onPolylinesSet: function(routes) {
            //设置线条样式，线路分为几段
            for (var i = 0; i < routes.length; i++) {
                routes[i].getPolyline().setStrokeWeight(8);
                routes[i].getPolyline().setStrokeOpacity(1);
                routes[i].getPolyline().setStrokeColor("#5298ff");
            }
        },
        onSearchComplete: function(results) {
            var plan = results.getPlan(0);
            console.log(plan)
            // 获取方案的驾车线路
            if (plan) {
                var ss = [];
                // 获取线路上所有关键坐标点
                for (var i = 0; i < plan.getNumRoutes(); i++) {
                    var route = plan.getRoute(i);
                    ss = ss.concat(route.getPath());
                }
                var dis = plan.getDistance(false); //获取总公里数
                var t = plan.getDuration(false); ///获取总耗时
                console.log(dis,t)
                // $("#sugMileage").val((dis / 1000).toFixed(2)); //需要传给后台，保存到表单元素
                // $("#sugTime").val((t / 3600).toFixed(2));
                // $("#sugLngAndLat").val(JSON.stringify(ss)); //线路上所有点集合转成json存储
            }
        },
    });
    // 点击导航按钮
    document.getElementById("btn").onclick = function() {
        var start = document.getElementById("inp1").value;
        var end = document.getElementById("inp2").value;
        console.log(start, end)

        var startPoint = 0,
            endPoint = 0;
        var myGeo = new BMap.Geocoder();
        // 将地址解析结果显示在地图上，并调整地图视野
        myGeo.getPoint(start, function(point) {
            if (point) {
                //在方法中给变量赋值
                startPoint = point;
                map.centerAndZoom(point, 16);
                map.addOverlay(new BMap.Marker(point));
            }
        }, map);

        myGeo.getPoint(end, function(point) {
            if (point) {
                // jingwei = [point.lng, point.lat];
                //在方法中给变量赋值
                endPoint = point;
                map.centerAndZoom(point, 16);
                map.addOverlay(new BMap.Marker(point));
            }
        }, map);

        abc()

        function abc() {
            if (startPoint != 0 && endPoint != 0) {
                console.log(startPoint, endPoint);
                map.removeOverlay(driving)

                driving.search(startPoint, endPoint);
                return null;
            } else {
                // console.log(jingwei)
                console.log("xunhuan")
                setTimeout(abc, 100)
            }
        }
        console.log("循环体")
    }
</script>
</body>
</html>
