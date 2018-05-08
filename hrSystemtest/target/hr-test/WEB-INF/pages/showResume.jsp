<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
    <title>showResume</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/toMain.css">
    <link rel="stylesheet" type="text/css" href="../../css/showUserInfo.css">
    <style type="text/css">
        .send{
            width: 100px;
        }
        .send1{
            width: 100px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="content">
        <c:if test="${resumeList.size()==0}">
            <div>
                对不起,没有相关的简历!
            </div>
        </c:if>
        <c:if test="${resumeList.size()!=0}">
            <table border="1" cellspacing="0" cellpadding="0">

                <c:forEach items="${resumeList}" var="resume">
                    <tr>
                        <th colspan="16">简历</th>
                    </tr>
                    <form action="resumeController/updateResume">
                        <tr>
                            <th>姓名</th>
                            <td>
                                <input name="rs_name" type="text" value="${resume.rs_name}" required="required">
                            </td>
                            <th>性别</th>
                            <td>
                                <select name="rs_sex" required="required">
                                    <option value="${resume.rs_sex}" selected="selected">${resume.rs_sex}</option>
                                    <c:if test="${'男'.equals(resume.rs_sex)}">
                                        <option value="女">女</option>
                                    </c:if>
                                    <c:if test="${'女'.equals(resume.rs_sex)}">
                                        <option value="男">男</option>
                                    </c:if>
                                </select>
                            </td>
                            <th>身份证号</th>
                            <td>
                                <input name="rs_IDNumber" type="text" value="${resume.rs_IDNumber}" required="required">
                            </td>
                        </tr>
                        <tr>
                            <th>出生日期</th>
                            <td>
                                <fmt:formatDate value="${resume.rs_birthday}" pattern="yyyy-MM-dd" var="birthday"/>
                                <input type="date" name="birthday" value="${birthday}" required="required">
                            </td>
                            <th>户籍地址</th>
                            <td>
                                <input type="text" name="rs_residence" value="${resume.rs_residence}" required="required">
                            </td>
                            <th>居住地址</th>
                            <td>
                                <input type="text" name="rs_addr" value="${resume.rs_addr}" required="required">
                            </td>
                        </tr>
                        <tr>
                            <th>工作年限</th>
                            <td>
                                <input type="text" name="rs_expTime" value="${resume.rs_expTime}" required="required">
                            </td>
                            <th>联系电话</th>
                            <td>
                                <input type="text" name="rs_phone" value="${resume.rs_phone}" required="required">
                            </td>
                            <th>Email</th>
                            <td>
                                <input type="text" name="rs_email" value="${resume.rs_email}" required="required">
                            </td>
                        </tr>
                        <tr>
                            <th>期望职位</th>
                            <td>
                                <input type="text" name="rs_desiredPosition" value="${resume.rs_desiredPosition}" required="required">
                            </td>
                            <th>期望工作地点</th>
                            <td>
                                <input type="text" name="rs_desiredLocation" value="${resume.rs_desiredLocation}" required="required">
                            </td>
                            <th>期望薪资</th>
                            <td>
                                <input type="number" name="rs_expectedSal" step="500" value="${resume.rs_expectedSal}" required="required">元/月
                            </td>
                        </tr>
                        <tr>
                            <th>工作经历</th>
                            <td>
                                <textarea name="rs_careerExp" required="required">${resume.rs_careerExp}</textarea>
                            </td>
                            <th>修改简历</th>
                            <td>
                                <c:if test="${resume.rs_status==-1}">
                                    <input type="hidden" name="rs_status" value="-1">
                                    <input type="hidden" name="rs_id" value="${resume.rs_id}">
                                    <input type="submit" value="修改">
                                </c:if>
                                <c:if test="${resume.rs_status>-1}">
                                    <input type="text" value="已发送,无法修改!" readonly="readonly">
                                </c:if>
                            </td>
                        </tr>
                    </form>
                    <tr>
                        <th>删除简历</th>
                        <td>
                            <c:if test="${resume.rs_status==-1}">
                                <form action="resumeController/deleteResume">
                                    <input type="hidden" name="rs_id" value="${resume.rs_id}">
                                    <input type="submit" value="删除">
                                </form>
                            </c:if>
                            <c:if test="${resume.rs_status>-1}">
                                <input type="text" value="已发送,无法删除!" readonly="readonly">
                            </c:if>
                        </td>
                        <th> <div class="send">发送简历</div></th>
                        <td>
                            <div class="send1">
                                <c:if test="${resume.rs_status==-1}"><%--未发送--%>
                                    <form action="resumeController/sendResume">
                                        <input type="hidden" name="rs_id" value="${resume.rs_id}">
                                        <input type="submit" value="发送">
                                    </form>
                                </c:if>
                                <c:if test="${resume.rs_status>=-1}"><%--已发送--%>
                                    <input type="text" value="该简历已发送过" readonly="readonly">
                                </c:if>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        <p></p>
        <a href="recruitController/toPage?choose=addResume">添加简历</a>
    </div>
    <a href="recruitController/toPage?choose=userMain" id="toMain">返回主菜单</a>
</body>
</html>

