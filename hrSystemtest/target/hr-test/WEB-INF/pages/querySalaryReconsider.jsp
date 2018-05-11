<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/5/6
  Time: 15:30
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
    <title>querySalaryReconsider</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/toMain.css">
    <link rel="stylesheet" type="text/css" href="../../css/showUserInfo.css">
</head>
<body>
    <div class="content">
        <c:if test="${salaryList.size()==0}">
            <div>
                sorry,没有查到相关的工资复议!
            </div>
        </c:if>
        <c:if test="${salaryList.size()!=0}">
            <c:forEach items="${salaryList}" var="salary">
                <table border="1" cellpadding="0" cellspacing="0">
                    <tr>
                        <th colspan="9">薪资复议表</th>
                    </tr>
                    <tr>
                        <th>员工编号</th>
                        <th>员工姓名</th>
                        <th>基本工资</th>
                        <th>绩效奖金</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" value="${salary.emp.e_id}" readonly="readonly">
                        </td>
                        <td>
                            <input type="text" value="${salary.emp.e_name}" readonly="readonly">
                        </td>
                        <td>
                            <input type="number" value="${salary.s_baseSal}" readonly="readonly">元
                        </td>
                        <td>
                            <input type="number" value="${salary.s_performance}" readonly="readonly">元
                        </td>
                    </tr>
                    <tr>
                        <th>奖惩费用(包括加班)</th>
                        <th>社保</th>
                        <th>总薪资</th>
                        <th>薪资结算时间</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="number" value="${salary.s_rpSal}" readonly="readonly">元
                        </td>
                        <td>
                            <input type="number" value="${salary.s_socialSecurity}" readonly="readonly">元
                        </td>
                        <td>
                            <input type="number" value="${salary.s_totalSal}" readonly="readonly">元
                        </td>
                        <td>
                            <fmt:formatDate value="${salary.s_time}" pattern="yyyy-MM-dd HH:mm:ss" var="time"/>
                            <input type="datetime" value="${time}" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <th>复议处理</th>
                        <td>
                            <form action="salaryController/doReconsider">
                                <select name="status" required="required">
                                    <option value="2">复议审批未通过</option>
                                    <option value="3">复议审批通过,添加奖惩</option>
                                </select><br>
                                <input type="hidden" name="s_id" value="${salary.s_id}">
                                <input type="submit" value="提交">
                            </form>
                        </td>
                    </tr>
                <p></p>
                </table>
            </c:forEach>
        </c:if>
    </div>
    <a href="salaryController/toPage?choose=adminMain" id="toMain">返回主页</a>
</body>
</html>

