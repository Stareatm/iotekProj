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
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/toMain.css">
    <link rel="stylesheet" type="text/css" href="../../css/showUserInfo.css">
</head>
<body>
    <div class="content">
        <table border="1" cellpadding="0" cellspacing="0">
            <form action="empController/addEmp">
                <tr>
                    <th colspan="6">入职员工的信息</th>
                </tr>
                <tr>
                    <th>员工姓名</th>
                    <td>
                        <input name="e_name" type="text" value="${resume.rs_name}" readonly="readonly">
                    </td>
                    <th>员工性别</th>
                    <td>
                        <input name="e_sex" type="text" value="${resume.rs_sex}" readonly="readonly">
                    </td>
                    <th>身份证号</th>
                    <td>
                        <input name="e_IDNumber" type="text" value="${resume.rs_IDNumber}" readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <th>联系方式</th>
                    <td>
                        <input name="e_phone" type="text" value="${resume.rs_phone}" readonly="readonly">
                    </td>
                    <th>生日</th>
                    <td>
                        <fmt:formatDate value="${resume.rs_birthday}" pattern="yyyy-MM-dd" var="birthday"/>
                        <input name="eBirthday" type="date"  readonly="readonly" value="${birthday}">
                    </td>
                    <th>邮箱</th>
                    <td>
                        <input name="e_email" type="text" value="${resume.rs_email}" readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <th>地址</th>
                    <td>
                        <input name="e_addr" type="text" value="${resume.rs_addr}" readonly="readonly">
                    </td>
                    <th>部门</th>
                    <td>
                        <input name="d_name" type="text" value="${interview.d_name}" readonly="readonly">
                    </td>
                    <th>职位</th>
                    <td>
                        <input name="j_name" type="text" value="${interview.j_name}" readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <th>入职日期</th>
                    <td>
                        <input name="hireDate" type="date" required="required">
                    </td>
                    <th>基本薪资</th>
                    <td>
                        <input name="e_baseSal" type="number" min="3000" step="500" value="3000" required="required">元/月
                    </td>
                    <th>入职</th>
                    <td>
                        <input name="e_status" type="hidden" value="0"><%--试用期--%>
                        <input name="i_id" type="hidden" value="${interview.i_id}">
                        <input type="submit" value="入职">
                    </td>
                </tr>
            </form>
        </table>
    </div>
    <a href="empController/toPage?choose=adminMain" id="toMain">返回首页</a>
</body>
</html>

