<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/26
  Time: 7:16
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

    <table border="1" cellpadding="0" cellspacing="0">
        <tr>
            <th>员工姓名</th>
            <th>员工性别</th>
            <th>身份证号</th>
            <th>联系方式</th>
            <th>生日</th>
            <th>邮箱</th>
            <th>地址</th>
            <th>修改</th>
        </tr>
        <tr>
            <form action="empController/updateEmp">
                <td>
                    <input name="e_name" type="text" value="${sessionScope.emp.e_name}" readonly="readonly">
                </td>
                <td>
                    <input name="e_sex" type="text" value="${sessionScope.emp.e_sex}" required="required">
                </td>
                <td>
                    <input name="e_IDNumber" type="text" value="${sessionScope.emp.e_IDNumber}" readonly="readonly">
                </td>
                <td>
                    <input name="e_phone" type="text" value="${sessionScope.emp.e_phone}" required="required">
                </td>
                <td>
                    <fmt:formatDate value="${sessionScope.emp.e_birthday}" pattern="yyyy-MM-dd" var="birthday"/>
                    <input name="eBirthday" type="date" value="${birthday}" required="required">
                </td>
                <td>
                    <input name="e_email" type="text" value="${sessionScope.emp.e_email}" required="required">
                </td>
                <td>
                    <input name="e_addr" type="text" value="${sessionScope.emp.e_addr}" required="required">
                </td>

                <td>
                    <input name="e_id" type="hidden" value="${sessionScope.emp.e_id}">
                    <input type="submit" value="修改">
                </td>
            </form>
        </tr>
        <tr>
            <th>部门</th>
            <th>职位</th>
            <th>入职日期</th>
            <th>基本薪资</th>
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
                <input name="eHireDate" type="datetime" value="${hireDate}" readonly="readonly"></td>
            <td><input name="e_baseSal" type="number" value="${sessionScope.emp.e_baseSal}" readonly="readonly">元/月</td>
        </tr>
    </table>

    <p><a href="empController/toPage?choose=updateEmpPass">修改密码</a></p>
</body>
</html>

