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
    <style type="text/css">
        #plus1,#plus2 {
            width: 20px;
            height: 20px;
            background: #535dff;
            color: aqua;
            text-align: center;
            line-height: 20px;
        }
        #minus1,#minus2 {
            width: 20px;
            height: 20px;
            background: #ff130e;
            color: aqua;
            text-align: center;
            line-height: 20px;
        }
    </style>
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script>
        $(function () {
            $("#plus1").click(function () {
                $("#addDept").empty();
                $("#addDept").append("部门名:<input type='text' id='d_name' name='d_name'><br><span id='span1'></span><br><input type='submit' value='添加'>")
            });
            $("#plus2").click(function () {
                $("#addJob").empty();
                var d_Name=$("#dName").html();
                $("#addJob").append("职位名:<input type='text' id='j_name' name='j_name'>" +
                    "<br><span id='span2'></span><br>" +
                    "<input type='hidden' name='d_name' value="+d_Name+">" +
                    "<input type='submit' value='添加'>")
            });
            $("#d_name").bind(function () {
                $("#span1").empty();
                $.ajax({
                    type:"post",
                    url:"deptController/ajaxFindDept",
                    data:{"d_name":$("#d_name").val()},
                    success:function (obj) {
                        alert(obj);
                        if(null!=obj){
                            $("#span1").html("该部门已存在!");
                        }else{
                            $("#span1").html("√");
                        }
                    }
                })
            });
            $("#minus1").click(function () {
                $("#deleteDept").empty();
                var d_Name=$("#dName").html();
                $("#deleteDept").append("<input type='hidden' name='d_name' value="+d_Name+"><br>"+
                "<input type='submit' value='删除'>")
            })
        })
    </script>
</head>
<body>
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
                        <div id="dName">
                            ${dept.d_name}
                        </div>
                        <c:if test="${dept.jobList.size()==0}">
                            <div id="minus1">－</div>
                            <div>
                                <form id="deleteDept" action="deptController/deleteDept">

                                </form>
                            </div>
                        </c:if>
                    </td>
                    <td>
                        <c:forEach items="${dept.jobList}" var="job">
                            <a href="#">${job.j_name}</a>
                            <c:if test="${job.empList.size()==0}">
                                <div id="minus2">－</div>
                                <div>
                                    <form id="deleteJob" action="jobController/deleteJob">

                                    </form>
                                </div>
                            </c:if><br>
                        </c:forEach>

                        <div id="plus2">＋</div>
                        <div>
                            <form id="addJob" action="jobController/addJob">

                            </form>
                        </div>


                    </td>
                    <td>
                        <c:forEach items="${dept.jobList}" var="job">
                            <ul>
                                ${job.j_name}:
                                <c:if test="${job.empList.size()==0}">
                                    <li>此职位下暂时无人员</li>
                                </c:if>
                                <c:forEach items="${job.empList}" var="emp">
                                    <li><a href="#">${emp.e_name}</a><br></li>
                                </c:forEach>
                            </ul>
                        </c:forEach>
                    </td>
                </tr>
            </c:forEach>
            <td>

                <div id="plus1">＋</div>
                <div>
                    <form id="addDept" action="deptController/addDept">

                    </form>
                </div>

            </td>
        </table>
    </c:if>

</body>
</html>

