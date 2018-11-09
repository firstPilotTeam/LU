<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>用户列表-后台管理系统-Admin 1.0</title>
    <meta name="Description" content="基于layUI数据表格操作"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weadmin.css">
    <%--<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/itemlist.js" charset="utf-8"></script>--%>

    <!--<script type="text/javascript" src="../../static/js/admin.js"></script>-->
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .layui-form-switch {
            width: 55px;
        }

        .layui-form-switch em {
            width: 40px;
        }

        .layui-form-onswitch i {
            left: 45px;
        }

        .layui-table-cell{
            height: 39px;
        }

        body {
            overflow-y: scroll;
        }
    </style>
</head>

<body>
<div class="weadmin-nav">
			<span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">用户管理</a>
        <a>
          <cite>用户列表</cite></a>
      </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">&#x1002;</i></a>
</div>
<div class="weadmin-body">
    <div class="layui-row" style="margin-top: 1%;margin-bottom: 0%">
        <button class="layui-btn layui-btn-danger" data-type="getCheckData" id="delete"><i class="layui-icon">&#xe61f;</i>批量删除</button>
        <button class="layui-btn" onclick="WeAdminShow('添加用户','./add',600,500)"><i class="layui-icon">&#xe61f;</i>添加 </button>
        <span class="fr">
             搜索用户：
            <div class="layui-inline">
                <input class="layui-input" name="search" id="mysearch" autocomplete="off">
            </div>
            <button class="layui-btn" data-type="reload" id="mybtn">搜索</button>
        </span>
    </div>
    <table class="layui-hide" id="userList" lay-filter="test"></table>

    <%--绑定事件按钮组--%>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-normal" lay-event="edit" >编辑</a>
        <a class="layui-btn layui-btn-warm " lay-event="del" >删除</a>
    </script>

    <%--把状态设置为开关样式--%>
    <script type="text/html" id="myTpl">
        <input type="checkbox" name="userStatus" id="userStatus" lay-skin="switch" lay-text="激活|注销" disabled
               {{ 1==d.status?'checked':''}}/>
    </script>

    <script>
        layui.extend({
            admin: '{/}../../static/js/admin'
        });
        layui.use(['admin','table','jquery'], function(){
            var table = layui.table,
                $ = layui.jquery;
                layer = layui.layer;
            table.render({
                //elem\url\cols表格属性
                //type\field\title 表头属性
                //将数据绑定到这个容器上
                elem: '#userList',
                //发送这个异步请求到后台
                url:'../../users',
                page: true,
                limits:[5,10,20],
                limit:5,
                //表头
                cols: [[
                    {type: 'checkbox'},
                    {field: 'id', title: '用户编号',style:'height:60px;'},
                    {field: 'nickname', title: '昵称',style:'height:60px;'},
                    {field: 'sex', title: '性别', style:'height:60px;'},
                    {field: 'mob', title: '联系方式',style:'height:60px;'},
                    {field: 'address', title: '地址',style:'height:60px;'},
                    {field: 'joindate', title: '注册时间',style:'height:60px;',
                     templet :function (row){
                        return createTime(row.joindate);
                     }},
                    {field: 'gname', title: '已购商品',style:'height:60px;'},
                    {field: 'onumber', title: '订单编号',style:'height:60px;'},
                    {field: 'status', title: '会员状态',style:'height:60px;',templet:'#myTpl'},
                    {field:'right', title: '操作', toolbar:"#barDemo",style:'height:60px'}
                ]],
                /*将数据库中表示状态的数字转换为中文*/
                done: function (res, curr, count) {
                    $("[data-field='status']").children().each(function (i) {
                        if ($(this).text() == '1') {
                            $(this).text(']激活');
                        } else if ($(this).text() == '2') {
                            $(this).text('注销');
                        } else if ($(this).text() == '3') {
                            $(this).text('删除');
                        }
                    });
                }
            });
            var active = {
                /*批量删除*/
                getCheckData:function () {
                    var data = table.checkStatus("userList").data;
                    if(data.length>0){
                        var ids =[];
                        for(var i = 0;i<data.length;i++){
                            ids.push(data[i].id);
                        }
                        $.post(
                            '../../users/batch',
                            {'ids[]':ids},
                            function (data) {
                                if(data>0){
                                    $('.layui-laypage-btn').click();
                                    layer.msg("删除成功！", {icon: 1});
                                }
                            }
                        )
                    }else {
                        layer.msg("请至少选中一行", {icon: 3});
                    }
                },
                /*搜索事件*/
                reload: function () {
                    var search = $('#mysearch').val();
                    if(search != null && $.trim(search).length>0){
                        table.reload('userList', {
                            page:{curr:1},
                            where:{search:search}
                        });
                    }
                }
            };
            /*批量删除添加的点击事件*/
            $('#delete').on('click',function () {
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });
            /*搜索的点击事件*/
            $('#mybtn').on('click', function(){
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });
            /*监听工具条*/
            table.on('tool(test)',function (obj) {
                var data = obj.data;
                var layEvent = obj.event;
                var tr = obj.tr;
                /*编辑事件*/
                if(layEvent==='edit'){
                    layer.open({
                        type:2,
                        area: ['50%', '56%'],
                        content: './edit/',
                        title:'编辑',
                        success: function (layero, index) {
                            var iframe = window['layui-layer-iframe' + index];
                            iframe.child(data);
                        },end:function () {
                            $(".layui-laypage-btn").click();
                        }

                    });
                   /* 删除事件*/
                }else if(layEvent==='del'){
                    layer.confirm('真的要删除该行吗?',function (index) {
                        $.ajax({
                            url: '../../users/batch',
                            type: "POST",
                            data:{'ids[]':data.id},
                            success: function(data){
                                if(data==1){
                                    obj.del();
                                    $('.layui-laypage-btn').click();
                                    layer.msg("删除成功！", {icon: 1});
                                }else{
                                    layer.msg("删除失败!", {icon: 1});
                                }
                            }
                        });
                    })
                }
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
</div>
</body>

</html>