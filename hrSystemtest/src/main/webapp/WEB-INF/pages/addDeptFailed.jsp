<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/25
  Time: 9:15
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
    <div>添加部门失败</div>
    <a href="deptController/toPage?choose=adminMain">返回>>主菜单</a>
</body>
</html>

