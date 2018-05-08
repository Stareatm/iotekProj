<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/5/2
  Time: 3:19
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
    <c:if test="${salaryList.size()==0}">
        sorry,没有查到相关的工资!
    </c:if>
    <c:if test="${salaryList.size()!=0}">
        <table border="1" cellpadding="0" cellspacing="0">
            <tr>
                <th>员工编号</th>
                <th>员工姓名</th>
                <th>基本工资</th>
                <th>绩效奖金</th>
                <th>奖惩费用(包括加班)</th>
                <th>社保</th>
                <th>总薪资</th>
                <th>薪资结算时间</th>
                <th>申请复议</th>
            </tr>
            <c:forEach items="${salaryList}" var="salary">
                <tr>
                    <td>
                        <input type="text" value="${sessionScope.emp.e_id}" readonly="readonly">
                    </td>
                    <td>
                        <input type="text" value="${sessionScope.emp.e_name}" readonly="readonly">
                    </td>
                    <td>
                        <input type="number" value="${salary.s_baseSal}" readonly="readonly">元
                    </td>
                    <td>
                        <input type="number" value="${salary.s_performance}" readonly="readonly">元
                    </td>
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

                    <td>
                        <c:if test="${salary.s_status==0}">
                            <form action="salaryController/addSalaryReconsider">
                                <input type="hidden" name="s_id" value="${salary.s_id}">
                                <input type="submit" value="申请">
                            </form>
                        </c:if>
                        <c:if test="${salary.s_status==1}">
                            <div><input type="text" value="复议未审批" readonly="readonly"></div>
                        </c:if>
                        <c:if test="${salary.s_status==2}">
                            <div><input type="text" value="复议审批未通过" readonly="readonly"></div>
                        </c:if>
                        <c:if test="${salary.s_status==3}">
                            <div><input type="text" value="复议未审批通过" readonly="readonly"></div>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <a href="salaryController/toPage?choose=empMain">返回主页</a>
</body>
</html>

