<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/5/7
  Time: 20:32
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
    <title>updateUserPass</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/toMain.css">
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script>
        $(function () {
            $(".pass").focus(function () {
                $(this).val("");
                $("#spanError").empty();
            })
        })
    </script>
</head>
<body>
    <div class="content">
        <form action="userController/updateUserPass">
            原密码:<input type="password" name="oldPass"  class="pass" value="请输入密码" required="required" pattern="[a-zA-Z]\w{5,17}" title="用户密码必须是由大小写英文字母开头,且是由大小写英文字母、数字和下划线组成,长度为6-18位"><br>
            新密码:<input type="password" name="newPass"  class="pass" value="请输入新密码" required="required" pattern="[a-zA-Z]\w{5,17}" title="用户密码必须是由大小写英文字母开头,且是由大小写英文字母、数字和下划线组成,长度为6-18位"><br>
            确认密码:<input type="password" name="rePass"  class="pass" value="请确认密码" required="required" pattern="[a-zA-Z]\w{5,17}" title="用户密码必须是由大小写英文字母开头,且是由大小写英文字母、数字和下划线组成,长度为6-18位"><br>
            <input type="submit" value="提交修改">
        </form>
        <span id="spanError">${updateUserPassError}</span>
    </div>
    <a href="userController/toPage?choose=userMain" id="toMain">返回主页</a>
</body>
</html>

