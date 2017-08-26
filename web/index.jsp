<%--
  Created by IntelliJ IDEA.
  User: colin
  Date: 2017/8/23
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/user/insertSelective.do" method="post">

    <input type="text" placeholder="user_id" name="userId"/>
    <input type="text" placeholder="account" name="account" />
    <input type="text" placeholder="user_name" name="userName"/>
    <input type="text" placeholder="password" name="password" />
    <input type="text" placeholder="dep" name="dep" />
    <input type="text" placeholder="role" name="role" />

    <input type="submit" name="添加用户" />



  </form>
  $END$
  </body>
</html>
