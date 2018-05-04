<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/23
  Time: 0:01
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
    <title>showReadedResume</title>
</head>
<body>
    <c:if test="${resumeList.size()==0}">
        <div>
            对不起,没有相关已读的简历!
        </div>
    </c:if>
    <c:if test="${resumeList.size()!=0}">
        <table border="1" cellspacing="0" cellpadding="0">
            <tr>
                <th>姓名</th>
                <th>性别</th>
                <th>身份证号</th>
                <th>出生日期</th>
                <th>户籍地址</th>
                <th>居住地址</th>
                <th>工作年限</th>
                <th>联系电话</th>
                <th>Email</th>
                <th>期望职位</th>
                <th>期望工作地点</th>
                <th>期望薪资</th>
                <th>工作经历</th>
                <th>面试邀请</th>
            </tr>
            <c:forEach items="${resumeList}" var="resume">
                <tr>
                    <td>
                        <input type="text" value="${resume.rs_name}" readonly="readonly">
                    </td>
                    <td>
                        <input type="text" value="${resume.rs_sex}" readonly="readonly">
                    </td>
                    <td>
                        <input type="text" value="${resume.rs_IDNumber}" readonly="readonly">
                    </td>
                    <td>
                        <fmt:formatDate value="${resume.rs_birthday}" pattern="yyyy-MM-dd" type="date" var="birthday"/>
                        <input type="date" value="${birthday}" readonly="readonly">
                    </td>
                    <td>
                        <input type="text" value="${resume.rs_IDNumber}" readonly="readonly">    ${resume.rs_residence}
                    </td>
                    <td>
                        <input type="text" value="${resume.rs_addr}" readonly="readonly">
                    </td>
                    <td>
                        <input type="text" value="${resume.rs_expTime}" readonly="readonly">
                    </td>
                    <td>
                        <input type="text" value="${resume.rs_phone}" readonly="readonly">
                    </td>
                    <td>
                        <input type="text" value="${resume.rs_email}" readonly="readonly">
                    </td>
                    <td>
                        <input type="text" value="${resume.rs_desiredPosition}" readonly="readonly">
                    </td>
                    <td>
                        <input type="text" value="${resume.rs_desiredLocation}" readonly="readonly">
                    </td>
                    <td>
                        <input type="text" value=" ${resume.rs_expectedSal}" readonly="readonly">元/月
                    </td>
                    <td>
                        <textarea name="rs_careerExp" readonly="readonly">
                                ${resume.rs_careerExp}</textarea>
                    </td>
                    <td>
                        <c:if test="${null!=resume.interview}">
                            <c:if test="${resume.interview.i_status==0}">
                                已发送
                            </c:if>
                            <c:if test="${resume.interview.i_status==1}">
                                已接受面试
                            </c:if>
                        </c:if>
                        <c:if test="${null==resume.interview}">
                            <form action="interviewController/toAddInterview">
                                <input type="hidden" name="rs_id" value="${resume.rs_id}">
                                <input type="submit" value="发送邀请">
                            </form>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <a href="recruitController/toPage?choose=adminMain">返回主界面</a>
</body>
</html>

