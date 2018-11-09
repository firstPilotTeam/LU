<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>商品列表-后台管理系统-Admin 1.0</title>
    <meta name="Description" content="基于layUI数据表格操作"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
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
        body{overflow-y: scroll;}
    </style>
</head>

<body>
<div class="weadmin-nav">
			<span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">商品管理</a>
        <a>
          <cite>商品列表</cite></a>
      </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">&#x1002;</i></a>
</div>
<div class="weadmin-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 we-search" onsubmit="return false;">
            商品搜索：
            <div class="layui-inline">
                <input type="text" id="title" name="title" placeholder="请输入商品名称关键字" autocomplete="off" class="layui-input">
            </div>
            <button class="layui-btn" lay-submit="" lay-filter="search" data-type="reload"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <div class="weadmin-block demoTable">
       <%-- <button class="layui-btn layui-btn-danger" data-type="getCheckData"><i class="layui-icon">&#xe640;</i>批量删除</button>--%>
        <%--<button class="layui-btn" onclick="WeAdminShow('添加商品','./add',600,500)"><i class="layui-icon">&#xe61f;</i>添加</button>--%>
        <button id="addBtn" class="layui-btn" data-type="reload">新增</button>
    </div>




    <%--&lt;%&ndash;增加的弹框&ndash;%&gt;
    <form class="layui-form layui-form-pane1" id="form" name="form" style="display: none;" action="<%=request.getContextPath()%>/admin/addAdmin" method="post" lay-filter="first">
        <div class="layui-form-item">
            <label class="layui-form-label">ID</label>
            <div class="layui-input-inline">
                <input type="text" name="id" lay-verify="required|title" required placeholder="请输入ID" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">商品编号</label>
            <div class="layui-input-inline">
                <input type="text" name="goodsnumber" lay-verify="required|pass" placeholder="请输入商品编号" autocomplete="off" class="layui-input">
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
                <input type="text" name="features" lay-verify="required|number" placeholder="请输入商品卖点" lay-verType="tips" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">上架时间</label>
            <div class="layui-input-inline">
                <input type="date" name="features" lay-verify="required|number" placeholder="请输入上架时间" lay-verType="tips" autocomplete="off" class="layui-input">
            </div>
        </div>



        <div class="layui-form-item">
            <label class="layui-form-label">分类编号</label>
            <div class="layui-input-inline">
                <input type="text" name="snumber" lay-verify="required|number" placeholder="请输入分类编号" lay-verType="tips" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">库存</label>
            <div class="layui-input-inline">
                <input type="text" name="stock" lay-verify="required|number" placeholder="请输入库存量" lay-verType="tips" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">商品状态</label>
            <div class="layui-input-inline">
                <input type="text" name="state" lay-verify="required|number" placeholder="请输入商品状态" lay-verType="tips" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">是否热销</label>
            <div class="layui-input-inline">
                <input type="text" name="phone" lay-verify="required|number" placeholder="请输入是否热销" lay-verType="tips" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="*">添加</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
