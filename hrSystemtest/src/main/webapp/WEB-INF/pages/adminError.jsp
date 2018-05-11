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
    <title>adminError</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/toMain.css">
    <link rel="stylesheet" type="text/css" href="../../css/showUserInfo.css">
</head>
<body>
    <div class="content">
        ${regularEmpError}
        ${LeaveEmpError}
        ${addTrainingError}
        ${updateTrainingError}
        ${addDeptError}
        ${addSalaryError}
        ${addJobError}
    </div>
    <a href="empController/toPage?choose=adminMain" id="toMain">返回主页</a>
</body>
</html>

