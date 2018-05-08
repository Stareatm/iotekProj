<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/20
  Time: 16:42
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
    <title>userMain</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
</head>
<body>
    <div class="content">
        <ul>
            <li>
                <a href="userController/toPage?choose=showUserInfo">查看个人信息</a>
            </li>
            <li>
                <a href="recruitController/showReceivedRecruit">查看招聘信息</a>
            </li>
            <li>
                <a href="resumeController/showResume">简历管理</a>
            </li>
            <li>
                <a href="interviewController/showReceivedInterview">查看面试邀请</a>
            </li>
        </ul>
    </div>
</body>
</html>

