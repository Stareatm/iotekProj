<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
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
    <title></title>
</head>
<body>
    <c:if test="${resumeList.size()==0}">
        <div>
            对不起,没有相关的简历!
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
                    <td>${resume.rs_name}</td>
                    <td>
                            ${resume.rs_sex}
                    </td>
                    <td>${resume.rs_IDNumber}</td>
                    <td>
                        <fmt:formatDate value="${resume.rs_birthday}" pattern="YYYY-MM-DD HH24:MM:SS"/>
                    </td>
                    <td>${resume.rs_residence}</td>
                    <td>${resume.rs_addr}</td>
                    <td>${resume.rs_expTime}年</td>
                    <td>${resume.rs_phone}</td>
                    <td>${resume.rs_email}</td>
                    <td>${resume.rs_desiredPosition}</td>
                    <td>${resume.rs_desiredLocation}</td>
                    <td>${resume.rs_expectedSal}元/月</td>
                    <td><textarea name="rs_careerExp" readonly="readonly">${resume.rs_careerExp}</textarea></td>
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
    <a href="recruitController/toPage?choose='adminMain'">返回主界面</a>
</body>
</html>

