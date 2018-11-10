<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>订单列表-后台管理系统-Admin 1.0</title>
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
<div class="weadmin-nav">
			<span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">订单管理</a>
        <a><cite>订单列表</cite></a>
      </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
    <div class="demoTable">
        搜索收货人：
        <div class="layui-inline">
            <input class="layui-input" placeholder="请输入收货人名字" name="keyword" id="demoReload" autocomplete="off">
        </div>
        <button class="layui-btn" data-type="reload" id="search1">搜索</button>
    </div>

    <div class="weadmin-block demoTable">
        <button class="layui-btn layui-btn-danger" data-type="getCheckData"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" id="add"<%--onclick="WeAdminShow('添加订单','./add.html')"--%>><i class="layui-icon"></i>添加</button>
        <%--<span class="fr" style="line-height:40px">共有数据：88 条</span>--%>
    </div>

    <table class="layui-table" id="OrderList" lay-filter="demo"></table>

    <%--表格添加按钮--%>
    <script type="text/html" id="barDemo"><%--
        <a class="layui-btn layui-btn-primary layui-btn-mini" lay-event="detail">查看</a>--%>
        <a class="layui-btn layui-btn-mini" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del">删除</a>
    </script>


</div>
<script>
    //查找后台数据显示在前端页面，后台返回数据格式{code,msg,count,data}全部封装在ordersResult中直接返回
    layui.extend({
        admin: '{/}../../static/js/admin'
    });
    layui.use(['admin','table','jquery'], function(){
        var table = layui.table,
            layer = layui.layer,
            $ = layui.jquery;
        //表格渲染
        table.render({
            //elem\url\cols表格属性
            //type\field\title 表头属性
            //将数据绑定到这个容器上
            elem: '#OrderList',
            //发送这个异步请求到后台
            url:'../../orders',
            //表头
            cols:[[
                {type:'checkbox'},
                {field: 'order_number', title: '订单编号'},
                {field: 'gnumber', title: 'g编号'},
                {field: 'receiver', title: '收货人'},
                {field: 'phone', title: '号码'},
                {field: 'total', title: '总金额'},
                {field: 'pay', title: '应付金额'}
                ,{field:'right', title: '操作', width:177,toolbar:"#barDemo"}
            ]],
            page: true
        });


        /*=============================================批量删除======================================================*/
        //定义active这个对象
       var active = {
           //批量删除方法
            getCheckData:function(){
                //获取所有选中行，返回的是一个数组，该数组中封装了每行封装的对象
                var data = table.checkStatus("OrderList").data;

               // console.log(data.length);
                if(data.length>0){
                    //有被选中行
                    //定义一个空数组用来存放所选中行的ID
                    var ids = [];
                    //遍历所有选中行，把ID放入ids中
                    for(var i = 0;i<data.length;i++){
                        ids.push(data[i].id);
                    }
                    //异步请求
                    layer.confirm("确认要删除吗，删除后不能恢复哦！", { title: "删除确认" }, function (index) { //确认删除弹窗确认
                        layer.close(index);
                        $.post(
                            url = "../../delete",
                            data = {"ids": ids},
                            //执行成功之后的回调函数
                            function (data) {
                                if (data > 0) {
                                    //停留在原来页面刷新
                                    $('.layui-laypage-btn').click();
                                    layer.msg("删除成功！", {icon: 1});
                                }

                            }
                        )
                    })
                }else{
                    //没有被选中行
                    layer.msg("请至少选中一行",{icon:5})
                }
            },
           //搜索方法
           reload: function () {
               var receiver = $('#demoReload').val();//获取输入框的值
               //执行重载
               table.reload('OrderList', //table的id为OrderList
                   {
                       page:
                           {
                               curr: 1 //重新从第 1 页开始
                           }
                       , where: {name: receiver}//这里传参  向后台
                       , url: "../../select"//后台做模糊搜索接口路径
                       , method: 'post'
                   });
           }

        }

       //批量删除按钮的点击事件（动态生成的按钮不能用点击事件）
        $('.demoTable .layui-btn-danger').click(function () {
            //获取按钮的data-type的值getCheckData,按钮data-type的值就是多选框的值
            var type = $(this).data('type');
            //在js中存在一个对象叫active//active对象中的type值就是getCheckData的值如果有的话就执行，没有就什么也不做
            active[type] ? active[type].call(this) :'';
        });

        /*========================================================搜索=================================================================*/


//            .demoTable .layui-btn
       $('#search1').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        })

/*================================================================编辑========================================================*/
        //监听工具条
        table.on('tool(demo)', function(obj){ //监听的是table，所以table要有lay-filter="demo"和tool(demo)对应
            var data = obj.data;
            if(obj.event === 'edit'){
              /*  layer.alert('编辑行：<br>'+ JSON.stringify(data))*/
                layer.open({  //弹出窗口
                    title:["修改订单","font-size:18px;color:blue;"],
                    anim: 6,
                    type: 2,  //窗口样式
                    area: ['800px', '400px'],  //窗口大小
                    content: 'edit',            //走的控制层
                    success: function(layero, index){
                        var body = layer.getChildFrame('body', index);
                        var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
                        /*console.log(body.html())*/ //得到iframe页的body内容
                        body.find('#id').val(data.id);
                        body.find('#order_number').val(data.order_number);
                        body.find('#gnumber').val(data.gnumber);
                        body.find('#reciever').val(data.receiver);
                        body.find('#mod').val(data.phone);
                        body.find('#total').val(data.total);
                        body.find('#pay').val(data.pay);
                    },
                    end: function(){
                        //停留在原来页面刷新
                        $('.layui-laypage-btn').click();
                    }
                });
            }else if(obj.event === 'del'){ //删除
                layer.confirm('真的删除该条数据吗？',{ title: "删除确认" }, function(index){
                   var id = data.id;
                   $.post(
                       url="../../deleteOrder",
                       /*"id="+id,*/
                        data={"id":id},
                       function(rec){
                           $('.layui-laypage-btn').click();
                           layer.msg("删除成功！", {icon: 1});
                       }
                   )
                });
            }
        });
/*=======================================================添加================================================*/
        $('#add').on('click',function(){
            layer.open({  //弹出窗口
                title:["添加订单","font-size:18px;color:red;"],
                anim: 6,
                type: 2,  //窗口样式
                area: ['800px', '400px'],  //窗口大小
                content: 'add',            //走的控制层
                end: function(){
                    //停留在原来页面刷新
                    $('.layui-laypage-btn').click();
                }
            });
        })
    });



</script>
</body>

</html>