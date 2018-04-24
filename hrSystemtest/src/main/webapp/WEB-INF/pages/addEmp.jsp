<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/23
  Time: 16:31
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
    <script src="../../js/jquery-3.1.0.js"></script>
    <script>
        $(function () {
            function findJob() {
                var d_name=$("#d_name").attr("val");
                $.ajax({
                    url:"empController/findJob",
                    type:"post",
                    data:{d_name:d_name},
                    success:function(obj){/*obj是返回的jobList*/
                        $("#j_name option").remove();
                        if (obj.length!=0) {
                            for ( var i=0; i<=obj.length; i++) {
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
            }
        })
    </script>
</head>
<body>
    <table border="1" cellpadding="0" cellspacing="0">
        <tr>
            <th>员工姓名</th>
            <th>员工性别</th>
            <th>身份证号</th>
            <th>联系方式</th>
            <th>生日</th>
            <th>邮箱</th>
            <th>地址</th>
            <th>部门</th>
            <th>职位</th>
            <th>入职日期</th>
            <th>基本薪资</th>
            <th>入职</th>
        </tr>
        <tr>
            <form action="empController/addEmp">
                <td>
                    <input name="e_name" type="text" value="${resume.rs_name}" readonly="readonly">
                </td>
                <td>
                    <input name="e_sex" type="text" value="${resume.rs_sex}" readonly="readonly">
                </td>
                <td>
                    <input name="e_IDNumber" type="text" value="${resume.rs_IDNumber}" readonly="readonly">
                </td>
                <td>
                    <input name="e_phone" type="text" value="${resume.rs_phone}" readonly="readonly">
                </td>
                <td>
                    <input name="e_birthday" type="date" value="${resume.rs_birthday}" readonly="readonly">
                </td>
                <td>
                    <input name="e_email" type="text" value="${resume.rs_email}" readonly="readonly">
                </td>
                <td>
                    <input name="e_addr" type="text" value="${resume.rs_addr}" readonly="readonly">
                </td>
                <td>
                    <select name="d_name" id="d_name" onchange="findJob()">
                        <%--<option value="请选择">请选择</option>--%>
                        <c:forEach items="${deptList}" var="dept">
                            <option value="${dept.d_name}">${dept.d_name}</option>
                    </c:forEach>
                    </select>
                </td>
                <td>
                    <select name="j_name" id="j_name">
                        <c:forEach items="${jobList}" var="job">
                            <option value="${job.j_name}">${job.j_name}</option>
                        </c:forEach>
                    </select>
                </td>
                <td><input name="e_hireDate" type="date"></td>
                <td><input name="e_baseSal" type="number" min="3000" step="500" value="3000">元/月</td>
                <td>
                    <input type="submit" value="入职">
                </td>
            </form>
        </tr>
    </table>
</body>
</html>

