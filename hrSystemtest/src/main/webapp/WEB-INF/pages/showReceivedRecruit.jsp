<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/25
  Time: 13:32
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
    <title>showReceivedRecruit</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/toMain.css">
    <link rel="stylesheet" type="text/css" href="../../css/showUserInfo.css">
</head>
<body>
    <div class="content">
        <c:if test="${recruitList.size()==0}">
            <div>抱歉,没有查到相关招聘信息!</div>
        </c:if>
        <c:if test="${recruitList.size()!=0}">
            <c:forEach items="${recruitList}" var="recruit">
                <table border="1" cellpadding="0" cellspacing="0">
                    <tr>
                        <th colspan="3">招聘信息</th>
                    </tr>
                    <tr>
                        <th>部门名称</th>
                        <th>职位名称</th>
                        <th>公司名称</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" value=" ${recruit.d_name}" readonly="readonly">
                        </td>
                        <td>
                            <input type="text" value=" ${recruit.j_name}" readonly="readonly">
                        </td>
                        <td>
                            <input type="text" value=" ${recruit.rc_company}" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <th>职位月薪</th>
                        <th>工作地点</th>
                        <th>公司性质</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="number" value="${recruit.rc_sal}" readonly="readonly">元/月
                        </td>
                        <td>
                            <input type="text" value="${recruit.rc_location}" readonly="readonly">
                        </td>
                        <td>
                            <input type="text" value="${recruit.rc_property}" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <th>公司规模</th>
                        <th>工作经验</th>
                        <th>学历</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" value="${recruit.rc_scale}" readonly="readonly">
                        </td>
                        <td>
                            <input type="text" value="${recruit.rc_expTime}" readonly="readonly">
                        </td>
                        <td>
                            <input type="text" value="${recruit.rc_eduBG}" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <th>性别要求</th>
                        <th>相关介绍</th>
                    </tr>
                        <tr>
                            <td>
                                <input type="text" value="${recruit.rc_sex}" readonly="readonly">
                            </td>
                            <td>
                                <textarea readonly="readonly">${recruit.rc_more}</textarea>
                            </td>
                        </tr>
                </table>
                <p></p>
            </c:forEach>
        </c:if>
    </div>


    <c:if test="${sessionScope.user==null}">
        <a href="recruitController/toPage?choose=empMain" id="toMain">返回首页</a>
    </c:if>
    <c:if test="${sessionScope.user.u_type==0}">
        <a href="recruitController/toPage?choose=userMain" id="toMain">返回首页</a>
    </c:if>
</body>
</html>

