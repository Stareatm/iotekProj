<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/5/6
  Time: 18:16
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
    <title>showAttendance</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/toMain.css">
    <link rel="stylesheet" type="text/css" href="../../css/showUserInfo.css">
</head>
<body>
    <div class="content">
        <table border="1" cellspacing="0" cellpadding="0">
            <tr>
                <th>上班打卡时间</th>
                <th>下班打卡时间</th>
            </tr>
            <c:forEach items="${attendanceList}" var="attendance">
                <tr>
                    <td>
                        <fmt:formatDate value="${attendance.at_startTime}" pattern="yyyy-MM-dd HH:mm:ss" var="startTime"/>
                        <input type="datetime" value="${startTime}" readonly="readonly">
                    </td>
                    <td>
                        <fmt:formatDate value="${attendance.at_endTime}" pattern="yyyy-MM-dd HH:mm:ss" var="endTime"/>
                        <input type="datetime" value="${endTime}" readonly="readonly">
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <a href="empController/toPage?choose=empMain" id="toMain">返回首页</a>
</body>
</html>

