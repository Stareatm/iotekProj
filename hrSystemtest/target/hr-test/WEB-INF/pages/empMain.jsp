<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/20
  Time: 16:25
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
    <div>欢迎员工&nbsp;${sessionScope.emp}&nbsp;登录</div>
    <a href="recruitController/showReceivedRecruit">查看招聘信息</a>
    <a href="empController/showEmpInfo">查看个人信息</a>
</body>
</html>

