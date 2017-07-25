<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="app">
<head>
    <meta charset="utf-8"/>
    <title>新建菜单 - 项目管理系统测试</title>
    <jsp:include page="/WEB-INF/views/commons/head.jsp"/>
    <!-- ztree metroStyle -->
    <link rel="stylesheet" href="/assets/js/zTree/css/metroStyle/metroStyle.css">

    <link href="/assets/css/app.css" rel="stylesheet"/>
    <link href="/assets/css/app.css" rel="stylesheet"/>
</head>
<body>
<section id="app" class="vbox">
    <jsp:include page="/WEB-INF/views/commons/header.jsp"/>
    <section>
        <section class="hbox stretch">
            <!-- .aside -->
            <jsp:include page="/WEB-INF/views/commons/sidebar.jsp"/>
            <!-- /.aside -->
            <section id="content">
                <section class="vbox">
                    <section class="scrollable wrapper bg-white-only">
                        <form class="form-horizontal" data-validate="parsley" action="/project/save" method="post">
                            <section class="panel panel-default">
                                <header class="panel-heading">
                                    <span class="h4">
                                        <i class="fa fa-plus"></i>
                                        立项申请</span>
                                </header>
                                <div class="panel-body">
                                    <form class="form-horizontal">
                                        <div class="line line-dashed b-b line-lg pull-in"></div>

                                        <div class="form-group">
                                            <div class="col-sm-2 control-label">类型</div>
                                            <label class="radio-inline">
                                                <input type="radio" name="type" value="0" v-model="menu.type"/> 目录
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="type" value="1" v-model="menu.type"/> 菜单
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="type" value="2" v-model="menu.type"/> 按钮
                                            </label>
                                        </div>
                                        <div class="line line-dashed b-b line-lg pull-in"></div>

                                        <div class="form-group">
                                            <div class="col-sm-2 control-label">菜单名称</div>
                                            <div class="col-sm-3">
                                                <input type="text" class="form-control" v-model="menu.name" placeholder="菜单名称或按钮名称"/>
                                            </div>
                                        </div>
                                        <div class="line line-dashed b-b line-lg pull-in"></div>

                                        <div class="form-group">
                                            <div class="col-sm-2 control-label">上级菜单</div>
                                            <div class="col-sm-3">
                                                <input type="text" class="form-control" v-model="menu.parentName" :click="selectParentMenu"/>
                                                <div id="devTreeContent" style="position: absolute; background-color: #F0F6E4; z-index: 999">
                                                    <ul id="ztree" class="ztree"></ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="line line-dashed b-b line-lg pull-in"></div>

                                        <div v-if="menu.type == 1" class="form-group">
                                            <div class="col-sm-2 control-label">菜单URL</div>
                                            <div class="col-sm-3">
                                                <input type="text" class="form-control" v-model="menu.url" placeholder="菜单URL"/>
                                            </div>
                                        </div>
                                        <div class="line line-dashed b-b line-lg pull-in"></div>

                                        <div v-if="menu.type == 1 || menu.type == 2" class="form-group">
                                            <div class="col-sm-2 control-label">授权标识</div>
                                            <div class="col-sm-3">
                                                <input type="text" class="form-control" v-model="menu.perms" placeholder="多个用逗号分隔，如：user:list,user:create"/>
                                            </div>
                                        </div>
                                        <div class="line line-dashed b-b line-lg pull-in"></div>

                                        <div v-if="menu.type != 2" class="form-group">
                                            <div class="col-sm-2 control-label">排序号</div>
                                            <div class="col-sm-3">
                                                <input type="number" class="form-control" v-model="menu.orderNum" placeholder="排序号"/>
                                            </div>
                                        </div>
                                        <div class="line line-dashed b-b line-lg pull-in"></div>

                                        <div v-if="menu.type != 2" class="form-group">
                                            <div class="col-sm-2 control-label">图标</div>
                                            <div class="col-sm-3">
                                                <input type="text" class="form-control" v-model="menu.icon" placeholder="菜单图标"/>
                                                <code style="margin-top:4px;display: block;">获取图标：http://fontawesome.io/icons/</code>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <footer class="panel-footer bg-light lter">
                                    <button type="button" class="btn btn-success btn-s-xs col-lg-offset-2" @click="save">保存</button>
                                </footer>
                            </section>
                        </form>
                    </section>
                </section>
                <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open"
                   data-target="#nav,html"></a>
            </section>
        </section>
    </section>
