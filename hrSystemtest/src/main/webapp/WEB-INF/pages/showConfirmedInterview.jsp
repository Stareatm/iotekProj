<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/23
  Time: 16:04
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
    <p>已确认面试人名单如下</p>
    <table border="1" cellspacing="0" cellpadding="0">
        <tr>
            <th>应聘者姓名</th>
            <th>应聘者手机号</th>
            <th>应聘岗位</th>
            <th>面试时间</th>
            <th>面试地址</th>
            <th>录取</th>
        </tr>
        <c:forEach items="${interviewList}" var="interview">
            <tr>
                <td>${interview.resume.rs_name}</td>
                <td>${interview.resume.rs_phone}</td>
                <td>${interview.job.j_name}</td>
                <td>
                    <fmt:formatDate value="${interview.i_time}" pattern="YYYY-MM-DD HH24:MM:SS"/>
                </td>
                <td>${interview.i_addr}</td>
                <td>
                    <form action="empController/toAddEmp">
                        <input type="hidden" name="i_id" value="${interview.i_id}">
                        <input type="submit" value="录取">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>

