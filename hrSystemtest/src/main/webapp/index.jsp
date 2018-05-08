<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>index</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<body>
    <div class="content">
        <p>
            <a href="userController/toPage?choose=login">LOGIN</a>
        </p>
        <p>
            <a href="userController/toPage?choose=register">REGISTER</a>
        </p>
    </div>
</body>
</html>

