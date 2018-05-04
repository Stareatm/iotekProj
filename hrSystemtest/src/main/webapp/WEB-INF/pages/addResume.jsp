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
        <form action="resumeController/addResume">
            <tr>
                <th>姓名</th>
                <td><input name="rs_name" type="text" required="required"></td>
                <th>性别</th>
                <td>
                    <select name="rs_sex" required="required">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </td>
                <th>身份证号</th>
                <td>
                    <input name="rs_IDNumber" type="text" required="required">
                </td>
            </tr>
            <tr>
                <th>出生日期</th>
                <td>
                    <input type="date" name="birthday" required="required">
                </td>
                <th>户籍地址</th>
                <td>
                    <input type="text" name="rs_residence" required="required">
                </td>
                <th>居住地址</th>
                <td>
                    <input type="text" name="rs_addr" required="required">
                </td>
            </tr>
            <tr>
                <th>工作年限</th>
                <td>
                    <input type="text" name="rs_expTime" required="required">
                </td>
                <th>联系电话</th>
                <td>
                    <input type="text" name="rs_phone" required="required">
                </td>
                <th>Email</th>
                <td>
                    <input type="text" name="rs_email" required="required">
                </td>
            </tr>
            <tr>
                <th>期望职位</th>
                <td>
                    <input type="text" name="rs_desiredPosition" required="required">
                </td>
                <th>期望工作地点</th>
                <td>
                    <input type="text" name="rs_desiredLocation" required="required">
                </td>
                <th>期望薪资</th>
                <td>
                    <input type="number" name="rs_expectedSal" step="500" min="3000" required="required">元/月
                </td>
            </tr>
                <th>工作经历</th>
                <td>
                    <textarea name="rs_careerExp" required="required"></textarea>
                </td>
                <th>添加简历</th>
                <td>
                    <input type="hidden" name="rs_status" value="-1">
                    <input type="submit" value="添加">
                </td>
            </tr>
        </form>
    </table>
    <a href="recruitController/toPage?choose=userMain">返回主菜单</a>
</body>
</html>

