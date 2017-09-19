<%--
  Created by IntelliJ IDEA.
  User: 39805
  Date: 2017/8/29
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="../assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

    <title></title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'/>
    <meta name="viewport" content="width=device-width"/>


    <!-- Bootstrap core CSS     -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- Animation library for notifications   -->
    <link href="../assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="../assets/css/paper-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="../assets/css/demo.css" rel="stylesheet"/>

    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="../assets/css/themify-icons.css" rel="stylesheet">
    <link href="../assets/css/model.css" rel="stylesheet">


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
                <a href="../index.jsp" class="simple-text">
                    数据统计系统
                </a>
            </div>

            <ul class="nav">
                <li>
                    <a href="../index.jsp">
                        <i class="ti-home"></i>
                        <p>首页</p>
                    </a>
                </li>
                <%--当权限为0时显示这些模块，否则不显示--%>
                <c:if test="${user.role =='0'}">
                    <li >
                        <a href="../users.jsp">
                            <i class="ti-user"></i>
                            <p>用户管理</p>
                        </a>
                    </li>
                    <li >
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
                </c:if>
                <li>
                    <a href="../userdata.jsp">
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
                    <a href="../notice.jsp">
                        <i class="ti-bell"></i>
                        <p>所有提醒</p>
                    </a>
                </li>
                <li class="active-pro">
                    <a href="#">
                        <i class="ti-export"></i>
                        <p>联系我们</p>
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
                    <a class="navbar-brand" href="#">统计管理</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <%--<li class="dropdown">
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
                        </li>--%>
                        <li>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="ti-panel"></i>
                                <p>${user.userName}</p>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="userdata.jsp">个人信息</a></li>
                                <li><a href="../login.html">退出</a></li>
                            </ul>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>


        <div class="content">
            <div class="container-fluid">
                <div class="row">

                    <div class="col-md-12">
                        <div class="card card-plain">
                            <div class="header">
                                <a onclick="getExcel('stat_table')" id="table_2"><h4>————导出</h4></a>
                                <%--<p class="category">${message}</p>--%>
                            </div>
                            <div class="content table-responsive table-full-width"
                                 style="position:absolute; height:400px;width: 1000px; overflow:auto">

                                <table class="table table-hover" border="1" cellspacing="0" id="stat_table">
                                    <thead>
                                    <tr>
                                        <th colspan="${length}" style="text-align:center">${model.modelName}</th>
                                    </tr>

                                    </thead>
                                    <%-- <form action="statModel.do?modelId=${model.modelId}" method="post" id="sys_stat">--%>
                                        <tbody>
                                            <tr align="center">
                                                <td></td>
                                                <c:forEach items="${cus}" var="temp" varStatus="t">
                                                    <td colspan="${temp.num}">${temp.name}</td>
                                                </c:forEach>
                                            </tr>
                                        <tr align="center">
                                            <td></td>
                                            <c:forEach items="${model.list}" var="temp" varStatus="t">
                                                <td>${temp.columnName}</td>
                                            </c:forEach>
                                        </tr>
                                            <c:forEach items="${users}" var="temp" varStatus="t">
                                            <tr align="center">
                                                <td>${temp.userName}</td>
                                                <c:forEach items="${temp.sc}" var="temps" varStatus="t">
                                                    <td>${temps.count}</td>
                                                </c:forEach>

                                                <c:if test="${fn:length(temp.sc)==0}">
                                                    <c:forEach items="${model.list}" var="temp" varStatus="t">
                                                        <td></td>
                                                    </c:forEach>

                                                </c:if>
                                            </tr>
                                        </c:forEach>
                                </table>

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
                                Creative Team
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
                        <%--<li>富强、民主、文明、和谐、自由、平等、公正、法治、爱国、敬业、诚信、友善</li>--%>
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
<script src="../assets/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="../assets/js/bootstrap-checkbox-radio.js"></script>

<!--  Charts Plugin -->
<script src="../assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="../assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<!---<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>--->

<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script src="../assets/js/paper-dashboard.js"></script>

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<script src="../assets/js/demo.js"></script>
<script src="../assets/js/model.js"></script>

</html>
