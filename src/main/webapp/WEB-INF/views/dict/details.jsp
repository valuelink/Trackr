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
                                    <a href="/code/add" class="btn btn-success btn-xs">
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
                                        <th>描述</th>
                                        <th>启用</th>
                                        <th>创建时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tr v-for="dict in dicts">
                                        <td>{{ dict.id }}</td>
                                        <td>{{ dict.name }}</td>
                                        <td>{{dict.description}}</td>
                                        <td>
                                            <span class="label label-success ml5" v-show="!dict.active">否</span>
                                            <span class="label label-success ml5" v-show="dict.active">是</span>
                                        </td>
                                        <td>{{dict.createTime}}</td>
                                        <td>
                                            <a class="btn btn-primary" v-bind:href="'/dict/edit/'+dict.id">修改</a>
                                            <a class="btn btn-warning" v-show="dict.active">停用</a>
                                            <a class="btn btn-primary" v-show="!dict.active">启用</a>
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
            dicts: []
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
            }
        }
    });

    $(document).ready(function () {

    });
</script>
</body>
</html>