<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/5/9
  Time: 11:00
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
    <title>queryTraining</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/toMain.css">
    <link rel="stylesheet" type="text/css" href="../../css/showUserInfo.css">
</head>
<body>
    <div class="content">
        <c:if test="${trainingList.size()==0}">
            <div>没有培训通知!</div>
        </c:if>
        <c:if test="${trainingList.size()!=0}">
            <c:forEach items="${trainingList}" var="training" varStatus="status">
                <table border="1" cellpadding="0" cellspacing="0">
                    <tr>
                        <th colspan="4">培训项目${status.index+1}</th>
                    </tr>
                    <tr>
                        <th>培训主题</th>
                        <th>培训内容</th>
                        <th>培训开始时间</th>
                        <th>培训结束时间</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" value="${training.t_theme}" readonly="readonly">
                        </td>
                        <td>
                            <input type="text" value="${training.t_content}" readonly="readonly">
                        </td>
                        <td>
                            <fmt:formatDate value="${training.t_beginTime}" pattern="yyyy-MM-dd HH:mm" var="beginTime"/>
                            <input type="datetime" value="${beginTime}" readonly="readonly" >
                        </td>
                        <td>
                            <fmt:formatDate value="${training.t_endTime}" pattern="yyyy-MM-dd HH:mm" var="endTime"/>
                            <input type="datetime" value="${endTime }" readonly="readonly" >
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2">培训地址</th>
                        <th colspan="2">培训部门名称</th>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="text" value="${training.t_addr}" readonly="readonly">
                        </td>
                        <td colspan="2">
                            <input type="text" value="${dept.d_name}" readonly="readonly">
                        </td>
                    </tr>
                </table>

            </c:forEach>
        </c:if>
    </div>
    <a href="empController/toPage?choose=empMain" id="toMain">返回主菜单</a>
</body>
</html>

