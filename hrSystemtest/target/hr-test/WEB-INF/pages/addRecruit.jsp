<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/22
  Time: 15:34
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
    <title>addRecruit</title>
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
    <table border="1" cellpadding="0" cellspacing="0">
        <tr>
            <th>部门名称</th>
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
            <th>添加招聘信息</th>
        </tr>
        <tr>
            <form action="recruitController/addRecruit">
                <td>
                    <select name="d_name" id="d_name">
                        <c:forEach items="${deptList}" var="dept">
                            <option value="${dept.d_name}">${dept.d_name}</option>
                        </c:forEach>
                    </select>
                </td>
                <td>
                    <select name="j_name" id="j_name">
                        <%--<c:if test="${jobList.size()==0}">
                            <option>无,请先添加岗位</option>
                        </c:if>
                        <c:if test="${jobList.size()!=0}">
                            <c:forEach items="${jobList}" var="job">
                                <option value="${job.j_name}">${job.j_name}</option>
                            </c:forEach>
                        </c:if>--%>
                            <c:forEach items="${jobList}" var="job">
                                <option value="${job.j_name}">${job.j_name}</option>
                            </c:forEach>
                    </select>
                </td>
                <td><input name="rc_company" type="text"></td>
                <td><input name="rc_sal" type="number" value="3000" min="3000" step="100">元/月</td>
                <td>
                    <select name="rc_location">
                        <c:forEach items="${sessionScope.locationList}" var="location">
                           <option value="${location}">${location}</option>
                        </c:forEach>
                    </select>
                </td>
                <td>
                    <select name="rc_property">
                        <c:forEach items="${sessionScope.propertyList}" var="property">
                            <option value="${property}">${property}</option>
                        </c:forEach>
                    </select>
                </td>
                <td><input name="rc_scale" type="text"></td>
                <td><input name="rc_expTime" type="text"></td>
                <td>
                    <select name="rc_eduBG">
                        <c:forEach items="${sessionScope.eduBGList}" var="eduBG">
                           <option value="${eduBG}">${eduBG}</option>
                        </c:forEach>
                    </select>
                </td>
                <td>
                    <select name="rc_sex">
                        <option value="男">男</option>
                        <option value="女">女</option>
                        <option value="男女不限">男女不限</option>
                    </select>
                </td>
                <td>
                    <textarea name="rc_more"></textarea>
                </td>
                <td>
                    <input name="rc_status" type="hidden" value="0">
                    <input type="submit" value="添加">
                </td>
            </form>
        </tr>
    </table>
    <a href="recruitController/toPage?choose=adminMain">返回>>主界面</a>
</body>
</html>

