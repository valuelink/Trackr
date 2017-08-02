<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="app">
<head>
    <title>用户列表-项目管理系统</title>
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
                                <i class="fa fa-list"></i> 字典数据列表
                                <div class="pull-right">
                                    <a href="javascript:void(0);" class="btn btn-success btn-xs" @click="add">
                                        <i class="fa fa-plus"></i> 增加字典
                                    </a>
                                </div>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <table id="dataTables" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>名称</th>
                                        <th>code</th>
                                        <th>描述</th>
                                        <th>启用</th>
                                        <th>创建时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tr v-for="dict in dicts">
                                        <td>{{ dict.id }}</td>
                                        <td>{{ dict.name }}</td>
                                        <td>{{ dict.code }}</td>
                                        <td>{{dict.description}}</td>
                                        <td>
                                            <span class="label label-warning ml5" v-show="!dict.active">否</span>
                                            <span class="label label-success ml5" v-show="dict.active">是</span>
                                        </td>
                                        <td>{{dict.createTime}}</td>
                                        <td>
                                            <a class="btn btn-info" @click="edit(dict)">修改</a>
                                            <a class="btn btn-danger"
                                               v-show="dict.active"
                                               @click="toggleActive(dict.id)"
                                               :disabled="toggleActiveId==dict.id">停用</a>
                                            <a class="btn btn-warning"
                                               v-show="!dict.active"
                                               @click="toggleActive(dict.id)"
                                               :disabled="toggleActiveId==dict.id">启用</a>
                                        </td>
                                    </tr>
                                </table>
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

    <%--增加字典 MODAL--%>
    <div id="formModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">添加字典</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label">字典名称</label>
                            <input type="text" class="form-control" name="dict.name" v-model="dict.name"/>
                        </div>
                        <div class="form-group">
                            <label class="control-label">code</label>
                            <input type="text" class="form-control" name="code" v-model="dict.code"/>
                        </div>
                        <div class="form-group">
                            <label class="control-label">描述</label>
                            <textarea class="form-control" name="description" v-model="dict.description"></textarea>
                        </div>
                    </form>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" @click="saveOrUpdate" :disabled="submitDisabled">提交
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div><!-- /.modal -->
</section>
<!-- footer -->


<script src="/assets/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/assets/js/bootstrap.js"></script>

<script src="/assets/js/vue/vue.min.js"></script>
<script src="/assets/js/slimscroll/jquery.slimscroll.min.js"></script>

<script src="/assets/js/format.js"></script>
<!-- App -->
<script src="/assets/js/app.js"></script>
<script src="/assets/js/app.plugin.js"></script>
<script>
    var vm = new Vue({
        el: "#app",
        data: {
            id: "${id}",
            dictType: {},
            dict: {},
            dicts: [],
            submitDisabled: false,
            toggleActiveId: ""
        },
        created: function () {
            this.queryDetails();
        },
        methods: {
            queryDetails: function () {
                var _self = this;
                $.ajax({
                    url: "/api/v1/dict/type/details/" + _self.id,
                    type: "GET",
                    dataType: "json",
                    success: function (result) {
                        vm.dictType = result.data.details;
                        vm.dicts = result.data.details.dicts;
                    },
                    error: function (xhr, textStatus) {
                        console.log('错误')
                    }
                })
            },
            add: function () {
                this.dict = {};//如果是新增把对象设置空
                $("#formModal").modal("show");
            },
            edit: function (dict) {
                this.dict = dict;
                $("#formModal").modal("show");
            },
            saveOrUpdate: function () {
                vm.submitDisabled = true;
                vm.dict.typeId = this.id;//设置typeID
                $.ajax({
                    url: "/api/v1/dict/saveOrUpdate",
                    type: "POST",
                    data: vm.dict,
                    dataType: "json",
                    success: function (result) {
                        vm.queryDetails();
                        vm.submitDisabled = false;
                        $("#formModal").modal("hide");
                    },
                    error: function (xhr, textStatus) {
                        console.log('错误')
                    }
                });
            },
            toggleActive: function (dictId) {
                vm.toggleActiveId = dictId;
                $.ajax({
                    url: "/api/v1/dict/toggleActive/" + dictId,
                    type: "GET",
                    dataType: "json",
                    success: function (result) {
                        vm.queryDetails();
                        vm.toggleActiveId = "0";
                    },
                    error: function (xhr, textStatus) {
                        console.log('错误')
                    }
                });
            }
        }
    });

    $(document).ready(function () {

    });
</script>
</body>
</html>