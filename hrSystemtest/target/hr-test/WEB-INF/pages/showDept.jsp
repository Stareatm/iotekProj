<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/24
  Time: 15:25
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
    <title>showDept</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/toMain.css">
    <link rel="stylesheet" type="text/css" href="../../css/showUserInfo.css">

    <style type="text/css">
        .plus1,.plus2 {
            width: 20px;
            height: 20px;
            background: #535dff;
            color: aqua;
            text-align: center;
            line-height: 20px;
        }
        .minus1,.minus2 {
            width: 20px;
            height: 20px;
            background: #ff130e;
            color: aqua;
            text-align: center;
            line-height: 20px;
        }
        .dName,.j_id{
            display: none;
        }
        li{
            margin-left: 1.5em;
        }
        th,td{
            width: 150px;
        }
    </style>
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script>
        $(function () {
            $(".plus1").click(function () {
                var div1=$(this).next();
                var addDept=$(div1).find("form").get(0);
                $(addDept).empty();
                $(addDept).append("部门名:<input type='text' id='d_name' name='d_name' style='width:120px' required='required'><br><span id='span1'></span><br><input type='submit' value='添加'>")
            });
            $(".plus2").click(function () {
                var div1=$(this).next();
                var addJob=$(div1).find("form").get(0);
                var d_Name=$(this).prev().html();
                $(addJob).empty();
                $(addJob).append("职位名:<input type='text' id='j_name' name='j_name'style='width:120px' required='required'>" +
                    "<br><span id='span2'></span><br>" +
                    "<input type='hidden' name='d_name' value="+d_Name+">" +
                    "<input type='submit' value='添加'>")
            });
            $(".minus1").click(function () {
                var div1=$(this).next();
                var deleteDept=$(div1).find("form").get(0);
                var d_Name=$(this).prev().html();
                $(deleteDept).empty();
                $(deleteDept).append("<input type='hidden' name='d_name' value="+d_Name+">"+
                "<input type='submit' value='删除'>")
            });
            $(".minus2").click(function () {
                var div1=$(this).next();
                var deleteJob=$(div1).find("form").get(0);
                var j_id=$(this).prev().html();
                $(deleteJob).empty();
                $(deleteJob).append("<input type='hidden' name='j_id' value="+j_id+">"+
                    "<input type='submit' value='删除'>")
            });
        })
    </script>
</head>
<body>
    <div class="content">
        <c:if test="${deptList.size()==0}">
            <div>您还没有创建任何部门,点击下方添加吧!</div>
        </c:if>
        <c:if test="${deptList.size()!=0}"><%--有部门--%>
            <table border="1" cellspacing="0" cellpadding="0">
                <tr>
                    <th>部门名称</th>
                    <th>职位名称</th>
                    <th>员工</th>
                </tr>
                <c:forEach items="${deptList}" var="dept">
                    <tr>
                        <td>
                            <div class="dName1">
                                    ${dept.d_name}
                            </div>
                            <c:if test="${dept.jobList.size()==0}">
                                <div class="minus1">
                                    －
                                </div>
                                <div>
                                    <form class="deleteDept" action="deptController/deleteDept">

                                    </form>
                                </div>
                            </c:if>
                        </td>
                        <td>
                            <c:forEach items="${dept.jobList}" var="job" varStatus="status">
                                <c:if test="${null!=job.empList}">
                                    <a href="#" >${job.j_name}</a>
                                </c:if>
                                <c:if test="${null==job.empList}">
                                    <div class="jName">
                                        <a href="#" >${job.j_name}</a>
                                    </div>
                                    <div class="j_id">
                                            ${job.j_id}
                                    </div>
                                    <div class="minus2">
                                        －
                                    </div>
                                    <div>
                                        <form class="deleteJob" action="jobController/deleteJob">

                                        </form>
                                    </div>
                                </c:if>
                            </c:forEach>
                            <div class="dName">
                                    ${dept.d_name}
                            </div>
                            <div class="plus2">
                                ＋
                            </div>
                            <div>
                                <form class="addJob" action="jobController/addJob">

                                </form>
                            </div>

                        </td>
                        <td style="text-align: left;margin-left: 0;padding: 0;">
                            <c:forEach items="${dept.jobList}" var="job">
                                <ul style="padding: 0;">${job.j_name}:
                                    <c:if test="${null==job.empList}">
                                        <li style="font-size: 14px;">此职位下暂时无人员</li>
                                    </c:if>
                                    <c:forEach items="${job.empList}" var="emp">
                                        <li><a href="empController/queryEmpInfo?e_id=${emp.e_id}">${emp.e_name}</a><br></li>
                                    </c:forEach>
                                </ul>
                            </c:forEach>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td>
                        <div class="plus1">＋

                        </div>
                        <div>
                            <form class="addDept" action="deptController/addDept">

                            </form>
                        </div>
                    </td>
                    <td></td>
                    <td></td>
                </tr>

            </table>
        </c:if>
    </div>
    <a href="empController/toPage?choose=adminMain" id="toMain">返回首页</a>
</body>
</html>

