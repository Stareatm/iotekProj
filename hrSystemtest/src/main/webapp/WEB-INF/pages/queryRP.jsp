<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
    <title>queryRP</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/toMain.css">
    <link rel="stylesheet" type="text/css" href="../../css/showUserInfo.css">
</head>
<body>
    <div class="content">
        <c:if test="${rewordPunishList.size()==0}">
            <div>对不起,没有相关奖惩信息!</div>
        </c:if>
        <c:if test="${rewordPunishList.size()!=0}">
            <table border="1" cellspacing="0" cellpadding="0">
                <tr>
                    <th colspan="5">奖惩记录表</th>
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
                                <fmt:formatDate value="${rp.rp_time}" pattern="yyyy-MM-dd HH:mm:ss" var="rp_time"/>
                                <input type="datetime" name="rpTime" value="${rp_time}" required="required">
                            </td>
                            <td>
                                <textarea name="rp_reason" required="required">${rp.rp_reason}</textarea>
                            </td>
                            <td>
                                <input type="number" name="rp_rpSal" value="${rp.rp_rpSal}" step="1" required="required">元
                            </td>
                            <td>
                                <input type="hidden" name="rp_id" value="${rp.rp_id}">
                                <input type="hidden" name="e_id" value="${emp.e_id}">
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
        </c:if>
        <table border="1" cellspacing="0" cellpadding="0">
            <tr>
                <th colspan="4">添加奖惩记录</th>
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
    </div>
    <a href="empController/queryEmpInfo?e_id=${emp.e_id}" id="toMain">返回上一级</a>
</body>
</html>

