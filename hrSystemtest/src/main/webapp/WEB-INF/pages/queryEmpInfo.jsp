<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/27
  Time: 14:35
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
                            $("#j_name").append(
                                "<option >无</option>");
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
            <th>员工姓名</th>
            <th>员工性别</th>
            <th>联系方式</th>
            <th>生日</th>
            <th>邮箱</th>
            <th>地址</th>
            <th>入职日期</th>
        </tr>
        <tr>
            <td>
                <input name="e_name" type="text" value="${emp.e_name}" readonly="readonly">
            </td>
            <td>
                <input name="e_sex" type="text" value="${emp.e_sex}" readonly="readonly">
            </td>
            <td>
                <input name="e_phone" type="text" value="${emp.e_phone}" readonly="readonly">
            </td>
            <td>
                <fmt:formatDate value="${emp.e_birthday}" pattern="yyyy-MM-dd" var="birthday"/>
                <input name="eBirthday" type="date" value="${birthday}" readonly="readonly">
            </td>
            <td>
                <input name="e_email" type="text" value="${emp.e_email}" readonly="readonly">
            </td>
            <td>
                <input name="e_addr" type="text" value="${emp.e_addr}" readonly="readonly">
            </td>
            <td>
                <fmt:formatDate value="${emp.e_hireDate}" pattern="yyyy-MM-dd" var="hireDate"/>
                <input name="eHireDate" type="date" value="${hireDate}" readonly="readonly"></td>
        </tr>
        <tr>
            <th>部门</th>
            <th>职位</th>
            <th>基本薪资</th>
            <th>员工状态</th>
            <c:if test="${emp.e_status==0}">
                <th>转正</th>
                <th>离职</th>
            </c:if>
            <c:if test="${emp.e_status==1}">
                <th>离职</th>
            </c:if>
        </tr>
        <tr>
            <form action="empController/changeEmpJob">
                <td>
                    <select name="d_name" id="d_name">
                        <option value="${emp.job.dept.d_name}" selected="selected">${emp.job.dept.d_name}</option>
                        <c:forEach items="${deptList}" var="dept">
                            <c:if test="${!emp.job.dept.d_name.equals(dept.d_name)}">
                                <option value="${dept.d_name}">${dept.d_name}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </td>
                <td>
                    <select name="j_name" id="j_name">
                        <option value="${emp.job.j_name}" selected="selected">${emp.job.j_name}</option>
                        <c:forEach items="${jobList}" var="job">
                            <c:if test="${!emp.job.j_name.equals(job.j_name)}">
                                <option value="${job.j_name}">${job.j_name}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                    <input type="hidden" name="e_id" value="${emp.e_id}">
                    <input type="submit" value="换岗">
                </td>
            </form>
            <td>
                <input name="e_baseSal" type="number" value="${emp.e_baseSal}" readonly="readonly">元/月
            </td>

            <td>
                <c:if test="${emp.e_status==0}">
                    <div>试用期员工</div>
                </c:if>
                <c:if test="${emp.e_status==1}">
                    <div><a href="empStatusController/showEmpStatus?e_id=${emp.e_id}">正式员工</a></div>
                </c:if>
                <c:if test="${emp.e_status==2}">
                    <div><a href="empStatusController/showEmpStatus">已离职员工</a></div>
                </c:if>
            </td>

            <c:if test="${emp.e_status==0}">
                <td>
                    <form action="empStatusController/toRegular">
                        <input type="hidden" name="e_id" value="${emp.e_id}">
                        <input type="submit" value="转正处理">
                    </form>
                </td>
                <td>
                    <form action="empStatusController/toLeave">
                        <input type="hidden" name="e_id" value="${emp.e_id}">
                        <input type="submit" value="离职处理">
                    </form>
                </td>
            </c:if>
            <c:if test="${emp.e_status==1}">
                <td>
                    <form action="empStatusController/toLeave">
                        <input type="hidden" name="e_id" value="${emp.e_id}">
                        <input type="submit" value="离职处理">
                    </form>
                </td>
            </c:if>
        </tr>
    </table>
    <a href="empController/toPage?choose=adminMain">返回>>主菜单</a>

</body>
</html>

