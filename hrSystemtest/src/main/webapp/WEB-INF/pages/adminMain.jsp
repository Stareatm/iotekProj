<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/20
  Time: 16:43
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
    <div>欢迎管理员&nbsp;${sessionScope.user}&nbsp;登录!</div>
    <a href="recruitController/showRecruit">招聘信息管理</a>
    <a href="resumeController/showUnReadResume">未读简历</a>
    <a href="resumeController/showReadedResume">已读简历</a>
    <a href="interviewController/showSentInterview">未确认的面试邀请</a>
    <a href="interviewController/showConfirmedInterview">已确认的面试</a>
    <a href="">员工管理</a>
</body>
</html>

