<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/23
  Time: 11:20
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
    <table>
        <tr>
            <th>应聘者姓名</th>
            <th>应聘者手机号</th>
            <th>应聘岗位</th>
            <th>面试时间</th>
            <th>面试地址</th>
            <th>发送邀请</th>
        </tr>
        <tr>
            <form action="interviewController/addInterview">
                <td><input name="rs_name" type="text" readonly="readonly" value="${resume1.rs_name}"></td>
                <td><input name="rs_phone" type="text" readonly="readonly" value="${resume1.rs_phone}"></td>
                <td>
                    <select name="j_name">
                        <c:forEach items="${jobList}" var="job">
                            <option value="${job.j_name}">
                                <input type="hidden" name="j_id" value="${job.j_id}"><br>${job.j_name}
                            </option>
                        </c:forEach>
                    </select>
                </td>
                <td>
                    <input name="i_time" type="date">
                </td>
                <td>
                    <input name="i_addr" type="text">
                </td>
                <td>
                    <input type="hidden" name="rs_id" value="${resume1.rs_id}">
                    <input type="submit" value="发送"></td>
            </form>
        </tr>
    </table>
    <a href="interviewController/toPage?choose='adminMain'">返回>>已读简历</a>
</body>
</html>

