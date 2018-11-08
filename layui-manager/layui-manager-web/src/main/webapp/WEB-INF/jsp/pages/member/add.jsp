<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>用户资料编辑-后台管理系统-Admin 1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="weadmin-body">
    <form class="layui-form" id="myform">
        <div class="layui-form-item">
            <label class="layui-form-label">昵称</label>
            <div class="layui-input-block">
                <input type="text" name="nickname" required  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-block">
                <input type="text" name="mob" required lay-verify="required|phone" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">地址</label>
            <div class="layui-input-block">
                <input type="text" name="address" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">订单编号</label>
            <div class="layui-input-block">
                <input type="text" name="onumber" required lay-verify="required|onumber" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">注册时间</label>
            <div class="layui-input-block">
                <input type="text" name="joindate" id="joindate" placeholder="yyyy-MM-dd" required lay-verify="required|date" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" >
            <label class="layui-form-label">会员状态</label>
            <div class="layui-input-block">
                <input type="checkbox" name="status" lay-skin="switch" id="status" lay-text="激活|注销" lay-filter="myswitch" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="男" title="男" checked>
                <input type="radio" name="sex" value="女" title="女" >
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-filter="add" lay-submit="">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    layui.extend({
        admin: '{/}../../static/js/admin'
    });
    layui.use(['form', 'jquery', 'admin','layer','laydate'], function() {
        var form = layui.form,
            $ = layui.jquery,
            admin = layui.admin,
            laydate = layui.laydate,
            layer = layui.layer;
        laydate.render({
            elem: '#joindate'
        });
        /*序列化表单*/
        $.fn.serializeObject = function()
        {
            var o = {};
            var a = this.serializeArray();
            $.each(a, function() {
                if (o[this.name]) {
                    if (!o[this.name].push) {
                        o[this.name] = [o[this.name]];
                    }
                    o[this.name].push(this.value || '');
                } else {
                    o[this.name] = this.value || '';
                }
            });
            return o;
        };
        //监听指定开关
        form.on('switch(myswitch)', function(data){
            console.log(data.value);
        });
        /*自定义验证规则*/
        form.verify({
            onumber: [
                /^[\S]{6,6}$/
                ,'订单编号必须为6位'
            ]
        });
        //监听提交
        form.on('submit(add)', function (data) {
            $.ajax({
                type:'POST',
                url:'../../users/add',
                data:JSON.stringify($("#myform").serializeObject()),
                contentType:'application/json'
            });
            layer.alert("增加成功", {
                icon: 6
            }, function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
                parent.location.reload();
            });
            return false;
        });
    });
</script>
</body>

</html>