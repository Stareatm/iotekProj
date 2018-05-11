<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/5/1
  Time: 16:05
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
    <title>showTraining</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/toMain.css">
    <link rel="stylesheet" type="text/css" href="../../css/showUserInfo.css">

    <style type="text/css">
        li{
            margin-left: 1.5em;
        }
        th,td{
            width: 150px;
        }
        .span{
            color: red;
            font-size: 12px;
        }
      /*  .plus{
            width: 20px;
            height: 20px;
            background: #535dff;
            color: aqua;
            text-align: center;
            line-height: 20px;
        }*/
    </style>
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script>
        /*$(function () {
            $(".plus").click(function () {
                var div1=$(this).next();
                var addTraining=$(div1).find("form").get(0);
                $(addTraining).empty();
                $(addTraining).append("<td><input type='text' name='t_theme'></td><td><textarea name='t_content'></textarea>" +
                    "</td><td><input type='datetime-local' name='t_beginTime'></td><td><input type='text' name='t_addr'></td>" +
                    "<td>部门选择:<select name='d_name' id='d_name'></select><input type='submit' value='添加培训'></td>");
               /!* for(var i=0;i<deptList.size();i++){
                    var dept=deptList.get(i);
                    $("#d_name").append("<option>"+dept.d_name+"</option>");
                }*!/

            });
        })*/
        $(function () {
            $(".endTime").blur(function () {
                $.ajax({
                    type:"post",
                    url:"trainingController/checkEndTime",
                    data:{"beginTime":$(".beginTime").val(),"endTime":$(".endTime").val()},
                    success:function(obj){/*obj是返回的jobList*/
                        $(".span").empty();
                        $(".span").append(obj);
                    }
                })
            });
            $(".endTime").focus(function () {
                $(".span").empty();
            })
        })
    </script>
</head>
<body>
    <div class="content">
        <c:if test="${trainingList.size()==0}">
            没有创建相关训练,请在下方下方创建吧!
        </c:if>
        <c:if test="${trainingList.size()!=0}">
            <c:forEach items="${trainingList}" var="training" varStatus="status">
                <table border="1" cellspacing="0" cellpadding="0">
                    <tr>
                        <th colspan="8">培训信息${status.index+1}</th>
                    </tr>
                    <form action="trainingController/updateTraining" method="post">
                        <tr>
                            <th>培训主题</th>
                            <th>培训内容</th>
                            <th>培训开始时间</th>
                            <th>培训结束时间</th>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" name="t_theme" value="${training.t_theme}" required="required">
                            </td>
                            <td>
                                <textarea name="t_content" required="required">${training.t_content}</textarea>
                            </td>
                            <td>
                                <fmt:formatDate value="${training.t_beginTime}" pattern="yyyy-MM-dd HH:mm" var="t_beginTime"/>
                                <input type="datetime" name="beginTime" value="${t_beginTime}" required="required">
                            </td>
                            <td>
                                <fmt:formatDate value="${training.t_endTime}" pattern="yyyy-MM-dd HH:mm" var="t_endTime"/>
                                <input type="datetime" name="endTime" value="${t_endTime}" required="required">
                            </td>
                        </tr>
                        <tr>
                            <th>培训地址</th>
                            <th>培训部门名称</th>
                            <th>培训人员名单</th>
                            <th>修改</th>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" name="t_addr" value="${training.t_addr}" required="required">
                            </td>
                            <td>
                                <select name="d_name" required="required">
                                    <option value="${training.dept.d_name}" selected="selected">${training.dept.d_name}</option>
                                    <c:forEach items="${deptList}" var="dept">
                                        <c:if test="${!dept.d_name.equals(training.dept.d_name)}">
                                            <option value="${dept.d_name}">${dept.d_name}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </td>
                            <td>
                                <c:forEach items="${training.dept.jobList}" var="job">
                                    <ul style="padding: 0;">${job.j_name}:
                                        <c:if test="${null==job.empList}">
                                            <li style="font-size: 14px;">此职位下暂时无人员</li>
                                        </c:if>
                                        <c:forEach items="${job.empList}" var="emp">
                                            <li><a href="empController/queryEmpInfo?e_id=${emp.e_id}">${emp.e_name}</a><br></li>
                                        </c:forEach>
                                    </ul>
                                </c:forEach>
                                <c:if test="${training.dept.jobList.size()==0}">
                                    该部门下没有职位
                                </c:if>
                            </td>
                            <td>
                                <input type="hidden" name="t_id" value="${training.t_id}">
                                <input type="submit" value="修改">
                            </td>
                        </tr>
                    </form>
                    <tr>
                        <th colspan="2">删除</th>
                        <td colspan="2">
                            <form action="trainingController/deleteTraining" method="post">
                                <input type="hidden" name="t_id" value="${training.t_id}">
                                <input type="submit" value="删除">
                            </form>
                        </td>
                    </tr>
                </table>
            </c:forEach>
            <p></p>
            <table border="1" cellspacing="0" cellpadding="0">
                <form class="addTraining" action="trainingController/addTraining" method="post">
                    <tr>添加培训</tr>
                    <tr>
                        <th>培训主题</th>
                        <th>培训内容</th>
                        <th>培训开始时间</th>
                        <th>培训结束时间</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="t_theme" required="required">
                        </td>
                        <td>
                            <textarea name="t_content" required="required"></textarea>
                        </td>
                        <td>
                            <input type="datetime-local" name="beginTime" class="beginTime" required="required">
                        </td>
                        <td>
                            <input type="datetime-local" name="endTime" class="endTime" required="required">
                            <span class="span"></span>
                        </td>
                    </tr>
                    <tr>
                        <th>培训地址</th>
                        <th>培训部门名称</th>
                        <th colspan="2">添加</th>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="t_addr" required="required">
                        </td>
                        <td>
                            部门选择:
                            <select name="d_name" required="required">
                                <c:forEach items="${deptList}" var="dept">
                                    <option>${dept.d_name}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td colspan="2">
                            <input type="submit" value="添加培训">
                        </td>
                    </tr>
                </form>
            </table>
        </c:if>
    </div>
    <a href="empController/toPage?choose=adminMain" id="toMain">返回主菜单</a>
</body>
</html>

