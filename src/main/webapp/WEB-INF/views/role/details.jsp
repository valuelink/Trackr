<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="app">
<head>
    <meta charset="utf-8"/>
    <title>权限管理 - 项目管理系统测试</title>
    <jsp:include page="/WEB-INF/views/commons/head.jsp"/>
    <link href="/assets/css/app.css" rel="stylesheet"/>
</head>
<body class="">
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
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-list"></i> 角色权限控制
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <form role="form" class="form-horizontal">
                                    <fieldset>
                                        <legend>
                                            <h4>
                                                <i class="icon icon-film"></i>
                                                <small> 详细信息</small>
                                            </h4>
                                        </legend>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">角色名称 </label>
                                            <div class="col-sm-3">
                                                <p class="form-control-static">{{role.name}}</p>
                                            </div>
                                        </div>
                                        <div class="line line-dashed b-b line-lg pull-in"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">角色描述 </label>
                                            <div class="col-sm-3">
                                                <p class="form-control-static">{{role.description}}</p>
                                            </div>
                                        </div>
                                    </fieldset>
                                </form>
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-list"></i> 权限信息
                            </div>
                            <div class="panel-body">
                                <form role="form" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label text-black dker">立项管理</label>
                                        <div class="col-sm-10">
                                            <label class="checkbox-inline i-checks">
                                                <input type="checkbox" name="authority" v-model="role.authorities"
                                                       value="project:create"><i></i>申请立项
                                            </label>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label text-black dker">员工管理</label>
                                        <div class="col-sm-10">
                                            <label class="checkbox-inline i-checks">
                                                <input type="checkbox" name="authority" v-model="role.authorities"
                                                       value="employee:add"><i></i>
                                                添加新员工
                                            </label>
                                            <label class="checkbox-inline i-checks">
                                                <input type="checkbox" name="authority" v-model="role.authorities"
                                                       value="employee:edit"><i></i>
                                                修改员工数据
                                            </label>
                                            <label class="checkbox-inline i-checks">
                                                <input type="checkbox" name="authority" v-model="role.authorities"
                                                       value="employee:resetpwd"><i></i> 重置员工密码
                                            </label>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>
                                </form>
                            </div>
                            <div class="panel-footer">
                                <button type="button" class="btn btn-success btn-s-xs col-lg-offset-2" @click="save">
                                    保存
                                </button>
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
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
<script src="/assets/js/slimscroll/jquery.slimscroll.min.js"></script>
<!-- App -->
<script src="/assets/js/app.js"></script>
<script src="/assets/js/app.plugin.js"></script>

<script>
    var vm = new Vue({
        el: "#app",
        data: {
            role: {
                id: ${id},
                name: "",
                description: "",
                authorities: []
            }
        },
        created: function () {
            this.queryDetail();
        },
        methods: {
            queryDetail: function () {
                var _self = this;
                //console.log(_self.id)
                $.ajax({
                    url: "/api/v1/role/details/" + _self.role.id,
                    type: "GET",
                    dataType: "json",
                    success: function (result) {
                        vm.role.name = result.data.role.name;
                        vm.role.description = result.data.role.description;
                        vm.role.authorities = result.data.role.authorities;
                    },
                    error: function (xhr, textStatus) {
                        console.log('错误')
                    }
                })
            },
            save: function () {
                $.ajax({
                    url: "/api/v1/role/update",
                    type: "POST",
                    data: JSON.stringify(vm.role),
                    contentType: 'application/json',
                    success: function (result) {
                        BootstrapDialog.confirm({
                            title: '<i class="fa fa-info-circle fa-fw"></i> 系统提示',
                            message: '修改成功',
                            size: "size-small",
                            type: "type-default",
                            closable: true,
                            draggable: true,
                            btnCancelLabel: '取消',
                            btnOKLabel: '确定',
                            btnOKClass: 'btn-info',
                            callback: function () {
                                location.href = "/role/list";
                            }
                        });
                    },
                    error: function (xhr, textStatus) {
                        console.log('错误')
                    }
                })
            }
        }
    });
</script>
</body>
</html>