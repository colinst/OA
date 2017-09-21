<%--
  Created by IntelliJ IDEA.
  User: colin
  Date: 2017/9/3
  Time: 21:24
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

    <title>用户管理</title>

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
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/themify-icons.css" rel="stylesheet">
    <script type="text/javascript">

        //获得所有的用户
        var p;
        function getUsers() {
            $.ajax({
                url: 'user/selectall.do',
                type: 'post',
                //data: {dba_name:"pass"},
                dataType: 'json',
                success: function (data) {

                    p = data
                    drawTable(data);
                }
            });
        }

        //渲染table
        function drawTable(obj) {

            $("#context").children().remove()
            $.each(obj, function (ci, c) {

                if (c['role'] == 1) c['role'] = '用户'
                else if (c['role'] == 0) c['role'] = '管理员'
                $("#context").append("<tr><td>" + c['userId'] + "</td><td><p onclick='getUpinsert(" + ci + ")'>" + c['account'] + "</p></td><td>" + c['userName'] + "</td><td>" + c['dep'] + "</td><td>" + c['role'] + "</td><td>" + c['number'] + "</td><td><div class='btn-group-sm'><button type='button' class='btn btn-default' onclick='getUpinsert(" + ci + ")'><a href='#former'>修改</a></button><button type='button' class='btn btn-default' onclick='delUser(" + ci + ")'>删除</button></div></td></tr>");
            });
        }

        //获得分页list
        function getPage(op) {
            $("#context2").hide()

            //-1（上一页）     1（下一页）      0（首页）   2（末页）
            var number = 6//每页显示数量
            var a         //limit查询起始值
            var b         //查询个数

            $.ajax({
                url: 'user/getcount.do',
                type: 'post',
                dataType: 'json',
                success: function (rowsnumber) {//获得用户表所有的行数

                    var apage = parseInt(rowsnumber - 1) / parseInt(number) + 1               //页数为总行数除每页显示数量)）
                    apage = parseInt(apage)
                    $("#aPage").text(apage)                             //设置总页数
                    var cpage = Number($("#cPage").text())              //得到当前页数


                    if (op == 1) {

                        //下一页
                        if (cpage == apage || cpage == (apage - 1)) {

                            $("#aPage").text(apage)

                            if (cpage == (apage - 1)) $("#cPage").text(apage)
                            else                        $("#cPage").text(cpage)

                            cpage = apage - 1

                            a = number * cpage
                            b = rowsnumber - a
                        }
                        else {

                            $("#cPage").text(cpage + 1);
                            $("#aPage").text(apage)

                            a = number * cpage
                            b = number
                        }
                    }
                    else if (op == -1) {

                        //上一页
                        if (cpage == 1) {

                            $("#cPage").text(1);
                            $("#aPage").text(apage)

                            a = 0
                            if (rowsnumber < number) b = rowsnumber
                            else                  b = number
                        }
                        else {

                            $("#cPage").text(cpage - 1);
                            $("#aPage").text(apage)

                            a = number * (cpage - 2)
                            b = number
                        }
                    }
                    else if (op == 0) {

                        //首页
                        $("#cPage").text(1)
                        $("#aPage").text(apage)

                        a = 0
                        if (rowsnumber < number) b = rowsnumber
                        else                  b = number
                    }
                    else if (op == 2) {

                        //末页
                        $("#cPage").text(apage)
                        $("#aPage").text(apage)

                        a = number * (apage - 1)
                        b = rowsnumber - a
                    }

                    //取得范围内对象集合
                    $.ajax({
                        url: 'user/getusers.do',
                        type: 'post',
                        data: {start: a, limit: b},
                        dataType: 'json',
                        success: function (data) {

                            p = data
                            drawTable(data);
                        }
                    });
                }
            });


        }

        //修改传值
        function getUpinsert(o) {

            //修改传值
            $("#context2").show()

            if (o == -10) {

                $("#userId").val('0000')
                $("#account").val('')
                $("#userName").val('')
                $("#email").val('')
                $("#userNamee").text('')
                $("#dep").val('')
                $("#role").val(1)
                $("#number").val('')
                $("#passwordd").show()
                $("#password").val(123)

                $("#former").attr("action", "")
                $("#act").attr("onclick","addUser()")

                $("#act").text("增加")
            } else {

                $("#userId").val(p[o]['userId'])
                $("#account").val(p[o]['account'])
                $("#userName").val(p[o]['userName'])
                $("#email").val(p[o]['email'])
                $("#userNamee").text(p[o]['userName'])
                $("#dep").val(p[o]['dep'])
                if (p[o]['role'] == '用户') $("#role").val(1)
                if (p[o]['role'] == '管理员') $("#role").val(0)
                $("#number").val(p[o]['number'])
                $("#passwordd").hide()
                $("#password").val(null)

                $("#former").attr("action", "/OA/user/updateSelective.do")
                $("#act").text("更新")
                $("#act").attr("onclick","")
            }
        }

        //删除用户
        function delUser(o) {

            var userId = p[o]['userId']

            $.ajax({
                url: 'user/delete.do',
                type: 'post',
                data: {userId: userId},
                dataType: 'json',
                success: function (result) {

                    if (result == '1') {
                        alert("删除成功");
                        myfun()
                    }
                    else                alert("删除失败")
                }
            });

        }

        //新增用户
        function addUser() {

            $.ajax({
                url: 'user/insertSelective.do',
                type: 'post',
                data: $('#former').serialize(),
                dataType: 'json',
                success: function (result) {

                    if (result == '1') {
                        alert("添加用户成功");
                        myfun()
                    }
                    else                alert("添加用户失败，请检查输入内容")
                }
            });


        }

    </script>
    <!--工具栏js-->
    <script type="text/javascript">

        var idTmr;
        //得到浏览器类型
        function getExplorer() {
            var explorer = window.navigator.userAgent;
            //ie
            if (explorer.indexOf("MSIE") >= 0) {
                return 'ie';
            }
            //firefox
            else if (explorer.indexOf("Firefox") >= 0) {
                return 'Firefox';
            }
            //Chrome
            else if (explorer.indexOf("Chrome") >= 0) {
                return 'Chrome';
            }
            //Opera
            else if (explorer.indexOf("Opera") >= 0) {
                return 'Opera';
            }
            //Safari
            else if (explorer.indexOf("Safari") >= 0) {
                return 'Safari';
            }
        }

        //打印
        function getExcel(tableid) {
            if (getExplorer() == 'ie') {
                var curTbl = document.getElementById(tableid);
                var oXL = new ActiveXObject("Excel.Application");
                var oWB = oXL.Workbooks.Add();
                var xlsheet = oWB.Worksheets(1);
                var sel = document.body.createTextRange();
                sel.moveToElementText(curTbl);
                sel.select();
                sel.execCommand("Copy");
                xlsheet.Paste();
                oXL.Visible = true;

                try {
                    var fname = oXL.Application.GetSaveAsFilename("Excel.xls", "Excel Spreadsheets (*.xls), *.xls");
                } catch (e) {
                    print("Nested catch caught " + e);
                } finally {
                    oWB.SaveAs(fname);
                    oWB.Close(savechanges = false);
                    oXL.Quit();
                    oXL = null;
                    idTmr = window.setInterval("Cleanup();", 1);
                }

            }
            else {
                tableToExcel(tableid)
            }
        }

        function Cleanup() {
            window.clearInterval(idTmr);
            CollectGarbage();
        }
        var tableToExcel = (function () {
            var uri = 'data:application/vnd.ms-excel;base64,',
                template = '<html><head><meta charset="UTF-8"></head><body><table>{table}</table></body></html>',
                base64 = function (s) {
                    return window.btoa(unescape(encodeURIComponent(s)))
                },
                format = function (s, c) {
                    return s.replace(/{(\w+)}/g,
                        function (m, p) {
                            return c[p];
                        })
                }
            return function (table, name) {
                if (!table.nodeType) table = document.getElementById(table)
                var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
                window.location.href = uri + base64(format(template, ctx))
            }
        })()
    </script>

    <%--翻页区用的css--%>
    <style>
        .divcss5-right {
            width: 255px;
            border: 0px solid #F00;
            float: right
        }

        /* css注释：对divcss5-right设置float:right即可让对象靠右浮动 */
    </style>

    <!--加载后动作-->
    <script language="javascript">
        function myfun() {
            getPage(0)
        }
        // 用js实现在加载完成一个页面后自动执行一个方法
        /*用window.onload调用myfun()*/
        window.onload = myfun;//不要括号
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
                <a href="index.jsp" class="simple-text">
                    数据统计系统
                </a>
            </div>

            <ul class="nav">
                <li>
                    <a href="index.jsp">
                        <i class="ti-home"></i>
                        <p>首页</p>
                    </a>
                </li>

                <%--当权限为0时显示这些模块，否则不显示--%>
                <c:if test="${user.role =='0'}">
                    <li class="active">
                        <a href="users.jsp">
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
                    <a class="navbar-brand" href="#">用户管理</a>
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
                                <li><a href="login.html">退出</a></li>
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

                                <h4 class="title">用户综合管理</h4>
                                <p class="category">公司所有的用户将显示在此表中</p>

                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover" id="usertable">
                                    <div class="btn-group-sm ">
                                        <button type="button" class="btn btn-default" onclick="getUpinsert(-10)">
                                            <a href='#former'>新增</a>
                                        </button>
                                        <button type="button" class="btn btn-default" style="display: none">
                                            打印
                                        </button>
                                        <button type="button" class="btn btn-default" style="display: none">
                                            导入
                                        </button>
                                        <button type="button" class="btn btn-default" onclick="getExcel('usertable')">
                                            导出
                                        </button>
                                    </div>
                                    <thead>
                                    <th>ID</th>
                                    <th>账号</th>
                                    <th>姓名</th>
                                    <th>部门</th>
                                    <th>权限</th>
                                    <th>手机</th>
                                    <th>操作</th>
                                    </thead>
                                    <tbody id="context">

                                <%--<tr>
                                        <td></td>
                                        <td>Dakota Rice</td>
                                        <td>$36,738</td>
                                        <td>Niger</td>
                                        <td>Oud-Turnhout</td>
                                        <td>Oud-Turnhout</td>
                                        <td>
                                            <div class="btn-group-sm">
                                                <button type="button" class="btn btn-default">
                                                    修改
                                                </button>
                                                <button type="button" class="btn btn-default">
                                                    删除
                                                </button>
                                            </div>
                                        </td>
                                    </tr>--%>
                                    </tbody>
                                </table>
                                <div class="btn-group-sm divcss5-right">
                                    <button type="button" class="btn btn-default" onclick="getPage(0)">
                                        <span class="ti-control-skip-backward"/>
                                    </button>
                                    <button type="button" class="btn btn-default" onclick="getPage(-1)">
                                        <span class="ti-control-backward"/>
                                    </button>
                                    <button type="button" class="btn btn-default" onclick="getUsers()">
                                        <span id="cPage">1</span>/<span id="aPage">1</span>
                                    </button>
                                    <button type="button" class="btn btn-default" onclick="getPage(1)">
                                        <span class="ti-control-forward"/>
                                    </button>
                                    <button type="button" class="btn btn-default" onclick="getPage(2)">
                                        <span class="ti-control-skip-forward"/>
                                    </button>
                                </div>
                                <div class="row"></div>

                            </div>
                        </div>
                    </div>
                    <div id="context2" style="display: none;">
                        <div class="col-lg-4 col-md-5">
                            <div class="card card-user">
                                <div class="image">
                                    <img src="assets/img/background.jpg" alt="..."/>
                                </div>
                                <div class="content">
                                    <div class="author">
                                        <img class="avatar border-white" src="assets/img/faces/face-2.jpg" alt="..."/>
                                        <h4 class="title"><span id="userNamee">Chet Faker</span><br/>
                                            <a href="#">
                                                <small>@chetfaker</small>
                                            </a>
                                        </h4>
                                    </div>
                                    <p class="description text-center">
                                        "I like the way you work it <br>
                                        No diggity <br>
                                        I wanna bag it up"
                                    </p>
                                </div>
                                <hr>
                                <div class="text-center">
                                    <div class="row">
                                        <div class="col-md-3 col-md-offset-1">
                                            <h5>12<br/>
                                                <small>已参与</small>
                                            </h5>
                                        </div>
                                        <div class="col-md-4">
                                            <h5>2GB<br/>
                                                <small>已完成</small>
                                            </h5>
                                        </div>
                                        <div class="col-md-3">
                                            <h5>24,6$<br/>
                                                <small>进行中</small>
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
                                <div class="content">

                                    <form id="former" action="" method="post">
                                        <div class="row">

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>姓名</label>
                                                    <input id="userName" name="userName" type="text"
                                                           class="form-control border-input"
                                                           placeholder="userId" value="Creative Code Inc.">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>账号</label>
                                                    <input id="account" name="account" type="text"
                                                           class="form-control border-input"
                                                           placeholder="account" value="michael23">
                                                </div>
                                            </div>

                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">邮箱</label>
                                                    <input id="email" name="email" type="email"
                                                           class="form-control border-input"
                                                           placeholder="Email">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>权限</label>
                                                    <%--<input id="role" name="role" type="text"
                                                           class="form-control border-input"
                                                           placeholder="1(用户)0(管理)">--%>
                                                    <select id="role" class="form-control border-input">
                                                        <option value="1" <c:if test="${user.role =='1'}">selected</c:if> >用户</option>
                                                        <option value="0" <c:if test="${user.role =='0'}">selected</c:if> >管理员</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>部门</label>
                                                    <input id="dep" name="dep" type="text"
                                                           class="form-control border-input"
                                                           placeholder="dep">
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <label>手机</label>
                                                    <input id="number" name="number" type="text"
                                                           class="form-control border-input"
                                                           placeholder="number">
                                                </div>
                                                <div class="form-group" id="passwordd" style="display: none">
                                                    <label>密码</label>
                                                    <input id="password" name="password" type="text"
                                                           class="form-control border-input"
                                                           placeholder="userId">
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>标签</label>
                                                    <textarea id="groupId" name="groupId" rows="4"
                                                              class="form-control border-input"
                                                              placeholder="Here can be your description"
                                                              value="Mike"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="display: none">
                                            <div class="col-md-3" id="uid">
                                                <input id="userId" name="userId" type="text" class="/"
                                                       style="display: none"
                                                       placeholder="userId" value="0000">

                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <button type="submit" class="btn btn-info btn-fill btn-wd" id="act" >更新
                                            </button>
                                        </div>
                                        <div class="clearfix"></div>
                                    </form>
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


</html>

