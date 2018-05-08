<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/5/6
  Time: 6:39
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
            <th colspan="3">对应奖惩记录</th>
        </tr>
        <tr>
            <th>奖惩日期</th>
            <th>奖惩原因</th>
            <th>奖惩金额(正表示奖励,负表示惩罚)</th>
            <th>修改</th>
            <th>删除</th>
        </tr>
        <c:forEach items="${rewordPunishList}" var="rp">
            <tr>
                <form action="rewordPunishController/updateRP">
                    <td>
                        <input type="datetime" name="rp_time" value="${rp.rp_time}" required="required">
                    </td>
                    <td>
                        <textarea name="rp_reason" required="required">${rp.rp_reason}</textarea>
                    </td>
                    <td>
                        <input type="number" name="rp_rpSal" value="${rp.rp_rpSal}" step="1" required="required">元
                    </td>
                    <td>
                        <input type="hidden" name="rp_id" value="${rp.rp_id}">
                        <input type="submit" value="修改">
                    </td>
                </form>
                <td>
                    <form action="rewordPunishController/deleteRP">
                        <input type="hidden" name="rp_id" value="${rp.rp_id}">
                        <input type="submit" value="删除">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    <br>
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
            <form action="rewordPunishController/addRP">
                <td>
                    <input type="datetime-local" name="rpTime" required="required">
                </td>
                <td>
                    <textarea name="rp_reason" required="required"></textarea>
                </td>
                <td>
                    <input type="number" name="rp_rpSal" step="1" required="required">元
                </td>
                <td>
                    <input type="hidden" name="e_id" value="${emp.e_id}">
                    <input type="submit" value="添加">
                </td>
            </form>
        </tr>
    </table>
    <br>
    <a href="empController/queryEmpInfo?e_id=${emp.e_id}">返回上一级</a>
</body>
</html>

