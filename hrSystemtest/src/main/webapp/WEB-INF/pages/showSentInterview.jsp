<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
    <title>查看发送的面试邀请</title>
</head>
<body>
    <p>未确认面试名单</p>
    <table border="1" cellpadding="0" cellspacing="0">
        <tr>
            <th>应聘者姓名</th>
            <th>应聘者手机号</th>
            <th>应聘的部门</th>
            <th>应聘的职位</th>
            <th>面试时间</th>
            <th>面试地址</th>
        </tr>
        <c:forEach items="${interviewList}" var="interview">
            <tr>
                <td>${interview.resume.rs_name}</td>
                <td>${interview.resume.rs_phone}</td>
                <td>
                    <input value="${interview.d_name}" readonly="readonly">
                </td>
                <td>
                    <input value=" ${interview.j_name}" readonly="readonly">
                </td>
                <td>
                    <fmt:formatDate value="${interview.i_time}" pattern="yyyy-MM-dd HH:mm" var="iTime"/>
                    <input type="datetime" value="${iTime}" readonly="readonly">
                </td>
                <td>${interview.i_addr}</td>
            </tr>
        </c:forEach>
    </table>
    <a href="interviewController/toPage?choose=adminMain">返回>>主菜单</a>
</body>
</html>

