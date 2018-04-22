<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/22
  Time: 19:47
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
                <th>修改简历</th>
                <th>删除简历</th>
                <th>发送简历</th>
            </tr>
            <c:forEach items="${resumeList}" var="resume">
                <tr>
                    <form action="resumeController/updateResume">
                        <td><input name="rs_name" type="text" value="${resume.rs_name}"></td>
                        <td>
                            <select name="rs_sex">
                                <option value="${resume.rs_sex}" selected="selected">${resume.rs_sex}</option>
                                <c:if test="${'男'.equals(resume.rs_sex)}">
                                    <option value="女">女</option>
                                </c:if>
                                <c:if test="${'女'.equals(resume.rs_sex)}">
                                    <option value="男">男</option>
                                </c:if>
                            </select>
                        </td>
                        <td><input name="rs_IDNumber" type="text" value="${resume.rs_IDNumber}"></td>
                        <td><input type="date" name="rs_birthday" value="${resume.rs_birthday}"></td>
                        <td><input type="text" name="rs_residence" value="${resume.rs_residence}"></td>
                        <td><input type="text" name="addr" value="${resume.rs_addr}"></td>
                        <td><input type="number" name="rs_expTime" min="0" value="${resume.rs_expTime}">年</td>
                        <td><input type="text" name="rs_phone" value="${resume.rs_phone}"></td>
                        <td><input type="text" name="rs_email" value="${resume.rs_email}"></td>
                        <td><input type="text" name="rs_desiredPosition" value="${resume.rs_desiredPosition}"></td>
                        <td><input type="text" name="rs_desiredLocation" value="${resume.rs_desiredLocation}"></td>
                        <td><input type="number" name="rs_expectedSal" step="500" value="${resume.rs_expectedSal}">元/月</td>
                        <td><textarea name="rs_careerExp">${resume.rs_careerExp}</textarea></td>
                        <td>
                            <input type="hidden" name="rs_status" value="-1">
                            <input type="submit" value="修改">
                        </td>
                    </form>
                    <td>
                        <form action="resumeController/deleteResume">
                            <input type="hidden" name="rs_id" value="${resume.rs_id}">
                            <input type="submit" value="删除">
                        </form>
                    </td>
                    <td>
                        <c:if test="${resume.rs_status==-1}"><%--未发送--%>
                            <form action="resumeController/sendResume">
                                <input type="hidden" name="rs_id" value="${resume.rs_id}">
                                <input type="submit" value="发送">
                            </form>
                        </c:if>
                        <c:if test="${resume.rs_status!=-1}"><%--已发送--%>
                            该简历已发送过
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <a href="recruitController/toPage?choose='addResume'">添加简历</a>
    <a href="recruitController/toPage?choose'userMain'">返回主菜单</a>
</body>
</html>

