<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/22
  Time: 23:44
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
    <title>showUnReadResume</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/toMain.css">
    <link rel="stylesheet" type="text/css" href="../../css/showUserInfo.css">
</head>
<body>
    <div class="content">
        <c:if test="${resumeList.size()==0}">
            <div>
                对不起,没有未读的简历!
            </div>
        </c:if>
        <c:if test="${resumeList.size()!=0}">
            <c:forEach items="${resumeList}" var="resume" varStatus="status">
                <table border="1" cellspacing="0" cellpadding="0" >
                    <tr>
                        <th colspan="3">未读简历信息${status.index+1}</th>
                    </tr>
                    <tr>
                        <th>姓名</th>
                        <td>
                            <input value="${resume.rs_name}" readonly="readonly">
                        </td>
                        <th>性别</th>
                        <td>
                            <input value="${resume.rs_sex}" readonly="readonly">
                        </td>
                        <th>身份证号</th>
                        <td>
                            <input value="${resume.rs_IDNumber}" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <th>出生日期</th>
                        <td>
                            <fmt:formatDate value="${resume.rs_birthday}" type="date" pattern="yyyy-MM-dd" var="birthday"/>
                            <input type="date" value="${birthday}" readonly="readonly">
                        </td>
                        <th>户籍地址</th>
                        <td>
                            <input value="${resume.rs_residence}" readonly="readonly">
                        </td>
                        <th>居住地址</th>
                        <td>
                            <input value="${resume.rs_addr}" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <th>工作年限</th>
                        <td>
                            <input value="${resume.rs_expTime}" readonly="readonly">
                        </td>
                        <th>联系电话</th>
                        <td>
                            <input value="${resume.rs_phone}" readonly="readonly">
                        </td>
                        <th>Email</th>
                        <td>
                            <input value="${resume.rs_email}" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <th>期望职位</th>
                        <td>
                            <input value="${resume.rs_desiredPosition}" readonly="readonly">
                        </td>
                        <th>期望工作地点</th>
                        <td>
                            <input value="${resume.rs_desiredLocation}" readonly="readonly">
                        </td>
                        <th>期望薪资</th>
                        <td>
                            <input type="number" value="${resume.rs_expectedSal}" readonly="readonly">元/月
                        </td>
                    </tr>
                    <tr>
                        <th>工作经历</th>
                        <td>
                            <textarea name="rs_careerExp" readonly="readonly">${resume.rs_careerExp}</textarea>
                        </td>
                        <th>标记简历</th>
                        <td>
                            <form action="resumeController/markResume">
                                <input type="hidden" name="rs_id" value="${resume.rs_id}">
                                <input type="submit" value="标为已读">
                            </form>
                        </td>
                    </tr>
                </table>
                <p></p>
            </c:forEach>
        </c:if>
    </div>
    <a href="recruitController/toPage?choose=adminMain" id="toMain">返回主界面</a>
</body>
</html>

