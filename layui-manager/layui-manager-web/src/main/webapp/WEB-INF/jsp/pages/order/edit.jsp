<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/6 0006
  Time: 23:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>title</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>-->
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
</head>
<body>
<div class="weadmin-body">
        <input type="text" id="id" style="display: none" />
        <div class="layui-form-item">
            <label for="order_number" class="layui-form-label">
                <span class="we-red">*</span>订单编号
            </label>
            <div class="layui-input-inline">
                <input type="text" id="order_number"  required="" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="gnumber" class="layui-form-label">
                <span class="we-red">*</span>g编号
            </label>
            <div class="layui-input-inline">
                <input type="text" id="gnumber" required="" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="reciever" class="layui-form-label">
                <span class="we-red">*</span>收货人
            </label>
            <div class="layui-input-inline">
                <input type="text" id="reciever"  required="" lay-verify="reciever" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="mod" class="layui-form-label">
                <span class="we-red">*</span>号码
            </label>
            <div class="layui-input-inline">
                <input type="text" id="mod"  required="" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="total" class="layui-form-label">
                <span class="we-red">*</span>总金额
            </label>
            <div class="layui-input-inline">
                <input type="text" id="total"  required="" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="pay" class="layui-form-label">
                <span class="we-red">*</span>应付金额
            </label>
            <div class="layui-input-inline">
                <input type="text" id="pay"  required="" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label  class="layui-form-label">
            </label>
            <button class="layui-btn" >修改</button>
        </div>
</div>


<script>
    layui.extend({
        admin: '{/}../../static/js/admin'
    });
    layui.use(['form', 'admin', 'jquery', 'table', 'layer'], function() {
        var form = layui.form,
            admin = layui.admin,
            $ = layui.jquery,
            table = layui.table,
            layer = layui.layer;
        //添加按钮点击事件
        $('.layui-btn').click(function () {
            var id = $("#id").val();
            var order_number = $("#order_number").val();
            var gnumber = $("#gnumber").val();
            var receiver = $("#reciever").val();
            var phone = $("#mod").val();
            var total = $("#total").val();
            var pay = $("#pay").val();
            var data = "id=" + id + "&order_number=" + order_number + "&gnumber=" + gnumber + "&receiver=" + receiver + "&phone=" + phone + "&total=" + total + "&pay=" + pay;
            $.ajax({
                url: "../../editOrder",
                data: data,
                type: "post",
                dataType: "text",
                success: function (rec) {//交互成功
                    /*alert("成功");*/
                    //交互成功后关闭该iframe层的方法
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index); //再执行关闭
                },
                error: function () {//交互失败
                    alert("修改失败");

                }
            })
        })
    })
</script>
</body>
</html>
