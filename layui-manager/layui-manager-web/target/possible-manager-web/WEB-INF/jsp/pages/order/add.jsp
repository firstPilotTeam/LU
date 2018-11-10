<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>添加订单-后台管理系统-Admin 1.0</title>
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
        <%--<div class="layui-form-item">
            <label for="L_email" class="layui-form-label"><span class="we-red">*</span>发票不抬头</label>
            <div class="layui-input-inline">
                <input type="text" id="L_email" name="email" required="" lay-verify="email" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="we-red">*</span>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label for="desc" class="layui-form-label">商品增加
                <a class="layui-btn layui-btn-sm layui-btn-primary" onclick="addTable();"><i class="layui-icon">&#xe608;</i> 添加</a>
            </label>
            <div class="layui-input-block">--%>
               <%-- <table class="layui-table" id="myTable">
                    <thead>
                    <tr>
                        <th>id</th>
                        <th>商品名称</th>
                        <th>单价</th>
                        <th>数量</th>
                        <th>总价</th>
                        <th>操作</th>
                    </tr>

                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>haier海尔 BC-93TMPF 93升单门冰箱</td>
                        <td>0.01</td>
                        <td>984</td>
                        <td>9.84</td>
                        <td>
                            <a style="cursor: pointer; color: blue;" onclick="removeTr(1)">删除</a>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>haier海尔 BC-93TMPF 93升单门冰箱</td>
                        <td>0.01</td>
                        <td>984</td>
                        <td>9.84</td>
                        <td>
                            <a style="cursor: pointer; color: blue;" onclick="removeTr(2)">删除</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label for="desc" class="layui-form-label">描述</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" id="desc" name="desc" class="layui-textarea"></textarea>
            </div>
        </div>--%>
        <div class="layui-form-item">
            <label  class="layui-form-label">
            </label>
            <button class="layui-btn" >增加</button>
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
        //添加按钮点击事件  注意：form和动态提交只能出现一个，否则会冲突报错
        $('.layui-btn').click(function () {
           var order_number = $("#order_number").val();
           var gnumber = $("#gnumber").val();
            var receiver = $("#reciever").val();
            var phone = $("#mod").val();
            var total = $("#total").val();
            var pay = $("#pay").val();
            var data = "order_number="+order_number+"&gnumber="+gnumber+"&receiver="+receiver+"&phone="+phone+"&total="+total+"&pay="+pay;
            $.ajax({
                    url:"../../addOrder",
                    data:data,
                    type:"post",
                    dataType:"text",
                success:function(rec){//交互成功
                    //交互成功后关闭该iframe层的方法
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index); //再执行关闭
                },
                error:function(){//交互失败
                    alert("增加失败！")
                }
                })
        })

       /* //自定义验证规则
        form.verify({
            nikename: function(value) {
                if(value.length < 5) {
                    return '昵称至少得5个字符啊';
                }
            },
            pass: [/(.+){6,12}$/, '密码必须6到12位'],
            repass: function(value) {
                if($('#L_pass').val() != $('#L_repass').val()) {
                    return '两次密码不一致';
                }
            }
        });

        //监听提交
        form.on('submit(add)', function(data) {
            console.log(data);
            //发异步，把数据提交给php
            layer.alert("增加成功", {
                icon: 6
            }, function() {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
            return false;
        });

        var num = 3;

        window.addTable = function() {
            var tableHtml = "";
            tableHtml += '<tr id="tr' + num + '">' +
                '<td>'+num+'</td>' +
                '<td><div class="layui-input-inline"><input type="text" name="canshu1" class="layui-input"></div></td>' +
                '<td><div class="layui-input-inline"><input type="text" name="canshu2" class="layui-input"></div></td>' +
                '<td><div class="layui-input-inline"><input type="text" name="canshu3" class="layui-input"></div></td>' +
                '<td><div class="layui-input-inline"><input type="text" name="canshu4" class="layui-input"></div></td>' +
                '<td><a style="cursor: pointer; color: blue;" onclick="removeTr(' + num + ')">删除</a>' +
                '</td>' +
                '</tr>';

            var elements = $("#myTable").children().length; //表示id为“mtTable”的标签下的子标签的个数

            $("#myTable").children().eq(elements - 1).after(tableHtml); //在表头之后添加空白行
            num++;
        }
        //删除行
        function removeTr(trNum) {
            $("#tr" + trNum).remove();
        }*/

    });
</script>
</body>

</html>