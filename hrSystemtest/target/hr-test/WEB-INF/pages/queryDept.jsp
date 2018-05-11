<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/5/9
  Time: 0:57
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
    <title>queryDept</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/toMain.css">
    <link rel="stylesheet" type="text/css" href="../../css/showUserInfo.css">
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <style type="text/css" >
        .empTH{
            width: 185px;
        }
    </style>
    <script>
        $(function () {
            $("#selectedDept").change(function () {
                $.ajax({
                    type:"post",
                    url:"empController/findJob",
                    data:{"d_name":$("#selectedDept").val()},
                    success:function(obj) {
                        $("#selectedJob").empty();
                        if (obj.length != 0) {
                            for (var i = 0; i < obj.length; i++) {
                                var j_name = obj[i].j_name;
                                $("#selectedJob").append(
                                    "<option value=" + j_name + ">"
                                    + j_name + "</option>");
                            }
                        } else {
                            alert("该部门没有对应岗位!");
                            $("#selectedJob").append(
                                "<option >无</option>");
                        }
                    }
                });
            });
            $("#button").click(function () {
                $.ajax({
                    type:"post",
                    url:"empController/showEmpAJAX",
                    data:{"d_name":$("#selectedDept").val(),"j_name":$("#selectedJob").val()},
                    success:function (obj) {
                        $("#empTable").empty();
                        if (obj.length!=0){
                            for(var i=0;i<obj.length;i++){
                                var eName=obj[i].e_name;
                                var eId=obj[i].e_id;
                                $("#empTable").append("<tr><th class='empTH'><a href='empController/queryEmpBaseInfo?e_id="+eId+"'>"+eName+"<a></th></tr>");
                            }
                        }else {
                            $("#empTr").append("该职位下暂时还没有员工!");
                        }
                    }
                })
            })
        })
    </script>
</head>
<body>
    <div class="content">
        <table border="1" cellspacing="0" cellpadding="0">
            <tr>
                <th>部门</th>
                <td>
                    <select name="d_name" id="selectedDept" required="required">
                        <c:forEach items="${deptList}" var="dept">
                            <option value="${dept.d_name}">${dept.d_name}</option>
                        </c:forEach>
                    </select>
                </td>
                <th>职位</th>
                <td>
                    <select name="j_name" id="selectedJob" required="required">
                        <c:forEach items="${jobList}" var="job">
                            <option value="${job.j_name}">${job.j_name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th colspan="4">
                    <input type="button" id="button" value="显示职位人员信息">
                </th>
            </tr>
        </table>
        <table id="empTable" border="1" cellspacing="0" cellpadding="0">

        </table>

    </div>
    <a href="empController/toPage?choose=empMain">返回主页</a>
</body>
</html>

