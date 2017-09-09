<%--
  Created by IntelliJ IDEA.
  User: colin
  Date: 2017/8/23
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
  <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

  <title>首页</title>
  <script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>

  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'/>
  <meta name="viewport" content="width=device-width"/>


  <!-- Bootstrap core CSS     -->
  <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>

  <!-- Animation library for notifications   -->
  <link href="assets/css/animate.min.css" rel="stylesheet"/>

  <!--  Paper Dashboard core CSS    -->
  <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>

  <!--  CSS for Demo Purpose, don't include it in your project     -->
  <link href="assets/css/demo.css" rel="stylesheet"/>


  <!--  Fonts and icons     -->
  <link href="assets/css/font-awesome.min.css" rel="stylesheet">
  <link href="assets/css/themify-icons.css" rel="stylesheet">

</head>
<body>

<div class="wrapper">
  <div class="sidebar" data-background-color="white" data-active-color="danger">

    <!--
        Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
        Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
    -->

    <div class="sidebar-wrapper">
      <div class="logo">
        <a href="index.jsp" class="simple-text">
          数据统计系统
        </a>
      </div>

      <ul class="nav">
        <li class="active">
          <a href="index.jsp">
            <i class="ti-home"></i>
            <p>首页</p>
          </a>
        </li>


        <li>
          <a href="users.jsp">
            <i class="ti-user"></i>
            <p>用户管理</p>
          </a>
        </li>
        <li>
          <a href="/OA/model/selectModel.do">
            <i class="ti-view-list-alt"></i>
            <p>模板管理</p>
          </a>
        </li>
        <li>
          <a href="/OA/model/selectStat.do">
            <i class="ti-panel"></i>
            <p>统计管理</p>
          </a>
        </li>

        <li>
          <a href="userdata.jsp">
            <i class="ti-id-badge"></i>
            <p>个人资料</p>
          </a>
        </li>
        <li>
          <a href="/OA/model/selectInstat.do">
            <i class="ti-bar-chart"></i>
            <p>参与统计</p>
          </a>
        </li>
        <li>
          <a href="notice.jsp">
            <i class="ti-bell"></i>
            <p>所有提醒</p>
          </a>
        </li>
        <li class="active-pro">
          <a href="#">
            <i class="ti-export"></i>
            <p>升级至PRO</p>
          </a>
        </li>
      </ul>
    </div>
  </div>

  <div class="main-panel">
    <nav class="navbar navbar-default">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar bar1"></span>
            <span class="icon-bar bar2"></span>
            <span class="icon-bar bar3"></span>
          </button>
          <a class="navbar-brand" href="#">Home</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <i class="ti-bell"></i>
                <p class="notification">3</p>
                <p>条提醒</p>
                <b class="caret"></b>
              </a>
              <ul class="dropdown-menu">
                <li><a href="#">消息 1</a></li>
                <li><a href="#">消息 2</a></li>
                <li><a href="#">消息 3</a></li>
              </ul>
            </li>
            <li>
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <i class="ti-panel"></i>
                <p>${user.userName}</p>
                <b class="caret"></b>
              </a>
              <ul class="dropdown-menu">
                <li><a href="userdata.jsp">个人信息</a></li>
                <li><a href="#">退出</a></li>
              </ul>
            </li>
          </ul>

        </div>
      </div>
    </nav>


    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-3 col-sm-6">
            <div class="card">
              <div class="content">
                <div class="row">
                  <div class="col-xs-5">
                    <div class="icon-big icon-warning text-center">
                      <i class="ti-server"></i>
                    </div>
                  </div>
                  <div class="col-xs-7">
                    <div class="numbers">
                      <p>统计</p>
                      75%
                    </div>
                  </div>
                </div>
                <div class="footer">
                  <hr/>
                  <div class="stats">
                    <i class="ti-reload"></i> 模板使用率
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-sm-6">
            <div class="card">
              <div class="content">
                <div class="row">
                  <div class="col-xs-5">
                    <div class="icon-big icon-success text-center">
                      <i class="ti-wallet"></i>
                    </div>
                  </div>
                  <div class="col-xs-7">
                    <div class="numbers">
                      <p>最近发布</p>
                      12
                    </div>
                  </div>
                </div>
                <div class="footer">
                  <hr/>
                  <div class="stats">
                    <i class="ti-calendar"></i> 最近统计
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-sm-6">
            <div class="card">
              <div class="content">
                <div class="row">
                  <div class="col-xs-5">
                    <div class="icon-big icon-danger text-center">
                      <i class="ti-pulse"></i>
                    </div>
                  </div>
                  <div class="col-xs-7">
                    <div class="numbers">
                      <p>返回统计</p>
                      23
                    </div>
                  </div>
                </div>
                <div class="footer">
                  <hr/>
                  <div class="stats">
                    <i class="ti-timer"></i> 近一小时内得到统计数目
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-sm-6">
            <div class="card">
              <div class="content">
                <div class="row">
                  <div class="col-xs-5">
                    <div class="icon-big icon-info text-center">
                      <i class="ti-twitter-alt"></i>
                    </div>
                  </div>
                  <div class="col-xs-7">
                    <div class="numbers">
                      <p>未完成</p>
                      15%
                    </div>
                  </div>
                </div>
                <div class="footer">
                  <hr/>
                  <div class="stats">
                    <i class="ti-reload"></i> 最新统计完成率
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">

          <div class="col-md-12">
            <div class="card">
              <div class="header">
                <h4 class="title">用户填表统计</h4>
                <p class="category">24 小时内</p>
              </div>
              <div class="content">
                <div id="chartHours" class="ct-chart"></div>
                <div class="footer">
                  <div class="chart-legend">
                    <i class="fa fa-circle text-info"></i> 部门员工
                    <i class="fa fa-circle text-danger"></i> 领导办公室
                    <i class="fa fa-circle text-warning"></i> 部门经理
                  </div>
                  <hr>
                  <div class="stats">
                    <i class="ti-reload"></i> 3分钟前更新
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="card">
              <div class="header">
                <h4 class="title">统计情况</h4>
                <p class="category">当前最新统计的统计结果</p>
              </div>
              <div class="content">
                <div id="chartPreferences" class="ct-chart ct-perfect-fourth">

                </div>

                <div class="footer">
                  <div class="chart-legend">
                    <i class="fa fa-circle text-info"></i> 部门员工
                    <i class="fa fa-circle text-danger"></i> 领导办公室
                    <i class="fa fa-circle text-warning"></i> 部门经理
                  </div>
                  <hr>
                  <div class="stats">
                    <i class="ti-timer"></i> 48小时内统计结果
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="card ">
              <div class="header">
                <h4 class="title">8月统计情况</h4>
                <p class="category">8月份所有的统计详情</p>
              </div>
              <div class="content">
                <div id="chartActivity" class="ct-chart"></div>

                <div class="footer">
                  <div class="chart-legend">
                    <i class="fa fa-circle text-info"></i> 模板使用
                    <i class="fa fa-circle text-warning"></i> 统计使用
                  </div>
                  <hr>
                  <div class="stats">
                    <i class="ti-check"></i> 月度统计
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


    <footer class="footer">
      <div class="container-fluid">
        <nav class="pull-left">
          <ul>

            <li>
              <a href="#">
                Creative Tim
              </a>
            </li>
            <li>
              <a href="">
                Blog
              </a>
            </li>
            <li>
              <a href="#/license">
                Licenses
              </a>
            </li>
          </ul>
        </nav>
        <div class="copyright pull-right">
          Copyright &copy; 2017.Company name All rights reserved.
        </div>
      </div>
    </footer>

  </div>
</div>


</body>

<!--   Core JS Files   -->
<script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="assets/js/bootstrap-checkbox-radio.js"></script>

<!--  Charts Plugin -->
<script src="assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<!---<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>--->

<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script src="assets/js/paper-dashboard.js"></script>

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<script src="assets/js/demo.js"></script>

<script type="text/javascript">
    $(document).ready(function () {

        demo.initChartist();

        $.notify({
            icon: 'ti-gift',
            message: "欢迎来到<b> 综合数据评分系统</b>，您的所有提醒将显示在此."

        }, {
            type: 'success',
            timer: 4000
        });

    });
</script>

</html>
