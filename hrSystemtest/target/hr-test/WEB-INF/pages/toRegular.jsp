<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/27
  Time: 18:19
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
    <title>toRegular</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/toMain.css">
    <link rel="stylesheet" type="text/css" href="../../css/showUserInfo.css">
</head>
<body>
    <div class="content">
        <table border="1" cellspacing="0" cellpadding="0">
            <tr>
                <th>员工编号</th>
                <th>员工姓名</th>
                <th>转正时间</th>
                <th>缘由</th>
                <th>提交详情</th>
            </tr>
            <tr>
                <form action="empStatusController/RegularEmp">
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
                        <input name="e_status" type="hidden" value="1">
                        <input type="submit" value="提交转正">
                    </td>
                </form>
            </tr>
        </table>
    </div>
    <a href="empController/queryEmpInfo?e_id=${emp.e_id}" id="toMain">返回上一级</a>

</body>
</html>

