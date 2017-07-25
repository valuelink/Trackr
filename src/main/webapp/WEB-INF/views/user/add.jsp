<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <meta charset="utf-8"/>
    <title>项目管理系统测试</title>
    <jsp:include page="/WEB-INF/views/commons/head.jsp"/>
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
                        <form class="form-horizontal" data-validate="parsley">
                            <section class="panel panel-default">
                                <header class="panel-heading">
                                    <span class="h4"><span class="fa fa-plus"></span> 新建用户</span>
                                </header>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label for="name" class="col-sm-2 control-label">姓名 </label>
                                        <div class="col-sm-3">
                                            <input class="form-control" id="name" name="user.name" placeholder="请输入名字"/>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group">
                                        <label for="email" class="col-sm-2 control-label">
                                            登录邮箱
                                            <i class="icon icon-question"
                                               data-container="body"
                                               data-trigger="hover"
                                               data-toggle="popover"
                                               data-placement="top"
                                               data-content="在PC端用户只能通过该邮箱账号登录系统."
                                               title="公司邮箱"></i>
                                        </label>
                                        <div class="col-sm-3">
                                            <input class="form-control" id="email" name="user.loginName"
                                                   placeholder="请输入邮箱"/>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group clearfix">
                                        <label for="mobile" class="col-sm-2 control-label">登录手机</label>
                                        <div class="col-sm-3">
                                            <input class="form-control" id="mobile" name="user.mobile"
                                                   placeholder="请输入手机"/>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group clearfix">
                                        <label for="position" class="col-sm-2 control-label">职务</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" id="position" name="user.position">
                                                <option value="总监">总监</option>
                                                <option value="行政">行政</option>
                                                <option value="合伙人">合伙人</option>
                                                <option value="评估助理">评估助理</option>
                                                <option value="评估助理经理">评估助理经理</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group clearfix">
                                        <label for="subCompany" class="col-sm-2 control-label">分公司</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" id="subCompany" name="user.subCompany">
                                                <option value="BJ">北京</option>
                                                <option value="SH">上海</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">部门

                                        </label>
                                        <div class="col-sm-3">
                                            <div class="checkbox i-checks">
                                                <label>
                                                    <input type="checkbox" name="department" checked value=""><i></i>
                                                    法定部门
                                                </label>
                                            </div>
                                            <div class="checkbox i-checks">
                                                <label>
                                                    <input type="checkbox" name="department" value=""><i></i> 咨询部门
                                                </label>
                                            </div>
                                            <div class="checkbox i-checks">
                                                <label>
                                                    <input type="checkbox" name="department" value=""><i></i> 财务部门
                                                </label>
                                            </div>
                                            <div class="checkbox i-checks">
                                                <label>
                                                    <input type="checkbox" name="department" value="">
                                                    <i></i> 物业部门
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">性别</label>
                                        <div class="col-sm-3">
                                            <div class="radio i-checks">
                                                <label>
                                                    <input type="radio" name="gender" checked value="MALE">
                                                    <i></i> 男
                                                </label>
                                            </div>
                                            <div class="radio i-checks">
                                                <label>
                                                    <input type="radio" name="gender" value="FEMALE">
                                                    <i></i> 女
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">角色</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" v-model="">
                                                <option :value="role.id" v-for="role in roles">{{role.name}}</option>
                                            </select>
                                            <label class="checkbox i-checks">
                                                <input type="checkbox" name="authority" value="competitor:grant"><i></i>
                                                可分配潜在客户记录权限
                                            </label>
                                            <label class="checkbox i-checks">
                                                <input type="checkbox" name="authority" value="competitor:view"><i></i>
                                                拥有潜在客户记录权限
                                            </label>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                </div>
                                <footer class="panel-footer bg-light lter">
                                    <button type="submit" class="btn btn-info btn-s-xs col-lg-offset-2">保存</button>
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
            user: {
                id: "",
                name: "测试项目名称",
                amount: "0",
                companyId: "1",
                riskLevel: "1",
                economicBehavior: "测试经济行为",
                purpose: "1",
                valuateTime: "2017,2018",
                reportType: "1",
                reportId: "1",
                partnerId: "1"
            },
            roles: []
        },
        created: function () {
            this.queryRoles();
        },
        mounted: function () {

        },
        methods: {
            queryRoles: function () {
                var _self = this;
                $.ajax({
                    url: "/api/v1/role/all",
                    type: "GET",
                    dataType: "json",
                    success: function (result) {
                        _self.roles = result.data.roles;
                    },
                    error: function (xhr, textStatus) {
                        console.log('错误')
                    }
                })
            },
            save: function () {
                this.$validator.validateAll().then(function (result) {
                    if (result) {
                        //提交
                        $.ajax({
                            url: "/api/v1/project/save",
                            type: "POST",
                            data: vm.project,
                            dataType: "json",
                            success: function (result) {
                                location.href = "/project/list";
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