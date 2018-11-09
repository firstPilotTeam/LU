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
        <div class="layui-form-item" style="display: none">
            <label class="layui-form-label">ID</label>
            <div class="layui-input-block" style="display: none">
                <input type="text" name="id"  autocomplete="off" class="layui-input">
            </div>
        </div>
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
                <input type="radio" name="sex" value="男" title="男" >
                <input type="radio" name="sex" value="女" title="女" >
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-filter="edit" lay-submit="">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<%--数据回显--%>
<script type="text/javascript">
    function child(data) {
        var id = data.id;
        var nickname = data.nickname;
        var mob = data.mob;
        var address = data.address;
        var date = data.joindate;
        var status = data.status;
        var sex = data.sex;
        var joindate = createTime(date);
        layui.jquery('input[name="id"]').val(id);
        layui.jquery('input[name="nickname"]').val(nickname);
        layui.jquery('input[name="mob"]').val(mob);
        layui.jquery('input[name="address"]').val(address);
        layui.jquery('input[name="joindate"]').val(joindate);
        layui.jquery('input[name="sex"][value="'+sex+'"]').attr("checked",true);
        if(status=='1'){
            layui.jquery('input[name="status"]').attr("checked",true);
        }
    }
</script>
<script type="text/javascript">
    layui.extend({
        admin: '${pageContext.request.contextPath}/static/js/admin'
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
        //监听提交
        form.on('submit(edit)', function (data) {
            $.ajax({
                type:'POST',
                url:'${pageContext.request.contextPath}/users/edit',
                data:JSON.stringify($("#myform").serializeObject()),
                contentType:'application/json'
            });
            layer.alert("修改成功", {
                icon: 6
            }, function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
            return false;
        });
    });
</script>
<%--转换时间格式--%>
<script type="text/javascript">
    function createTime(v){
        var date = new Date(v);
        var y = date.getFullYear();
        var m = date.getMonth()+1;
        m = m<10?'0'+m:m;
        var d = date.getDate();
        d = d<10?("0"+d):d;
        var str = y+"-"+m+"-"+d;
        return str;
    }
</script>
</body>

</html>