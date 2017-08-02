<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="app">
<head>
    <meta charset="utf-8"/>
    <title>项目管理系统测试</title>
    <jsp:include page="/WEB-INF/views/commons/head.jsp"/>
    <link href="/assets/css/app.css" rel="stylesheet"/>
</head>
<body>
<section id="app" class="m-t-lg wrapper-md animated fadeInUp">
    <div class="container aside-xxl">
        <a class="navbar-brand block">
            <span class="h1 font-bold">BBT</span>
        </a>
        <section class="m-b-lg">
            <section class="panel panel-primary">
                <header class="panel-heading">欢迎使用测试系统</header>
                <div class="panel-body">
                    <form class="bs-example form-horizontal">
                        <div class="form-group m-t-lg">
                            <label class="col-lg-2 control-label">账号</label>
                            <div class="col-lg-10">
                                <input type="text"
                                       class="form-control"
                                       name="username"
                                       v-model="username"
                                       v-validate="'required'">
                                <span class="help-block text-danger" v-show="errors.has('username')">
                                    {{errors.first('username')}}
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">密码</label>
                            <div class="col-lg-10">
                                <input type="password"
                                       class="form-control"
                                       name="password"
                                       v-model="password"
                                       v-validate="'required'">
                                <span class="help-block text-danger" v-show="errors.has('password')">
                                    {{errors.first('password')}}
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-10">
                                <div class="checkbox i-checks">
                                    <label>
                                        <input type="checkbox" checked><i></i> 七天免登录
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-10">
                                <button type="button" class="btn btn-primary" @click="login">登录系统</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="panel-footer">
                    <div class="text-center">
                        <small>北京波巴布信息技术有限公司 &copy; 2017</small>
                    </div>
                </div>
            </section>
        </section>
    </div>
</section>
<script src="/assets/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/assets/js/bootstrap.js"></script>
<script src="/assets/js/bootstrap3-dialog/js/bootstrap-dialog.js"></script>

<script src="/assets/js/vue/vue.min.js"></script>
<script src="/assets/js/vee-validate/vee-validate.js"></script>
<script src="/assets/js/vee-validate/locale/zh_CN.js"></script>
<!-- App -->
<script src="/assets/js/app.js"></script>
<script src="/assets/js/slimscroll/jquery.slimscroll.min.js"></script>
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
            username: "admin@valuelink.cn",
            password: "123456"
        },
        mounted: function () {

        },
        methods: {
            login: function () {
                this.$validator.validateAll().then(function (result) {
                    if (result) {
                        //提交
                        $.ajax({
                            url: "/api/v1/user/login",
                            type: "POST",
                            data: {username: vm.username, password: vm.password},
                            dataType: "json",
                            success: function (result) {
                                if(result.status==="SUCCESS"){
                                    location.href = "/dashboard";
                                }else{
                                    BootstrapDialog.confirm({
                                        title: '<i class="fa fa-info-circle fa-fw"></i> 系统提示',
                                        message: result.error,
                                        type: "type-default",
                                        size: "size-small",
                                        closable: true,
                                        draggable: true,
                                        btnCancelLabel: '取消',
                                        btnOKLabel: '确定',
                                        btnOKClass: 'btn-info'
                                    });
                                }
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
                            size: "size-small",
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