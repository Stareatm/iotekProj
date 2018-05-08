<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/20
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>register</title>
    <link rel="stylesheet" type="text/css" href="../../css/login.css">
    <link rel="stylesheet" type="text/css" href="../../css/register.css">
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script>
        $(function () {
            $("#uName").focus(function () {
                $(this).val("");
                $("#errorSpan").empty();
            });
            $("#uPass").focus(function () {
                $(this).val("");
            })
        })
    </script>
</head>
<body>
    <div class="content">
        <form action="userController/register" method="post">
            用户名:<input type="text" name="u_name" id="uName" value="请输入用户名" required="required" pattern="[a-zA-Z0-9]{6,18}" title="用户名必须是由大小写英文字母和数字组成且长度为6-18位"><br>
            密码:<input type="password" name="u_pass" id="uPass" value="请输入密码" required="required" pattern="[a-zA-Z]\w{5,17}" title="用户密码必须是由大小写英文字母开头,且是由大小写英文字母、数字和下划线组成,长度为6-18位"><br>
            <input type="submit" value="注册" id="submit">
        </form>
        <span id="errorSpan">${registerError}</span>
    </div>
</body>
</html>

