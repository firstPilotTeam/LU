<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>添加订单-后台管理系统-Admin 1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weadmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/treeselect.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/treeselect.js" charset="utf-8"></script>--%>
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
            <label class="layui-form-label">ID</label>
            <div class="layui-input-inline">
                <input type="text" name="id" lay-verify="title" required placeholder="请输入ID" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
        <label class="layui-form-label">商品编号</label>
        <div class="layui-input-inline">
            <input type="text" name="goodsnumber" lay-verify="required|" placeholder="请输入商品编号" autocomplete="off" class="layui-input">
        </div>
        </div>
<div class="layui-form-item">
    <label class="layui-form-label">商品名称</label>
    <div class="layui-input-inline">
        <input type="text" name="gname" lay-verify="required|" required placeholder="请输入商品名称" autocomplete="off" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">商品卖点</label>
    <div class="layui-input-inline">
        <input type="text" name="features" lay-verify="pass" placeholder="请输入商品卖点" lay-verType="tips" autocomplete="off" class="layui-input">
    </div>
</div>

<div class="layui-form-item">
    <label class="layui-form-label">上架时间</label>
    <div class="layui-input-inline">
        <input type="date" name="Shelftime" lay-verify="required|" placeholder="请输入上架时间" lay-verType="tips" autocomplete="off" class="layui-input">
    </div>
</div>



<div class="layui-form-item">
    <label class="layui-form-label">分类编号</label>
    <div class="layui-input-inline">
        <input type="text" name="snumber" lay-verify="required|" placeholder="请输入分类编号" lay-verType="tips" autocomplete="off" class="layui-input">
    </div>
</div>

<div class="layui-form-item">
    <label class="layui-form-label">库存</label>
    <div class="layui-input-inline">
        <input type="text" name="stock" lay-verify="required|" placeholder="请输入库存量" lay-verType="tips" autocomplete="off" class="layui-input">
    </div>
</div>

<div class="layui-form-item">
    <label class="layui-form-label">商品状态</label>
    <div class="layui-input-inline">
        <input type="text" name="state" lay-verify="required|" placeholder="请输入商品状态" lay-verType="tips" autocomplete="off" class="layui-input">
    </div>
</div>

<div class="layui-form-item">
    <label class="layui-form-label">是否热销</label>
    <div class="layui-input-inline">
        <input type="text" name="ishot" lay-verify="required|" placeholder="请输入是否热销" lay-verType="tips" autocomplete="off" class="layui-input">
    </div>
</div>

<div class="layui-form-item">
    <div class="layui-input-block">
        <button class="layui-btn" lay-submit="" lay-filter="form1">添加</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
</div>


    </form>
</div>
<script>
    layui.extend({
        admin: '{/}../../static/js/admin',
        treeselect: '{/}../../static/js/treeselect'
    });
    layui.use(['form', 'admin','layer', 'layedit', 'treeselect','jquery'], function () {
        var form = layui.form,
            admin = layui.admin,
            layer = layui.layer,
            layedit = layui.layedit,
            $ = layui.jquery,
            treeselect = layui.treeselect;

        //初始化树形下拉框
        treeselect.render(
            {
                elem: "#cid",
                data: [{ //节点
                    name: '父节点1',
                    spread: false
                    ,children: [{
                        name: '子节点11'
                    },{
                        name: '子节点12'
                    }]
                },{
                    name:'父节点2',
                    spread:false
                    ,children:[{
                        name: '子节点21'
                    }]
                }],
                method: "GET"
            });

        //第二步
        //初始化富文本编辑器
        layedit.build('itemDesc', {
            height: 100,//设置编辑器高度
            uploadImage:{
                url:'../../uploadImage',
                type:'post'
            }
        });

        //监听提交
        form.on('submit(form)', function (data) {
            console.log(data);
            //发异步，把数据提交给php
            layer.alert("增加成功", {
                icon: 6
            }, function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
            return false;
        });

        form.on('submit(form1)',function(data) {
            layer.alert(JSON.stringify(data.field),{
                title:'最终提交信息'
            })

            $.post("../../add",data.field,function(result) {

                layer.msg(result.msg, {
                    icon: 1,
                    time: 2000 //2秒关闭（如果不配置，默认是3秒）
                }, function(){
                    //do something
                    //两秒关闭页面之后要做的事情
                    //刷新父页面
                    parent.window.location();
                });

                //alert(result.msg);
            });

            //阻止表单提交,因为我们想要使用ajax提交，如果使用传统的表单提交最后控制层返回的是页面，也不能使用@ResponseBody
            return false;
        });

        //使用ajax去提交信息
      /* $.post("add",data.field,function(result) {

            layer.msg(result.msg, {
                icon: 1,
                time: 2000 //2秒关闭（如果不配置，默认是3秒）
            }, function(){
                //do something
                //两秒关闭页面之后要做的事情
                //刷新父页面
                parent.window.location();
            });

            //alert(result.msg);
        });*/



        //自定义验证规则
        form.verify({
            title:function (value) {
                if(value.length<2){
                    return 'ID不得小于2个字符';
                }
            },  pass: [/(.+){2,12}$/, '商品卖点描述最少2字，最多12位']

        });
    });
</script>
</body>

</html>