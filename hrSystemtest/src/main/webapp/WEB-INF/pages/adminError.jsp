<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/27
  Time: 19:27
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
    ${regularEmpError}
    ${LeaveEmpError}
    ${addTrainingError}
    ${updateTrainingError}<br>
    <a href="empController/toPage?choose=adminMain">返回主页</a>
</body>
</html>

