<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员登录-后台管理系统-Admin 1.0</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>

</head>
<body class="login-bg">

<div class="login">

    <div class="message">Admin 1.0-管理登录</div>
    <div id="darkbannerwrap"></div>

    <form class="layui-form" >
        <input name="uname" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
        <hr class="hr15">
        <input name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
        <hr class="hr15">
        <input class="loginin" value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        <hr class="hr20" >
        <p><a href="test" class="fl">立即注册</a></p>
    </form>

</div>

<script type="text/javascript">

    layui.extend({
        admin: '{/}./static/js/admin'
    });
    layui.use(['form','admin','jquery'], function(){
        var form = layui.form,
            $=layui.jquery,
            admin = layui.admin;
        //监听提交
        form.on('submit(login)', function(data){
            $.ajax({
                url:'../users',
                data:data.field,
                dataType:'text',
                type:'get',
                success:function(data){

                    if(data=='1'){
                        alert('登录成功！');
                        location.href = "../index";
                    }else{
                       alert('用户名或密码错误');
                    }

                }

            })

            })
            return false;
        });
</script>
<!-- 底部结束 -->
</body>
</html>
