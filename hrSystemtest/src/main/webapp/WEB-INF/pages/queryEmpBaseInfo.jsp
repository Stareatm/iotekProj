<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/5/9
  Time: 3:34
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
    <title>queryEmpBaseInfo</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/toMain.css">
    <link rel="stylesheet" type="text/css" href="../../css/showUserInfo.css">
</head>
<body>
    <div class="content">
        <table border="1" cellpadding="0" cellspacing="0">
            <tr>
                <th>员工姓名</th>
                <th>员工性别</th>
                <th>生日</th>
                <th>邮箱</th>
            </tr>
            <tr>
                <form action="empController/updateEmpInfo" method="post">
                    <td>
                        <input name="e_name" type="text" value="${sessionScope.emp.e_name}" readonly="readonly">
                    </td>
                    <td>
                        <input name="e_sex" type="text" value="${sessionScope.emp.e_sex}" readonly="readonly">
                    </td>
                    <td>
                        <fmt:formatDate value="${sessionScope.emp.e_birthday}" pattern="yyyy-MM-dd" var="birthday"/>
                        <input name="eBirthday" type="date" value="${birthday}" readonly="readonly">
                    </td>
                    <td>
                        <input name="e_email" type="text" value="${sessionScope.emp.e_email}" readonly="readonly">
                    </td>
                </form>
            </tr>
            <tr>
                <th>部门</th>
                <th>职位</th>
                <th>入职日期</th>
            </tr>
            <tr>
                <td>
                    <input name="d_name" type="text" value="${job.dept.d_name}" readonly="readonly">
                </td>
                <td>
                    <input name="j_name" type="text" value="${job.j_name}" readonly="readonly">
                </td>
                <td>
                    <fmt:formatDate value="${sessionScope.emp.e_hireDate}" pattern="yyyy-MM-dd" var="hireDate"/>
                    <input name="eHireDate" type="datetime" value="${hireDate}" readonly="readonly">
                </td>
            </tr>
        </table>
    </div>
    <a href="deptController/queryDept" id="toUpper">返回上一级</a>
    <a href="empController/toPage?choose=empMain" id="toMain">返回首页</a>
</body>
</html>

