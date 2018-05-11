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
    <div class="content">
        <table border="1" cellpadding="0" cellspacing="0">
            <form action="interviewController/addInterview" method="post">
                <tr>
                    <th>应聘者姓名</th>
                    <td>
                        <input name="rs_name" type="text" readonly="readonly" value="${resume.rs_name}">
                    </td>
                    <th>应聘者手机号</th>
                    <td>
                        <input name="rs_phone" type="text" readonly="readonly" value="${resume.rs_phone}">
                    </td>
                </tr>
                <tr>
                    <th>应聘的部门</th>
                    <td>
                        <select name="d_name" id="d_name" required="required">
                            <c:forEach items="${deptList}" var="dept">
                                <option value="${dept.d_name}">${dept.d_name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <th>应聘的职位</th>
                    <td>
                        <select name="j_name" id="j_name" required="required">
                            <c:forEach items="${jobList}" var="job">
                                <option value="${job.j_name}">${job.j_name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>面试时间</th>
                    <td>
                        <input name="iTime" type="datetime-local" required="required">
                    </td>
                    <th>面试地址</th>
                    <td>
                        <input name="i_addr" type="text" required="required">
                    </td>
                </tr>
                <tr>
                    <th colspan="2">发送邀请</th>
                    <td colspan="2">
                        <input type="hidden" name="rs_id" value="${resume.rs_id}">
                        <input type="submit" value="发送">
                    </td>
                </tr>
            </form>
        </table>
    </div>
    <a href="resumeController/showReadedResume" id="toReadedResume">返回已读简历</a>
    <a href="interviewController/toPage?choose=adminMain" id="toMain">返回主菜单</a>
</body>
</html>

