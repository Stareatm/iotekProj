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
    <title>showRecruit</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/toMain.css">
    <link rel="stylesheet" type="text/css" href="../../css/showUserInfo.css">
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script>
        $(function () {
            $("#d_name").change(function () {
                $.ajax({
                    type:"post",
                    url:"empController/findJob",
                    data:{"d_name":$("#d_name").val()},
                    success:function(obj){/*obj是返回的jobList*/
                        $("#j_name").empty();
                        if (obj.length!=0) {
                            for ( var i=0; i<obj.length; i++) {
                                var j_name = obj[i].j_name;
                                $("#j_name").append(
                                    "<option value="+j_name+">"
                                    + j_name + "</option>");
                            }
                        }else {
                            alert("该部门没有对应岗位!");
                        }
                    }
                })
            })
        })
    </script>
</head>
<body>
    <div class="content">
        <c:if test="${recruitList.size()==0}">
            <div>
                对不起,没有相关的招聘信息!
            </div>
        </c:if>
        <c:if test="${recruitList.size()!=0}"><%--简历不为空--%>
            <c:forEach items="${recruitList}" var="recruit" varStatus="status">
                <table border="1" cellpadding="0" cellspacing="0">
                    <tr>
                        <th colspan="6">招聘信息${status.index+1}</th>
                    </tr>
                    <c:if test="${recruit.rc_status==1}">
                        <tr>
                            <th>部门名称</th>
                            <td>
                                <input type="text" value="${recruit.d_name}" readonly="readonly">
                            </td>
                            <th>职位名称</th>
                            <td>
                                <input type="text" value="${recruit.j_name}" readonly="readonly">
                            </td>
                            <th>公司名称</th>
                            <td>
                                <input type="text" value="${recruit.rc_company}" readonly="readonly">
                            </td>
                        </tr>
                        <tr>
                            <th>职位月薪</th>
                            <td>
                                <input type="number" value="${recruit.rc_sal}" readonly="readonly">元
                            </td>
                            <th>工作地点</th>
                            <td>
                                <input type="text" value="${recruit.rc_location}" readonly="readonly">
                            </td>
                            <th>公司性质</th>
                            <td>
                                <input type="text" value="${recruit.rc_property}" readonly="readonly">
                            </td>
                        </tr>
                        <tr>
                            <th>公司规模</th>
                            <td>
                                <input type="text" value="${recruit.rc_scale}" readonly="readonly">
                            </td>
                            <th>工作经验</th>
                            <td>
                                <input type="text" value="${recruit.rc_expTime}" readonly="readonly">
                            </td>
                            <th>学历</th>
                            <td>
                                <input type="text" value="${recruit.rc_eduBG}" readonly="readonly">
                            </td>
                        </tr>
                        <tr>
                            <th>性别</th>
                            <td>
                                <input type="text" value="${recruit.rc_sex}" readonly="readonly">
                            </td>
                            <th>相关介绍</th>
                            <td>
                                <input type="text" value="${recruit.rc_more}" readonly="readonly">
                            </td>
                            <th>状态</th>
                            <td>
                                <input type="text" value="已发布" readonly="readonly">
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${recruit.rc_status==0}"><%--可修改,删除--%>
                        <form action="recruitController/updateRecruit" method="post">
                            <tr>
                                <th>部门名称</th>
                                <td>
                                    <select name="d_name" id="d_name">
                                        <option value="${recruit.d_name}" selected="selected">${recruit.d_name}</option>
                                        <c:forEach items="${deptList}" var="dept">
                                            <c:if test="${!recruit.d_name.equals(dept.d_name)}">
                                                <option value="${dept.d_name}">${dept.d_name}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </td>
                                <th>职位名称</th>
                                <td>
                                    <select name="j_name" id="j_name">
                                        <option value="${recruit.j_name}" selected="selected">${recruit.j_name}</option>

                                    </select>
                                </td>
                                <th>公司名称</th>
                                <td>
                                    <input name="rc_company" type="text" value="${recruit.rc_company}" required="required">
                                </td>
                            </tr>
                            <tr>
                                <th>职位月薪</th>
                                <td>
                                    <input name="rc_sal" type="number" min="3000" step="100" value="${recruit.rc_sal}" required="required">元/月
                                </td>
                                <th>工作地点</th>
                                <td>
                                    <select name="rc_location" required="required">
                                        <option value="${recruit.rc_location}" selected="selected">${recruit.rc_location}</option>
                                        <c:forEach items="${sessionScope.locationList}" var="location">
                                            <c:if test="${!location.equals(recruit.rc_location)}"><%--待选择的工作地址--%>
                                                <option value="${location}">${location}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </td>
                                <th>公司性质</th>
                                <td>
                                    <select name="rc_property" required="required">
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
                            </tr>
                            <tr>
                                <th>公司规模</th>
                                <td>
                                    <input name="rc_scale" type="text" value="${recruit.rc_scale}" required="required">
                                </td>
                                <th>工作经验</th>
                                <td>
                                    <input name="rc_expTime" type="text" value="${recruit.rc_expTime}" required="required">
                                </td>
                                <th>学历</th>
                                <td>
                                    <select name="rc_eduBG" required="required">
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
                            </tr>
                            <tr>
                                <th>性别</th>
                                <td>
                                    <select name="rc_sex" required="required">
                                        <option value="${recruit.rc_sex}">${recruit.rc_sex}</option>
                                        <c:if test="${'男'.equals(recruit.rc_sex)}">
                                            <option value="女">女</option>
                                            <option value="男女不限">男女不限</option>
                                        </c:if>
                                        <c:if test="${'女'.equals(recruit.rc_sex)}">
                                            <option value="男">男</option>
                                            <option value="男女不限">男女不限</option>
                                        </c:if>
                                        <c:if test="${'男女不限'.equals(recruit.rc_sex)}">>
                                            <option value="男">男</option>
                                            <option value="女">女</option>
                                        </c:if>
                                    </select>
                                </td>
                                <th>相关介绍</th>
                                <td>
                                    <textarea name="rc_more" required="required">${recruit.rc_more}</textarea>
                                </td>
                                <th>状态</th>
                                <td>
                                    <select name="rc_status" required="required">
                                        <option value="${recruit.rc_status}" selected="selected">未发布</option>
                                        <option value="1">发布</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>修改</th>
                                <td>
                                    <input type="hidden" name="rc_id" value="${recruit.rc_id}" >
                                    <input type="submit" value="修改">
                                </td>
                            </tr>
                        </form>
                        <tr>
                            <td>
                                <form action="recruitController/deleteRecruit" method="post">
                                    <input type="hidden" name="rc_id" value="${recruit.rc_id}" >
                                    <input type="submit" value="删除">
                                </form>
                            </td>
                        </tr>
                    </c:if>
                </table>
                <p></p>
            </c:forEach>
        </c:if>
        <a href="recruitController/toPage?choose=addRecruit">添加招聘</a><br>
    </div>

    <a href="recruitController/toPage?choose=adminMain" id="toMain">返回主菜单</a>
</body>
</html>

