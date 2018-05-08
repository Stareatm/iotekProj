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
    <title>adminMain</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
</head>
<body>
    <div class="content">
        <ul>
            <li>
                <a href="recruitController/showRecruit">招聘信息管理</a>
            </li>
            <li>
                <a href="resumeController/showUnReadResume">未读简历</a>
            </li>
            <li>
                <a href="resumeController/showReadedResume">已读简历</a>
            </li>
            <li>
                <a href="interviewController/showSentInterview">未确认的面试邀请</a>
            </li>
            <li>
                <a href="interviewController/showConfirmedInterview">已确认的面试</a>
            </li>
            <li>
                <a href="deptController/showDept">部门及人员管理</a>
            </li>
            <li>
                <a href="trainingController/showTraining">培训管理</a>
            </li>
            <li>
                <a href="salaryController/showAllSalary">薪资结算</a>
            </li>
            <li>
                <a href="salaryController/querySalaryReconsider">查看薪资复议</a>
            </li>
        </ul>
    </div>
</body>
</html>

