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
    <title></title>
</head>
<body>
    <table border="1" cellpadding="0" cellspacing="0">
        <tr>
            <th>员工姓名</th>
            <th>员工性别</th>
            <th>身份证号</th>
            <th>年龄</th>
            <th>地址</th>
            <th></th>
        </tr>
    </table>
</body>
</html>

