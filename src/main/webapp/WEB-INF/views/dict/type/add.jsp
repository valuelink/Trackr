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
                        <form class="form-horizontal">
                            <section class="panel panel-default">
                                <div class="panel-heading">
                                    <i class="fa fa-plus"></i> 增加字典
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">字典名称</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control"
                                                   name="name"
                                                   v-model="type.name"
                                                   v-validate="'required'">
                                              <span class="text-danger block" v-show="errors.has('name')">
                                                {{errors.first('name')}}
                                            </span>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">CODE</label>
                                        <div class="col-sm-3">
                                            <input type="text"
                                                   class="form-control"
                                                   name="code"
                                                   v-model="type.code"
                                                   v-validate="'required'">
                                             <span class="text-danger block" v-show="errors.has('code')">
                                                {{errors.first('code')}}
                                            </span>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>
                                </div>
                                <!-- /.panel-body -->
                                <footer class="panel-footer bg-light lter">
                                    <button type="button" class="btn btn-info btn-s-xs col-lg-offset-2" @click="save">
                                        保存
                                    </button>
                                </footer>
                            </section>
                        </form>
                        <!-- /.panel -->
                    </section>
                </section>
                <a href="#"
                   class="hide nav-off-screen-block"
                   data-toggle="class:nav-off-screen,open"
                   data-target="#nav,html">
                </a>
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

<script src="/assets/js/slimscroll/jquery.slimscroll.min.js"></script>
<!-- App -->
<script src="/assets/js/app.js"></script>
<script src="/assets/js/app.plugin.js"></script>
<script>
    //vue验证
    Vue.use(VeeValidate, {
        errorBagTag: "errors",
        locale: "zh_CN"
    });
    var vm = new Vue({
        el: "#app",
        data: {
            type: {
                name: "",
                code: ""
            }
        },
        methods: {
            add: function () {
                $('#addModal').modal('show');
            },
            save: function () {
                this.$validator.validateAll().then(function (result) {
                    if (result) {
                        $.ajax({
                            url: "/api/v1/dict/type/save",
                            type: "POST",
                            data: vm.type,
                            dataType: "json",
                            success: function (result) {
                                location.href = "/dict/type/list";
                            },
                            error: function (xhr, textStatus) {
                                console.log('错误')
                            }
                        })
                    } else {
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