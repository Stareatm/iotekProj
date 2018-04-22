<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/20
  Time: 16:26
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
    <title></title>
</head>
<body>
    登录失败!<br>
    <a href="userController/toPage?choose='index'">首页</a>
</body>
</html>

