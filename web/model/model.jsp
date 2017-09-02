<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: 39805
  Date: 2017/8/28
  Time: 23:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <style>
        .divcss5-right {
            width: 255px;
            border: 0px solid #F00;
            float: right
        }

        /* css注释：对divcss5-right设置float:right即可让对象靠右浮动 */
    </style>

    <script type="text/javascript">

        var i = 0

        function getColumn() {

            var columnname = $("#columnname").val()
            /*var content=document.getElementById(ci);
             body.innerHTML+=
             */
            $("#content1").append("<div class='col-md-4'><div class='form-group'><label id='list[" + i + "].columnName'>" + columnname + "</label><input name='list[" + i + "].columnName' type='text' class='form-control border-input' value='" + columnname + "'></div></div>")

            i += 1
        }

        function colspan() {

            var columns = ['及格.a', '及格.b', '不及格.a', '不及格.b', '满分.c']
            var rowslen = columns[0].length
            var rows = new Array()

            $("#head").append("<th>用户</th>")
            $("#head1").append("<th></th>")

            for (var i = 0; i < columns.length; i++) {

                columns[i] = columns[i].split(".")

                $("#head").append("<th>" + columns[i][1] + "</th>")
                $("#head1").append("<th>" + columns[i][0] + "</th>")
            }


            var arr = [];
            for (var i = 0; i < columns.length;) {
                var count = 0;
                for (var j = i; j < columns.length; j++) {
                    if (columns[i][0] === columns[j][0]) {
                        count++;
                    }
                }
                arr.push({
                    column: columns[i][0],
                    colspan: count
                })
                i += count;
            }


            $("#head1").children().remove()
            $("#head1").append("<th></th>")

            for (var i = 0; i < columns.length; i++) {

                $("#head1").append("<th colspan='" + arr[i]['colspan'] + "'>'" + arr[i]['column'] + "'</th>")
            }
//arr[i]['colspan']
//arr[i]['column']

            alert(arr[0]['column'] + arr[0]['colspan'])
            alert(arr[1]['column'] + arr[1]['colspan'])
            alert(arr[2]['column'] + arr[2]['colspan'])

            /*for (var k = 0; k < arr.length; k++) {
             console.log(arr[k])
             }*/


        }


        function showdetil() {
            $("#context2").show()
        }
        function hidedetil() {
            $("#context2").hide()
        }
    </script>

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
                <a href="#" class="simple-text">
                    数据统计系统
                </a>
            </div>

            <ul class="nav">
                <li>
                    <a href="../index.html">
                        <i class="ti-home"></i>
                        <p>首页</p>
                    </a>
                </li>
                <li>
                    <a href="../users.html">
                        <i class="ti-user"></i>
                        <p>用户管理</p>
                    </a>
                </li>
                <li class="active">
                    <a href="selectModel.do">
                        <i class="ti-view-list-alt"></i>
                        <p>模板管理</p>
                    </a>
                </li>
                <li>
                    <a href="selectStat.do">
                        <i class="ti-panel"></i>
                        <p>统计管理</p>
                    </a>
                </li>
                <li>
                    <a href="../userdata.html">
                        <i class="ti-id-badge"></i>
                        <p>个人资料</p>
                    </a>
                </li>
                <li>
                    <a href="selectInstat.do">
                        <i class="ti-bar-chart"></i>
                        <p>参与统计</p>
                    </a>
                </li>
                <li>
                    <a href="../notice.html">
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
                    <a class="navbar-brand" href="#">Model Manager</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="ti-panel"></i>
                                <p>管理员</p>
                            </a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="ti-bell"></i>
                                <p class="notification">3</p>
                                <p>条提醒</p>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Notification 1</a></li>
                                <li><a href="#">Notification 2</a></li>
                                <li><a href="#">Another notification</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">
                                <i class="ti-settings"></i>
                                <p>设置</p>
                            </a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>


        <div class="content">
            <div class="container-fluid">
                <div class="row">

                    <div class="col-md-12" id="custom">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">自定义表格</h4>
                                <p class="category">您可以自定义表格或者<a onclick="hide();hidedetil()">使用已有表格</a></p>
                            </div>

                            <div class="content table-responsive table-full-width">

                                <%--<table class="table table-striped">
                                    <thead>
                                    <th>表名字</th>
                                    <th>内容1</th>
                                    <th>内容2</th>
                                    <th>内容3</th>
                                    <th>内容4</th>
                                    <th>内容5</th>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><input type="text" class="form-control border-input"
                                                   placeholder="表名" value="" name="modelName"></td>
                                        <td><input type="text" class="form-control border-input"
                                                   placeholder="内容" value="" name="list[0].columnName"></td>
                                        <td><input type="text" class="form-control border-input"
                                                   placeholder="内容" value="" name="list[1].columnName"></td>
                                        <td><input type="text" class="form-control border-input"
                                                   placeholder="内容" value="" name="list[2].columnName"></td>
                                        <td><input type="text" class="form-control border-input"
                                                   placeholder="内容" value="" name="list[3].columnName"></td>
                                        <td><input type="text" class="form-control border-input"
                                                   placeholder="内容" value="" name="list[4].columnName"></td>

                                    </tr>

                                    </tbody>
                                </table>

                                <div class="content" id="content">
                                    <table class="table table-striped">
                                        <thead>
                                        <th>内容6</th>
                                        <th>内容7</th>
                                        <th>内容8</th>
                                        <th>内容9</th>
                                        <th>内容10</th>
                                        <th>内容11</th>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td><input type="text" class="form-control border-input"
                                                       placeholder="内容" value="" name="list[5].columnName"></td>
                                            <td><input type="text" class="form-control border-input"
                                                       placeholder="内容" value="" name="list[6].columnName"></td>
                                            <td><input type="text" class="form-control border-input"
                                                       placeholder="内容" value="" name="list[7].columnName"></td>
                                            <td><input type="text" class="form-control border-input"
                                                       placeholder="内容" value="" name="list[8].columnName"></td>
                                            <td><input type="text" class="form-control border-input"
                                                       placeholder="内容" value="" name="list[9].columnName"></td>
                                            <td><input type="text" class="form-control border-input"
                                                       placeholder="内容" value="" name="list[10].columnName"></td>

                                        </tr>

                                        </tbody>
                                    </table>


                                </div>
                                <div id="table_1">
                                    <h4><a class="use" href="#" name="submit"
                                           onclick="document.getElementById('use_table').submit();return false">使用</a>
                                        <span id="add"><a onclick="add()">增加内容</a></span></h4>
                                </div>--%>




                            </div>
                        </div>
                    </div>


                    <div class="col-md-12" id="model">
                        <div class="card card-plain">
                            <div class="header">
                                <h4 class="title">表格模板</h4>
                                <p class="category">您可以使用以下表格或者<a onclick="show();showdetil()">自定义表格</a>
                                <h3 id="message"><%--&nbsp;   &nbsp;   &nbsp;   &nbsp;--%>${message}</h3></p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
                                    <th>编号</th>
                                    <th>名称</th>
                                    <th>创建人员</th>
                                    <th>创建时间</th>
                                    <th>操作</th>
                                    </thead>
                                    <tbody>

                                    <c:forEach items="${page.pageMessage }" var="temp" varStatus="t">

                                        <tr>

                                            <td>${temp.modelId}</td>
                                            <td>${temp.modelName }</td>
                                            <td>${temp.createUserId }</td>
                                            <td>
                                                <fmt:formatDate value="${temp.createtime}" pattern="yyyy-MM-dd"/>
                                            </td>
                                            <td>
                                                <div class="btn-group-sm">
                                                    <button type="button" class="btn btn-default">
                                                        修改
                                                    </button>
                                                    <button type="button" class="btn btn-default">
                                                        <a href="useModel.do?modelId=${temp.modelId}&modelName=${temp.modelName}">使用</a>
                                                    </button>
                                                    <button type="button" class="btn btn-default">
                                                        删除
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>

                            </div>
                        </div>
                        <div class="page">
                            <form action="selectModel.do" method="post">
                                <div class="btn-group-sm divcss5-right">
                                    <button type="button" class="btn btn-default" onclick="pageTest(0)">
                                        <span class="ti-control-skip-backward"/>
                                    </button>
                                    <button type="button" class="btn btn-default"
                                            onclick="pageTest(${page.currentPage-1})">
                                        <span class="ti-control-backward"/>
                                    </button>
                                    <button type="button" class="btn btn-default" onclick="">
                                        <span id="cPage">${page.currentPage+1}</span>/<span
                                            id="aPage">${page.allPage}</span>
                                    </button>
                                    <button type="button" class="btn btn-default"
                                            onclick="pageTest(${page.currentPage+1})">
                                        <span class="ti-control-forward"/>
                                    </button>
                                    <button type="button" class="btn btn-default" onclick="">
                                        <span class="ti-control-skip-forward"/>
                                    </button>
                                </div>
                                <%--共<span>${page.allCount }</span>个表格
                                <input type="button" value="首页" onclick="pageTest(0)">
                                <input type="button" value="上一页" onclick="pageTest(${page.currentPage-1})">
                                <input type="button" value="下一页" onclick="pageTest(${page.currentPage+1})">
                                第<span>${page.currentPage+1}</span>页
                                共<span>${page.allPage}</span>页
                                <input type="text" class="page-input" name="jumpPage" size="4">
                                <input type="submit" class="page-btn" value="跳转">--%>
                            </form>
                        </div>
                    </div>
                    <form action="insertModel.do" method="post" id="use_table">
                        <div id="context2" style="display: none">

                            <div class="col-lg-4 col-md-5">
                                <div class="card card-user">
                                    <%--<div class="image">
                                        <img src=../assets/img/background.jpg" alt="..."/>
                                    </div>--%>
                                    <div class="content">

                                        <div class="row">
                                            <div class="col-md-7">
                                                <div class="form-group">
                                                    <label>模板名称</label>
                                                    <input name="modelName" type="text"
                                                           class="form-control border-input"
                                                           placeholder="groupname" value="添加名称">
                                                </div>
                                            </div>
                                            <%--<span class="ti-control-backward"/>--%>
                                            <div class="col-md-4">
                                                <div class="/">
                                                    <label>.</label>
                                                    <button type="submit" class="btn btn-info btn-default">提交模板</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label>添加分组</label>
                                                    <input id="groupname" name="userName" type="text"
                                                           class="form-control border-input"
                                                           placeholder="groupname" value="默认组名">
                                                </div>
                                            </div>
                                            <%--<span class="ti-control-backward"/>--%>
                                            <div class="col-md-3">
                                                <div class="/">
                                                    <label>.</label>
                                                    <button type="button" class="btn btn-default">添加</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label>添加单列</label>
                                                    <input id="columnname" name="userName" type="text"
                                                           class="form-control border-input"
                                                           placeholder="columnname" value="列名">
                                                </div>
                                            </div>
                                            <%--<span class="ti-control-backward"/>--%>
                                            <div class="col-md-3">
                                                <div class="/">
                                                    <label>.</label>
                                                    <button type="button" class="btn btn-default" onclick="getColumn()">
                                                        添加
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="text-center">
                                        <div class="row">
                                            <div class="col-md-3 col-md-offset-1" onclick="colspan()">
                                                <h5>12<br/>
                                                    <small>已参与</small>
                                                </h5>
                                            </div>
                                            <div class="col-md-4" onclick="$('#view').show()">
                                                <h5>2GB<br/>
                                                    <small>预览</small>
                                                </h5>
                                            </div>
                                            <div class="col-md-3" onclick="$('#view').hide()">
                                                <h5>24,6$<br/>
                                                    <small>关闭预览</small>
                                                </h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="col-lg-8 col-md-7">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">详细信息</h4>
                                    </div>
                                    <hr>
                                </div>
                                <div id="content1" class="content"></div>
                            </div>

                        </div>
                    </form>

                    <%--预览--%>
                    <div class="col-md-12" id="view" style="display: none">
                        <div class="card card-plain">
                            <div class="header">

                                <h4 class="title">模板预览</h4>
                                <p class="category">您自定义的模板表头将在这里展示</p>

                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover" id="usertable">
                                    <thead id="head4"></thead>
                                    <thead id="head3"></thead>
                                    <thead id="head2"></thead>
                                    <thead id="head1"></thead>
                                    <thead id="head"></thead>
                                    <tbody id="context">
                                    <tr>
                                        <td>用户1</td>
                                        <td>Dakota Rice</td>
                                        <td>$36,738</td>
                                        <td>Niger</td>
                                        <td>Oud-Turnhout</td>
                                        <td>Oud-Turnhout</td>
                                    </tr>
                                    <tr>
                                        <td>用户2</td>
                                        <td>Dakota Rice</td>
                                        <td>$36,738</td>
                                        <td>Niger</td>
                                        <td>Oud-Turnhout</td>
                                        <td>Oud-Turnhout</td>
                                    </tr>

                                    </tbody>
                                </table>
                                <div class="row"></div>

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
                            <a href="http://www.mycodes.net">
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
                    Copyright &copy; 2017.Company name All rights reserved.<a target="_blank"
                                                                              href="/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
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

