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
    <title></title>
</head>
<body>
    <div>欢迎用户&nbsp;${sessionScope.user}&nbsp;登录!</div>
    <a>查看个人信息</a>
    <a href="recruitController/showRecruit">查看招聘信息</a>
    <a href="resumeController/showResume">简历管理</a>
    <a href="interviewController/showReceivedInterview">查看面试邀请</a>
</body>
</html>

