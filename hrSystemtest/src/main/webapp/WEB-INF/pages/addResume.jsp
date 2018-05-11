<%--
  Created by IntelliJ IDEA.
  User: 刘
  Date: 2018/4/22
  Time: 22:52
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
    <title>addResume</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/toMain.css">
    <link rel="stylesheet" type="text/css" href="../../css/showUserInfo.css">
    <script type="text/javascript" src="js/jquery-3.1.0.js"></script>
    <script>
        $(function () {
            $("#idCard").blur(function () {
                var idVal=$("#idCard").val();
                if(idVal.length!=18){
                    $(".spanError").html("×请输入正确的身份证号长度:18位!");
                    $("#birthday").val("");
                }else{
                    var birthday=idVal.substring(6, 10) + "-" +idVal.substring(10, 12) + "-" + idVal.substring(12, 14);
                    $("#birthday").val(birthday);
                }
            });
            $("#idCard").focus(function () {
                $(".spanError").empty();
                $(".phoneError").empty();
            });
            $("#phone").focus(function () {
                $(".phoneError").empty();
            });
            $("#phone").blur(function () {
                $.ajax({
                    type:"post",
                    url:"resumeController/phoneAJAX",
                    data:{"phone":$("#phone").val()},
                    success:function (obj) {
                        alert(obj);
                        $(".phoneError").empty();
                        $(".phoneError").html(obj);
                    }
                })
            });
        })
    </script>
</head>
<body>
    <div class="content">
        <table border="1" cellspacing="0" cellpadding="0">
            <form action="resumeController/addResume" method="post">
                <tr>
                    <th colspan="6"> 简历信息</th>
                </tr>
                <tr>
                    <th>姓名</th>
                    <td><input name="rs_name" type="text" required="required"></td>
                    <th>性别</th>
                    <td>
                        <select name="rs_sex" required="required">
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                    </td>
                    <th>身份证号</th>
                    <td>
                        <input name="rs_IDNumber" id="idCard" type="text" required="required" title="×请输入正确的身份证号!" pattern="[1-9]\d{5}(18|19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12]\d|3[01])\d{3}(\d|[xX])"><br>
                        <span class="spanError" style="font-size: 12px;color: red"></span>
                    </td>
                </tr>
                <tr>
                    <th>出生日期</th>
                    <td>
                        <input type="text" name="birthday" id="birthday" readonly="readonly">
                    </td>
                    <th>户籍地址</th>
                    <td>
                        <input type="text" name="rs_residence" required="required">
                    </td>
                    <th>居住地址</th>
                    <td>
                        <input type="text" name="rs_addr" required="required">
                    </td>
                </tr>
                <tr>
                    <th>工作年限</th>
                    <td>
                        <input type="text" name="rs_expTime" required="required">
                    </td>
                    <th>联系电话</th>
                    <td>
                        <input type="text" name="rs_phone" id="phone" required="required" title="手机号输入不正确" pattern="(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}"><br>
                        <span class="phoneError" style="font-size: 12px;color: red">${phoneError}</span>
                    </td>
                    <th>Email</th>
                    <td>
                        <input type="email" name="rs_email" required="required">
                    </td>
                </tr>
                <tr>
                    <th>期望职位</th>
                    <td>
                        <input type="text" name="rs_desiredPosition" required="required">
                    </td>
                    <th>期望工作地点</th>
                    <td>
                        <input type="text" name="rs_desiredLocation" required="required">
                    </td>
                    <th>期望薪资</th>
                    <td>
                        <input type="number" name="rs_expectedSal" step="100" min="3000" required="required">元/月
                    </td>
                </tr>
                <tr>
                    <th>工作经历</th>
                    <td>
                        <textarea name="rs_careerExp" required="required"></textarea>
                    </td>
                    <th>添加简历</th>
                    <td>
                        <input type="hidden" name="rs_status" value="-1">
                        <input type="submit" value="添加">
                    </td>
                </tr>
            </form>
        </table>
    </div>

    <a href="recruitController/toPage?choose=userMain" id="toMain">返回主菜单</a>
</body>
</html>

