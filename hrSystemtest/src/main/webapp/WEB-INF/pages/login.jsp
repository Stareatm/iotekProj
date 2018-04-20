<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/20
  Time: 16:07
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
    <fieldset>
        <legend>LOGIN</legend>
        <form action="userController/login" method="post">
            用户名:<input type="text" name="u_name"><br>
            密码:<input type="password" name="u_pass"><br>
            <select name="u_type">
                <option value="0">普通用户</option>
                <option value="1">员工</option>
                <option value="2">管理员</option>
            </select>
            <input type="submit" value="登录">
        </form>
    </fieldset>
</body>
</html>

