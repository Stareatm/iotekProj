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
    <title>empMain</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <style type="text/css">
        #button{
            background-color: deeppink;
        }
    </style>
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script>
        $(function () {
            $("#button").click(function () {
                $.ajax({
                    type:"post",
                    url:"attendanceController/addOrUpdateAttendance",
                    success:function (obj) {
                        alert(obj);
                    }
                })
            });
        })
    </script>
</head>
<body>
    <div>
        <div><input type="button" value="打卡" id="button"></div>
        <ul>
            <li>
                <a href="recruitController/showReceivedRecruit">查看招聘信息</a>
            </li>
            <li>
                <a href="empController/showEmpInfo">查看个人信息</a>
            </li>
            <li>
                <a href="deptController/queryDept">查看部门</a>
            </li>
            <li>
                <a href="trainingController/queryTraining">查看培训</a>
            </li>
            <li>
                <a href="salaryController/showSalary">查看薪资</a>
            </li>
            <li>
                <a href="rewordPunishController/showRP">查看奖惩记录</a>
            </li>
            <li>
                <a href="attendanceController/showAttendance">查看考勤</a>
            </li>
        </ul>
    </div>
</body>
</html>

