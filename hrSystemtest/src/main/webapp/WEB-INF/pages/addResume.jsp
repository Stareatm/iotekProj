<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/22
  Time: 22:52
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
    简历信息如下:
    <table border="1" cellspacing="0" cellpadding="0">
        <tr>
            <th>姓名</th>
            <th>性别</th>
            <th>身份证号</th>
            <th>出生日期</th>
            <th>户籍地址</th>
            <th>居住地址</th>
            <th>工作年限</th>
            <th>联系电话</th>
            <th>Email</th>
            <th>期望职位</th>
            <th>期望工作地点</th>
            <th>期望薪资</th>
            <th>工作经历</th>
            <th>添加简历</th>
        </tr>
        <tr>
            <form action="resumeController/addResume">
                <td><input name="rs_name" type="text"></td>
                <td>
                    <select name="rs_sex">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </td>
                <td><input name="rs_IDNumber" type="text"></td>
                <td><input type="date" name="birthday"></td>
                <td><input type="text" name="rs_residence"></td>
                <td><input type="text" name="rs_addr"></td>
                <td><input type="text" name="rs_expTime" min="0"></td>
                <td><input type="text" name="rs_phone"></td>
                <td><input type="text" name="rs_email" ></td>
                <td><input type="text" name="rs_desiredPosition"></td>
                <td><input type="text" name="rs_desiredLocation"></td>
                <td><input type="number" name="rs_expectedSal" step="500">元/月</td>
                <td><textarea name="rs_careerExp"></textarea></td>
                <td>
                    <input type="hidden" name="rs_status" value="-1">
                    <input type="submit" value="添加">
                </td>
            </form>
        </tr>
    </table>
    <a href="recruitController/toPage?choose=userMain">返回主菜单</a>
</body>
</html>

