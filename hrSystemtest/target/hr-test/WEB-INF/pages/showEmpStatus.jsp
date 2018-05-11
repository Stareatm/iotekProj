<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/5/1
  Time: 6:37
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
    <title>showEmpStatus</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/toMain.css">
    <link rel="stylesheet" type="text/css" href="../../css/showUserInfo.css">
</head>
<body>
    <div class="content">
        <table border="1" cellpadding="0" cellspacing="0">
            <tr>
                <th>员工编号</th>
                <th>员工姓名</th>
                <th>处理时间</th>
                <th>缘由</th>
            </tr>
            <c:forEach items="${empStatusList}" var="empStatus">
                <tr>
                    <td>
                        <input type="text" value="${emp.e_id}" readonly="readonly">
                    </td>
                    <td>
                        <input type="text" value="${emp.e_name}" readonly="readonly">
                    </td>
                    <td>
                        <fmt:formatDate value="${empStatus.es_changeDate}" pattern="yyyy-MM-dd" var="changeDate"/>
                        <input type="date" value="${changeDate}" readonly="readonly">
                    </td>
                    <td>
                        <textarea readonly="readonly">${empStatus.es_reasons}</textarea>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <a href="empController/queryEmpInfo?e_id=${emp.e_id}" id="toUpper">返回上一级</a>
    <a href="empController/toPage?choose=adminMain" id="toMain">返回主页</a>
</body>
</html>

