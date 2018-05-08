<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/20
  Time: 16:07
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
    <title>login</title>
    <link rel="stylesheet" type="text/css" href="../../css/login.css">
    <link rel="stylesheet" type="text/css" href="../../css/login1.css">
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script>
        $(function () {
            $(".name").focus(function () {
                $(this).val("");
                $("span").empty();
            });
            $(".pass").focus(function () {
                $(this).val("");
            });
           /* $("#account").focus(function () {
                $(this).val("");
                $("#errorSpan").empty();
            });
            $("#ePass").focus(function () {
                $(this).val("");
            });*/
        })
    </script>
</head>
<body>
    <div class="content">
        <form action="userController/login" method="post" id="form1">
            用户名:<input type="text" name="u_name" class="name" value="请输入用户名" required="required" pattern="[a-zA-Z0-9]{6,18}" title="用户名必须是由大小写英文字母和数字组成且长度为6-18位"><br>
            密码:<input type="password" name="u_pass" class="pass" value="请输入密码" required="required" pattern="[a-zA-Z]\w{5,17}" title="用户密码必须是由大小写英文字母开头,且是由大小写英文字母、数字和下划线组成,长度为6-18位"><br>
            <select name="u_type" required="required" class="select">
                <option value="0">普通用户</option>
                <option value="2">管理员</option>
            </select>
            <input type="submit" value="登录" class="submit1">
        </form>
        <span id="errorSpan1" >${userOrAdminLoginError}</span>
        <p>员工登录专用通道</p>
        <form action="empController/empLogin" method="post" id="form2">
            用户名:<input type="text" name="e_account" class="name" value="请输入账号" required="required" pattern="[a-zA-Z0-9]{6,18}" title="用户名必须是由大小写英文字母和数字组成且长度为6-18位"><br>
            密码:<input type="password" name="e_pass" class="pass" value="请输入密码" required="required" pattern="[a-zA-Z]\w{5,17}" title="用户密码必须是由大小写英文字母开头,且是由大小写英文字母、数字和下划线组成,长度为6-18位"><br>
            <input type="submit" value="登录" class="submit2">
        </form>
        <span id="errorSpan2">${empLoginError}</span>
    </div>

</body>
</html>

