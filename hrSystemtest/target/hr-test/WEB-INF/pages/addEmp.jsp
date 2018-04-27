<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/23
  Time: 16:31
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
    <title>addEmp</title>

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
            <th>部门</th>
            <th>职位</th>
            <th>入职日期</th>
            <th>基本薪资</th>
            <th>入职</th>
        </tr>
        <tr>
            <form action="empController/addEmp">
                <td>
                    <input name="e_name" type="text" value="${resume.rs_name}" readonly="readonly">
                </td>
                <td>
                    <input name="e_sex" type="text" value="${resume.rs_sex}" readonly="readonly">
                </td>
                <td>
                    <input name="e_IDNumber" type="text" value="${resume.rs_IDNumber}" readonly="readonly">
                </td>
                <td>
                    <input name="e_phone" type="text" value="${resume.rs_phone}" readonly="readonly">
                </td>
                <td>
                    <fmt:formatDate value="${resume.rs_birthday}" pattern="yyyy-MM-dd" var="birthday"/>
                    <input name="eBirthday" type="date"  readonly="readonly" value="${birthday}">
                </td>
                <td>
                    <input name="e_email" type="text" value="${resume.rs_email}" readonly="readonly">
                </td>
                <td>
                    <input name="e_addr" type="text" value="${resume.rs_addr}" readonly="readonly">
                </td>
                <td>
                    <input name="d_name" type="text" value="${interview.d_name}" readonly="readonly">
                </td>
                <td>
                    <input name="j_name" type="text" value="${interview.j_name}" readonly="readonly">
                </td>
                <td><input name="hireDate" type="date"></td>
                <td><input name="e_baseSal" type="number" min="3000" step="500" value="3000">元/月</td>
                <td>
                    <input name="e_status" type="hidden" value="0"><%--试用期--%>
                    <input name="i_id" type="hidden" value="${interview.i_id}">
                    <input type="submit" value="入职">
                </td>
            </form>
        </tr>
    </table>
</body>
</html>

