<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/24
  Time: 14:05
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
        <legend>修改密码</legend>
        <form action="empController/updateEmpPass" method="post">
            用户名:<input type="text" name="e_account" value="${sessionScope.emp.e_account}" readonly="readonly"><br>
            修改后密码:<input type="text" name="e_pass"><br>
            确认密码:<input type="password" name="e_pass1"><span id="rePass"></span><br>
            <input type="submit" id="" value="修改">
        </form>
    </fieldset>
    返回>><a href="empController/toPage?choose=empMain">首页</a>
</body>
</html>

