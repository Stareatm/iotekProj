<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/27
  Time: 19:13
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
    <title>toLeave</title>
</head>
<body>
    <table>
        <tr>
            <th>员工编号</th>
            <th>员工姓名</th>
            <th>离职时间</th>
            <th>缘由</th>
            <th>提交详情</th>
        </tr>
        <tr>
            <form action="empStatusController/LeaveEmp" method="post">
                <td>
                    <input name="e_id" type="text" value="${emp.e_id}" readonly="readonly">
                </td>
                <td>
                    <input type="text" value="${emp.e_name}" readonly="readonly">
                </td>
                <td>
                    <fmt:formatDate value="${date}" pattern="yyyy-MM-dd" var="nowDate"/>
                    <input name="changeDate" type="date" value="${nowDate}" readonly="readonly">
                </td>
                <td>
                    <textarea name="es_reasons" required="required"></textarea>
                </td>
                <td>
                    <input name="e_status" type="hidden" value="2">
                    <input type="submit" value="离职处理">
                </td>

            </form>
        </tr>
    </table>
</body>
</html>

