<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>登录注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>resources/css/login.css" type="text/css" media="all">
    <style>
        #msg,#msg2{
            color: white;
        }


    </style>



</head>

<body>
<h1>登录注册</h1>
<div class="container w3layouts agileits">
    <div class="login w3layouts agileits">
        <h2>登 录</h2>

        <input type="text"      id="username1"  placeholder="用户名" >
        <input type="password"  id="password1" placeholder="密码"   >

        <ul class="tick w3layouts agileits">
            <li>
                <input type="checkbox" id="brand1" value="" >
                <label for="brand1"><span></span>记住我</label>
            </li>
        </ul>

        <div class="send-button w3layouts agileits">
            <input type="button" value="登 录" id="btnLogin">
            <div id="msg"></div>
        </div>



        <a href="<%=path%>/resource/login/forgetPwd.jsp" target="_blank">忘记密码?</a>



    </div>

    <div class="register w3layouts agileits" id="registerDiv">
        <h2>注 册</h2>
        <input type="text"       id="username2"         placeholder="用户名"   >
        <input type="password"   id="password2"     placeholder="密码"     >
        <input type="text"       id="email"        placeholder="邮箱"     >

        <div class="send-button w3layouts agileits">
            <input type="button" value="免费注册" id="btnRegister">
            <div id="msg2"></div>

        </div>


        <div class="clear"></div>

    </div>

    <div class="clear"></div>
</div>

<div class="footer w3layouts agileits">
    <p>Copyright &copy; More Templates</p>
</div>

<input type="hidden" value="<%=basePath%>" id="hidd">

<script type="text/javascript">

    $(function(){

        var username="${sessionScope.info.username}";
        var password="${sessionScope.info.password}"
        $("#username1").val(username);
        $("#password1").val(password);
        if($("#username1").val()!=''&&$("#password1").val()!=''){
            $("input[type='checkbox']").attr("checked","checked");
        }else{
            $("input[type='checkbox']").removeAttr("checked")
        }

        window.flag;
        $("#btnLogin").click(function(){
            if($("input[type='checkbox']").is(":checked")){
                flag="yes";
            }else{
                flag="no";
            }
            if($("#username1").val()!=''&&$("#password1").val()!='') {
                $.ajax({
                    url: "login",
                    type: "post",
                    data: {
                        "username": $("#username1").val(),
                        "password": $("#password1").val(),
                        "flag": flag
                    }, success: function (data) {
                        if (data == "none") {
                            $("#msg"), html("用户不存在")
                        } else if (data == "true") {
                            $("#msg"), html("登陆成功")
                        } else {
                            $("#msg"), html("用户名或密码错误")
                        }
                    }
                })
            }else{
                $("#msg"), html("用户名或密码不能为空")
            }
        })

        $("#btnRegister").click(function(){
            if($("#username2").val()!=''&&$("#password2").val()!=''&&$("#email").val() ) {
                $.ajax({
                    url: "register",
                    type: "post",
                    data: {
                        "username": $("#username2").val(),
                        "password": $("#password2").val(),
                        "email": $("#email").val(),
                    },
                    success: function (data) {
                        if (data == "existed") {
                            $("#msg2").html("用户已被注册")
                        } else if (data == "yes") {
                            $("#msg2").html("注册成功")
                        } else {
                            $("#msg2").html("注册失败")
                        }
                    }
                })
            }else{
                $("#msg2").html("格式填写不正确")
            }
        })
    })
</script>

</body>


</html>

