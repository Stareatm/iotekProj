<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/5/3
  Time: 16:19
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
    <style type="text/css">
        #tr{
            height: 100px;
        }
    </style>
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script>
        $(function () {
            $("#selectedYear").change(function () {
                var year=$(this).val();
                var year1=parseInt(year);
                var currentYear=${currentYear};
                var firstYear=${year};
                var firstMonth=${month};
                var monthList=${monthList};
                $("#selectedMonth").empty();
                if(year1==firstYear&&year!=currentYear){
                    for(var i=firstMonth;i<=12;i++){
                        $("#selectedMonth").append("<option>i</option>");
                    }
                }else if(year1>firstYear&&year1<currentYear){
                    for(var i=1;i<=12;i++){
                        $("#selectedMonth").append("<option>i</option>");
                    }
                }else if(year1==currentYear){
                    for(var i=0;i<monthList.length;i++){
                        $("#selectedMonth").append("<option>"+monthList[i]+"</option>");
                    }
                }
            });
            $("#selectedMonth").change(function () {
                var selectedYear=$("#selectedYear").val();
                var selectedMonth=$(this).val();
                $.ajax({
                    type:"post",
                    url:"salaryController/findSalaryAJAX",
                    data:{"selectedYear":$("#selectedYear").val(),"selectedMonth":$("#selectedMonth").val()},
                    success:function (obj) {
                        alert(obj);
                        $("#status").empty();
                        if(obj.length!=0){
                            $("#status").append("已发放,名单如下:");
                            $("#selectedTable").empty();
                            $("#selectedTable").append(" <tr>"+
                                "<th>员工编号</th><th>员工姓名</th><th>基本工资</th><th>绩效奖金</th>"+
                                "<th>奖惩费用(包括加班费用)</th><th>社保</th><th>总薪资</th>"+
                                "</tr>");
                            for(var i=0;i<obj.length;i++){
                                $("#selectedTable").append("<tr>" +
                                    "<td><input type='text' value='"+obj[i].emp.e_id+"' readonly='readonly'>元</td>"+
                                    "<td><input type='text' value='"+obj[i].emp.e_name+"' readonly='readonly'>元</td>"+
                                    "<td><input type='number' value='"+obj[i].s_baseSal+"' readonly='readonly'>元</td>"+
                                    "<td><input type='number' value='"+obj[i].s_performance+"' readonly='readonly'>元</td>"+
                                    "<td><input type='number' value='"+obj[i].s_rpSal+"' readonly='readonly'>元</td>"+
                                    "<td><input type='number' value='"+obj[i].s_socialSecurity+"' readonly='readonly'>元</td>"+
                                    "<td><input type='number' value='"+obj[i].s_totalSal+"' readonly='readonly'>元</td>" +
                                    "</tr>");
                            }
                        }else{
                            var currentYear=${currentYear};
                            var currentMonth=${currentMonth};
                            if(currentMonth==1&&parseInt(selectedYear)==currentYear-1&&parseInt(selectedMonth)==12){
                                $("#status").append("未发放,<a href='salaryController/paySalary?" +
                                    "selectedYear="+selectedYear+"&selectedMonth="+selectedMonth+"'>点击发放</a>")
                            }
                            if (currentMonth!=1&&parseInt(selectedMonth)==currentMonth-1&&parseInt(selectedYear)==currentYear){
                                $("#status").append("未发放,<a href='salaryController/paySalary?" +
                                    "selectedYear="+selectedYear+"&selectedMonth="+selectedMonth+"'>点击发放</a>")
                            }else{
                                $("#status").append("未发放!")
                            }
                        }
                    }
                })
            });
        })
    </script>
</head>
<body>
    <table border="1" cellspacing="0" cellpadding="0">
        <tr>
            <th>年份</th>
            <th>月份</th>
            <th>人员薪资发放情况</th>
        </tr>
        <tr id="tr">
            <td>
                <select id="selectedYear" name="selectedYear" required="required">
                    <option selected="selected">${currentYear}</option>
                    <c:forEach items="${yearList}" var="year">
                        <c:if test="${year!=currentYear}">
                            <option>${year}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </td>
            <td>
                <select id="selectedMonth" name="selectedMonth" required="required">
                    <option selected="selected">${currentMonth}</option>
                    <c:forEach items="${monthList}" var="month">
                        <c:if test="${month!=currentMonth}">
                            <option>${month}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </td>
            <td id="status">
                未发放
            </td>
        </tr>
    </table>
    <div>
        <table border="1" cellpadding="0" cellspacing="0" id="selectedTable">

        </table>
    </div>
    <a href="salaryController/toPage?choose=adminMain">返回主页</a>
</body>
</html>

