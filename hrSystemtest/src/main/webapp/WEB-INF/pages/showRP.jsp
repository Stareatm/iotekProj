<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/5/6
  Time: 17:49
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
    <title>showRP</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/toMain.css">
    <link rel="stylesheet" type="text/css" href="../../css/showUserInfo.css">
</head>
<body>
    <div class="content">
        <table border="1" cellspacing="0" cellpadding="0">
            <tr>
                <th colspan="3">对应奖惩记录</th>
            </tr>
            <tr>
                <th>奖惩日期</th>
                <th>奖惩原因</th>
                <th>奖惩金额(正表示奖励,负表示惩罚)</th>
            </tr>
            <c:forEach items="${rewordPunishList}" var="rp">
                <tr>
                    <td>
                        <fmt:formatDate value="${rp.rp_time}" pattern="yyyy-MM-dd HH:mm:ss" var="rpTime"/>
                        <input type="datetime" value="${rpTime}" readonly="readonly">
                    </td>
                    <td>
                        <textarea name="rp_reason" readonly="readonly">${rp.rp_reason}</textarea>
                    </td>
                    <td>
                        <input type="number" name="rp_rpSal" step="1" value="${rp.rp_rpSal}" readonly="readonly">元
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <a href="salaryController/toPage?choose=empMain" id="toMain">返回主页</a>

</body>
</html>