</section>

<!-- footer -->
<script src="/assets/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/assets/js/bootstrap.js"></script>

<script src="/assets/js/bootstrap3-dialog/js/bootstrap-dialog.js"></script>
<script src="/assets/js/vue/vue.min.js"></script>
<script src="/assets/js/vee-validate/vee-validate.js"></script>
<script src="/assets/js/vee-validate/locale/zh_CN.js"></script>


<script src="/assets/js/zTree/js/jquery.ztree.all-3.5.js"></script>
<!-- App -->
<script src="/assets/js/app.js"></script>
<script src="/assets/js/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/assets/js/app.plugin.js"></script>

<script>

    var setting = {
        data: {
            simpleData: {
                enable: true
            }
        }
    };
    var ztree;

    $(document).ready(function () {
        var zNodes =[
            { id:1, pId:0, name:"随意勾选 1", open:true},
            { id:11, pId:1, name:"随意勾选 1-1", open:true},
            { id:111, pId:11, name:"随意勾选 1-1-1"},
            { id:112, pId:11, name:"随意勾选 1-1-2"},
            { id:12, pId:1, name:"随意勾选 1-2", open:true},
            { id:121, pId:12, name:"随意勾选 1-2-1"},
            { id:122, pId:12, name:"随意勾选 1-2-2"},
            { id:2, pId:0, name:"随意勾选 2", checked:true, open:true},
            { id:21, pId:2, name:"随意勾选 2-1"},
            { id:22, pId:2, name:"随意勾选 2-2", open:true},
            { id:221, pId:22, name:"随意勾选 2-2-1", checked:true},
            { id:222, pId:22, name:"随意勾选 2-2-2"},
            { id:23, pId:2, name:"随意勾选 2-3"}
        ];
        ztree = $.fn.zTree.init($("#ztree"), setting, zNodes);
    });



    //vue验证
    Vue.use(VeeValidate,{
        errorBagTag:"errors",
        locale:"zh_CN"
    });

    var vm = new Vue({
        el: "#app",
        data: {
            menu:{
                parentName:null,
                parentId:0,
                type:1,
                orderNum:0
            }
        },
        methods: {
            getMenu: function(menuId){
                //加载菜单树
//                $.get("/api/v1/menu/select", function(r){
//                    ztree = $.fn.zTree.init($("#menuTree"), setting, r.menuList);
//                    //var node = ztree.getNodeByParam("menuId", vm.menu.parentId);
//                    //ztree.selectNode(node);
//
//                    vm.menu.parentName = node.name;
//                })
            },
            selectParentMenu:function () {
                $("#devTreeContent").slideDown("fast");
            },
           save:function () {
                this.$validator.validateAll().then(function (result) {
                    if(result){
                        //提交
                        $.ajax({
                            url:"/api/v1/project/save",
                            type:"POST",
                            data:vm.project,
                            dataType:"json",
                            success:function(result){
                                location.href="/project/list";
                            },
                            error:function(xhr,textStatus){
                                console.log('错误')
                            }
                        })
                    }else{
                        BootstrapDialog.confirm({
                            title: '<i class="fa fa-info-circle fa-fw"></i> 系统提示',
                            message: '请检查表单数据是否填写正确',
                            type: "type-default",
                            closable: true,
                            draggable: true,
                            btnCancelLabel: '取消',
                            btnOKLabel: '确定',
                            btnOKClass: 'btn-info'
                        });
                    }
                });
           }
        }
    });

</script>
</body>
</html>