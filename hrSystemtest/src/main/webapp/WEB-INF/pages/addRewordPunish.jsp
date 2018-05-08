<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/5/6
  Time: 16:26
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
    <table border="1" cellspacing="0" cellpadding="0">
        <tr>
            <th colspan="4">对应奖惩记录</th>
        </tr>
        <tr>
            <th>奖惩日期</th>
            <th>奖惩原因</th>
            <th>奖惩金额(正表示奖励,负表示惩罚)</th>
            <th>添加奖惩记录</th>
        </tr>
        <tr>
            <form action="rewordPunishController/addRP1">
                <td>
                    <input type="datetime-local" name="rpTime" readonly="readonly">
                </td>
                <td>
                    <textarea name="rp_reason" required="required"></textarea>
                </td>
                <td>
                    <input type="number" name="rp_rpSal" step="1" required="required">元
                </td>
                <td>
                    <input type="hidden" name="s_id" value="${salary.s_id}">
                    <input type="submit" value="添加">
                </td>
            </form>
        </tr>
    </table>
</body>
</html>

