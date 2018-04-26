<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/24
  Time: 14:27
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
    <div>两次密码不一致!</div>
    <a href="empController/toPage?choose=updatePass">修改密码</a>
</body>
</html>

