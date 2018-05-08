<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/23
  Time: 16:04
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
    <title>showSentInterview</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/toMain.css">
    <link rel="stylesheet" type="text/css" href="../../css/showUserInfo.css">
</head>
<body>

    <div class="content">
        <c:if test="${interviewList.size()==0}">
            <div>对不起,没有未确认的面试名单!</div>
        </c:if>
        <c:forEach items="${interviewList}" var="interview" varStatus="status">
            <table border="1" cellpadding="0" cellspacing="0">
                <tr>
                    <th colspan="6">未确认的面试名单${status.index+1}</th>
                </tr>
                <tr>
                    <th>应聘者姓名</th>
                    <td>
                        <input type="text" value="${interview.resume.rs_name}" readonly="readonly">
                    </td>
                    <th>应聘者手机号</th>
                    <td>
                        <input type="text" value="${interview.resume.rs_phone}" readonly="readonly">
                    </td>
                    <th>应聘的部门</th>
                    <td>
                        <input value="${interview.d_name}" readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <th>应聘的职位</th>
                    <td>
                        <input value=" ${interview.j_name}" readonly="readonly">
                    </td>
                    <th>面试时间</th>
                    <td>
                        <fmt:formatDate value="${interview.i_time}" pattern="yyyy-MM-dd HH:mm" var="iTime"/>
                        <input type="datetime" value="${iTime}" readonly="readonly">
                    </td>
                    <th>面试地址</th>
                    <td>
                        <input value="${interview.i_addr}" readonly="readonly">
                    </td>
                </tr>
            </table>
            <p></p>
        </c:forEach>
    </div>
    <a href="interviewController/toPage?choose=adminMain" id="toMain">返回主菜单</a>
</body>
</html>