--%>







    <!--表格的id和class-->
    <table class="layui-hide" id="articleList" lay-filter="useruv"></table>
    <!--为表格添件按钮-->
    <script type="text/html" id="barDemo">
        <%--<a class="layui-btn layui-btn-primary layui-btn-mini" lay-event="detail">查看</a>--%>
        <a class="layui-btn layui-btn-mini" lay-event="edit" >编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del">删除</a>
    </script>




    <script type="text/html" id="operateTpl">
        <a title="编辑" onclick="WeAdminEdit('编辑','./edit', 2, 600, 400)" href="javascript:;">
            <i class="layui-icon">&#xe642;</i>
        </a>
        <a title="删除" href="javascript:;">
            <i class="layui-icon">&#xe640;</i>
        </a>
    </script>
    <%--<script type="text/html" id="shelfTpl">--%>
        <%--<form class="layui-form">--%>
            <%--<input type="checkbox" name="itemstatus" lay-filter="itemstatus" lay-skin="switch" lay-text="正常|下架" {{1==d.status?'checked':''}}/>--%>
        <%--</form>--%>
    <%--</script>--%>
    <script type="text/html" id="myTpl">
        <div class="layui-form">
            <input type="checkbox" name="itemStatus" id="itemStatus" lay-skin="switch" lay-text="正常|下架" {{1==d.status?'checked':''}}/>
        </div>
    </script>

    <script>
        layui.extend({
            admin: '{/}../../static/js/admin'
        });
        layui.use(['admin','table','jquery','layer','form'], function(){
            var table = layui.table,
                $ = layui.jquery;
           layer = layui.layer;
           var form = layui.form;
            table.render({
                //elem\url\cols表格属性
                //type\field\title 表头属性
                //将数据绑定到这个容器上
                elem: '#articleList',
                //发送这个异步请求到后台,如果写‘/items’会导致没有manager
                url:'../../items',
                //表头
                cols:[[
                    {'checkbox':true,width:80},
                    {field: 'id', title: 'ID',width:80,sort:true},
                    {field: 'goodsnumber', title: '商品编号',width:80},
                    {field: 'gname', title: '商品名称',width:80},
                    {field: 'features', title: '商品卖点',width:80},
                    {field: 'shelftime', title: '上架时间',width:120,templet:function (d) {
                           /* alert(d.shelftime)*/
                           var  cellval=d.shelftime
                        var dateVal = cellval + "";
                            if (cellval != null) {
                                var date = new Date(parseInt(dateVal.replace("/Date(", "").replace(")/", ""), 10));
                                var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
                                var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();

                                var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
                                var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
                                var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();

                                return date.getFullYear() + "-" + month + "-" + currentDate;
                            }

                    }},
                    {field: 'snumber', title: '分类编号',width:80},
                    {field: 'stock', title: '库存',width:80},
                    {field: 'state', title: '商品状态',width:80},
                    {field: 'ishot', title: '是否热销',width:80},
                    {field: 'right', title: '操作',toolbar:"#barDemo",width:180}
                ]],
                page: true
            });



            <!--layui中绑带事件使用table.on()-->
            <!--监听表格复选框的选择-->
            table.on('checkbox(useruv)',function (obj) {
                console.log(obj)
            });



            //定义了一个空对象
            var active = {
                getCheckData: function () {
                    //获取到选中行
                    var data = table.checkStatus("articleList").data;

                    if (data.length > 0) {
                        //有被选中的行
                        //定义空数组
                        var ids = [];
                        //遍历选中行，取出里面的id设值到数组中
                        for (var i = 0; i < data.length; i++) {
                            ids.push(data[i].id);
                        }
                        //异步请求
                        $.post(
                            //url:这次异步请求提交给后台的谁进行处理
                            '../../items/batch',
                            //data:这次异步请求提交什么数据给后台
                            {'ids[]':ids},
                            //success:异步请求执行成功之后的回调函数
                            function(data){
                                //至少删除一条记录
                                if (data > 0) {
                                    //停留在原来页面刷新
                                    $('.layui-laypage-btn').click();
                                    layer.msg("恭喜，删除成功！", {icon: 1});
                                }
                            }
                            //dataType:返回类型
//                            ,'json'
                        );
                    } else {
                        //没有选中行
                        layer.msg("请至少选中一行", {icon: 5});
                    }
                },
                reload: function () {
                    var title = $('#title').val();
                    if(title != null && $.trim(title).length > 0){
                        //带条件重新加载表格
                        table.reload('articleList',{
                            //page
                            page: {curr:1},
                            //where
                            where:{title:title}
                        });
                    }
                }
            };

            //批量删除按钮的点击事件
            $('.demoTable .layui-btn-danger').on('click',function () {
                //获取按钮的data-type的值 //getCheckData
                var type = $(this).data('type');
                //在js存在一个对象，对象叫active
                active[type] ? active[type].call(this) : '';
            });
            //模糊查询按钮事件
            $('.weadmin-body .layui-btn').on('click',function(){
                var type = $(this).data('type');//reload
                active[type] ? active[type].call(this) : '';
            });












            //监听工具条
            table.on('tool(useruv)',function(obj){

                    var data =  obj.data;//获得当前行数据
                    if(obj.event==='detail'){
                        layer.msg('ID:'+data.id+' 的查看操作');
                    }else if(obj.event==='del'){
                        layer.confirm('真的删除么，删除后不能恢复',{title:"删除确认"},function(index){
                            layer.close(index);
                            console.log(data);
                            //使用ajax
                            $.ajax({
                                url:"../../del",
                                type:"POST",
                                data:{"id":data.id},
                                dataType:"json",
                                success:function (result) {
                                    if(result.code==0){
                                        //删除该行
                                        obj.del();
                                        //关闭弹窗
                                        layer.close(index);
                                       // layer.msg("删除成功",{icon:6});
                                        //layer.closeAll();
                                        //parent.window.location.reload();


                                        layer.msg(result.msg, {
                                            icon: 6,
                                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                                        }, function(){
                                            //do something
                                            //两秒关闭页面之后要做的事情
                                            //刷新父页面
                                            parent.window.location.reload();
                                        });



                                    }else{
                                        layer.msg("删除失败",{icon:5});
                                    }
                                }

                            });
                        });
                    }else if(obj.event==='edit'){


                        layer.open({
                            type: 2,
                            area: ['400px', '500px'],
                            shade: [0.8, '#393D49'],
                            anim: 4,
                            content: '../../edit' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']

                            ,success:function(layero, index){
                                //这里一般是发送修改的Ajax请求
                                //这里的内容就是点击“确定”之后要提交的
                               /* alert(layero);//得到value*/
                              /*  EidtUv(data,value,index,obj);*/

                                //刷新整个页面
                                //   parent.window.location.reload();

                            var body = layer.getChildFrame('body', index);
                            var iframeWin = window[layero.find('iframe')[0]['name']];
                            console.log(body.html())
                           /* body.find('input').val('Hi，我是从父页来的')*/

                                body.find('#ni').val(data.id);
                                body.find('#go').val(data.goodsnumber);
                                body.find('#gn').val(data.gname);
                                body.find('#fe').val(data.features);
                                body.find('#sh').val(data.shelftime);
                                body.find('#sn').val(data.snumber);
                                body.find('#st').val(data.stock);
                                body.find('#sta').val(data.state);
                                body.find('#is').val(data.ishot);


                            }
                    })

                       /* layer.prompt({
                            formType: 2,//输出框类型，2表示多行文本
                            title: '修改ID为[‘+data.id+’]的访问量',
                            value: "nihao",//初始的值
                            area: ['800px', '350px'] //自定义文本域宽高
                        },function(value,index){
                            //这里一般是发送修改的Ajax请求
                            //这里的内容就是点击“确定”之后要提交的
                            alert(value);//得到value
                            EidtUv(data,value,index,obj);

                            //刷新整个页面
                         //   parent.window.location.reload();


                        });*/
                    }


            });

            $('.demoTable .layui-btn').on('click', function(){
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });


            //编辑的方法
            function  EidtUv(data,value,index,obj) {
                $.ajax({
                    url: "../../edit2",
                    type: "POST",
                    data:"id="+data.id,
                    //data:{"uvid":data.id,"memthodname":"edituv","aid":data.aid,"uv":value},
                    //dataType: "json",
                    success: function(result){

                        if(result.code==0){
                            //关闭弹框
                            layer.close(index);
                            //同步更新表格和缓存对应的值
                            obj.update({
                                uv: value
                            });
                            layer.msg("修改成功", {icon: 6});
                        }else{
                            layer.msg("修改失败", {icon: 5});
                        }



                    }

                });
            }

            //新增事件
            $("#addBtn").click(function () {

                //接下来要研究如何弹出一个新增的窗口
                //查看layui文档，查看弹出层，使用layer(layer.msg())
                layer.open({
                    type: 2,
                    area: ['400px', '500px'],
                    shade: [0.8, '#393D49'],
                    anim: 4,
                    content: 'add' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                });


            });

            //模糊查询



        });
    </script>

</div>
</body>

</html>