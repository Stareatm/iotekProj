<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/5/7
  Time: 15:38
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
    <title>showUserInfo</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/toMain.css">
    <link rel="stylesheet" type="text/css" href="../../css/showUserInfo.css">
</head>
<body>
    <div class="content">
        <table border="1" cellpadding="0" cellspacing="0">
            <tr>
                <th colspan="3">个人信息</th>
            </tr>
            <tr>
                <th>类型</th>
                <th>用户名</th>
                <th>修改密码</th>
            </tr>
            <tr>
                <form>
                    <td>
                        <c:if test="${sessionScope.user.u_type==0}">
                            <input type="text" name="u_type" value="普通用户" readonly="readonly">
                        </c:if>
                        <c:if test="${sessionScope.user.u_type==2}">
                            <input type="text" name="u_type" value="管理员" readonly="readonly">
                        </c:if>
                    </td>
                    <td>
                        <input type="text" name="u_name" value=" ${sessionScope.user.u_name}" readonly="readonly">
                    </td>
                    <td>
                        <a href="userController/toPage?choose=updateUserPass">修改密码</a>
                        <span>${updateUserPassSucceed}</span>
                    </td>
                </form>
            </tr>
        </table>
    </div>

    <a href="userController/toPage?choose=userMain" id="toMain">返回主页</a>
</body>
</html>

