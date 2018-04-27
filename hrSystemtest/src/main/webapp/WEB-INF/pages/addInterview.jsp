<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/23
  Time: 11:20
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
    <title>addInterview</title>
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
    <table>
        <tr>
            <th>应聘者姓名</th>
            <th>应聘者手机号</th>
            <th>应聘的部门</th>
            <th>应聘的职位</th>
            <th>面试时间</th>
            <th>面试地址</th>
            <th>发送邀请</th>
        </tr>
        <tr>
            <form action="interviewController/addInterview">
                <td><input name="rs_name" type="text" readonly="readonly" value="${resume.rs_name}"></td>
                <td><input name="rs_phone" type="text" readonly="readonly" value="${resume.rs_phone}"></td>
                <td>
                    <select name="d_name" id="d_name">
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
                <td>
                    <input name="iTime" type="datetime-local">
                </td>
                <td>
                    <input name="i_addr" type="text">
                </td>
                <td>
                    <input type="hidden" name="rs_id" value="${resume.rs_id}">
                    <input type="submit" value="发送">
                </td>
            </form>
        </tr>
    </table>
    <a href="resumeController/showReadedResume">返回>>已读简历</a>
    <a href="interviewController/toPage?choose=adminMain">返回>>主菜单</a>
</body>
</html>

