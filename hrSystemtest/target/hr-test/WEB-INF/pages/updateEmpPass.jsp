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
    <title>updateEmpPass</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/toMain.css">
    <link rel="stylesheet" type="text/css" href="../../css/showUserInfo.css">
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script>
        $(function () {
            $("#pass").focus(function () {
                $("#errorSpan").empty();
            });
            $("#rePass").focus(function () {
                $("#errorSpan").empty();
            });
            $("#rePass").blur(function () {
                var pass=$("#pass").val();
                var rePass=$("#rePass").val();
                if (pass==rePass){
                    $("#errorSpan").html("√密码一致!")
                }else{
                    $("#errorSpan").html("×两次密码不一致!")
                }
            });
        })
    </script>
</head>
<body>
    <div class="content">
        <form action="empController/updateEmpPass" method="post">
            用户名:<input type="text" name="e_account" value="${sessionScope.emp.e_account}" readonly="readonly"><br>
            修改后密码:<input type="text" name="e_pass" id="pass" required="required" pattern="[a-zA-Z]\w{5,17}" title="用户密码必须是由大小写英文字母开头,且是由大小写英文字母、数字和下划线组成,长度为6-18位"><br>
            确认密码:<input type="password" name="e_pass1" id="rePass" required="required"><span id="errorSpan">${rePassError}</span><br>
            <input type="submit" id="" value="修改">
        </form>
    </div>
    <a href="empController/showEmpInfo" id="toUpper">返回上一级</a>
    <a href="empController/toPage?choose=empMain" id="toMain">返回首页</a>
</body>
</html>

