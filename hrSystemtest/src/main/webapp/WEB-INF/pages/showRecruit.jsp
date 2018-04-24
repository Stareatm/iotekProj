<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/21
  Time: 18:22
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
    <c:if test="${recruitList.size()==0}">
        <div>
            对不起,没有相关的招聘信息!
        </div>
    </c:if>

    <c:if test="${recruitList.size()!=0}"><%--简历不为空--%>
        <div>
            相关招聘信息查询如下:
        </div>
        <table border="1" cellpadding="0" cellspacing="0">
            <tr>
                <th>职位名称</th>
                <th>公司名称</th>
                <th>职位月薪</th>
                <th>工作地点</th>
                <th>公司性质</th>
                <th>公司规模</th>
                <th>工作经验</th>
                <th>学历</th>
                <th>性别</th>
                <th>相关介绍</th>
                <c:if test="${sessionScope.user.u_type==2}"><%--管理员--%>
                    <th>修改招聘信息</th>
                    <th>删除招聘信息</th>
                </c:if>
            </tr>

            <c:if test="${sessionScope.user.u_type!=2}"><%--非管理员--%>
                <c:forEach items="${recruitList}" var="recruit">
                    <tr>
                        <td>${recruit.rc_job}</td>
                        <td>${recruit.rc_company}</td>
                        <td>${recruit.rc_sal}</td>
                        <td>${recruit.rc_location}</td>
                        <td>${recruit.rc_property}</td>
                        <td>${recruit.rc_scale}</td>
                        <td>${recruit.rc_expTime}</td>
                        <td>${recruit.rc_eduBG}</td>
                        <td>${recruit.rc_sex}</td>
                        <td>${recruit.rc_more}</td>
                    </tr>
                </c:forEach>
            </c:if>

            <c:if test="${sessionScope.user.u_type==2}"><%--管理员--%>
                <c:forEach items="${recruitList}" var="recruit">
                    <<form action="recruitController/updateRecruit">
                        <tr>
                            <td><input name="rc_job" type="text" value="${recruit.rc_job}"></td>
                            <td><input name="rc_company" type="text" value="${recruit.rc_company}"></td>
                            <td><input name="rc_sal" type="number" min="3000" step="500" value="${recruit.rc_sal}">元/月</td>
                            <td>
                                <select name="rc_location">
                                    <c:forEach items="${sessionScope.locationList}" var="location">
                                        <c:if test="${location.equals(recruit.rc_location)}"><%--选择的工作地址--%>
                                            <option value="${location}" selected="selected">${location}</option>
                                        </c:if>
                                        <c:if test="${!location.equals(recruit.rc_location)}"><%--待选择的工作地址--%>
                                            <option value="${location}">${location}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </td>
                            <td>
                                <select name="rc_property">
                                    <c:forEach items="${sessionScope.propertyList}" var="property">
                                        <c:if test="${property.equals(recruit.rc_property)}">
                                            <option value="${property}" selected="selected">${property}</option>
                                        </c:if>
                                        <c:if test="${!property.equals(recruit.rc_property)}">
                                            <option value="${property}">${property}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </td>
                            <td><input name="rc_scale" type="text" value="${recruit.rc_scale}"></td>
                            <td><input name="rc_expTime" type="text" value="${recruit.rc_expTime}"></td>
                            <td>
                                <select name="rc_eduBG">
                                    <c:forEach items="${sessionScope.eduBGList}" var="eduBG">
                                        <c:if test="${eduBG.equals(recruit.rc_eduBG)}">
                                            <option value="${eduBG}" selected="selected">${eduBG}</option>
                                        </c:if>
                                        <c:if test="${!eduBG.equals(recruit.rc_eduBG)}">
                                            <option value="${eduBG}">${eduBG}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </td>
                            <td>
                                <select name="rc_sex">
                                    <c:if test="${'男'.equals(recruit.rc_sex)}">
                                        <option value="${recruit.rc_sex}">${recruit.rc_sex}</option>
                                        <option value="女">女</option>
                                        <option value="男女不限">男女不限</option>
                                    </c:if>
                                    <c:if test="${'女'.equals(recruit.rc_sex)}">
                                        <option value="${recruit.rc_sex}">${recruit.rc_sex}</option>
                                        <option value="男">男</option>
                                        <option value="男女不限">男女不限</option>
                                    </c:if>
                                    <c:if test="${'男女不限'.equals(recruit.rc_sex)}">
                                        <option value="${recruit.rc_sex}">${recruit.rc_sex}</option>
                                        <option value="男">男</option>
                                        <option value="女">女</option>
                                    </c:if>
                                </select>
                            </td>
                            <td>
                                <textarea name="rc_more">${recruit.rc_more}</textarea>
                            </td>
                        </tr>
                        <td>
                            <input type="submit" value="修改">
                        </td>
                    </form>
                    <td>
                        <form action="recruitController/deleteRecruit">
                            <input type="hidden" value="rc_id">
                            <input type="submit" value="删除">
                        </form>
                    </td>
                </c:forEach>
            </c:if>
        </table>
    </c:if>

    <c:if test="${sessionScope.user.u_type==2}">
        <a href="recruitController/toPage?choose='addRecruit'">添加招聘</a>
        <a href="recruitController/toPage?choose='adminMain'">返回主菜单</a>
    </c:if>
    <c:if test="${sessionScope.user.u_type==1}">
        <a href="recruitController/toPage?choose='empMain'">返回主菜单</a>
    </c:if>
    <c:if test="${sessionScope.user.u_type==0}">
        <a href="recruitController/toPage?choose='userMain'">返回主菜单</a>
    </c:if>

</body>
</html>

