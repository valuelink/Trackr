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
<section id="app" class="vbox">
    <jsp:include page="/WEB-INF/views/commons/header.jsp"/>
    <section>
        <section class="hbox stretch">
            <!-- .aside -->
            <jsp:include page="/WEB-INF/views/commons/sidebar.jsp"/>
            <!-- /.aside -->
            <section>
                <section class="vbox">
                    <section class="scrollable wrapper bg-white-only">
                        <form class="form-horizontal">
                            <section class="panel panel-default">
                                <header class="panel-heading">
                                    <span class="h4"><span class="fa fa-plus"></span> 用户详情</span>
                                </header>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">账户 </label>
                                        <div class="col-sm-3">
                                            <p class="form-control-static text-danger">{{user.loginName}}</p>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">姓名 </label>
                                        <div class="col-sm-3">
                                            <input class="form-control" name="realName" v-model="user.realName"/>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">
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
                                            <input class="form-control" name="companyEmail"
                                                   v-model="user.companyEmail"/>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group clearfix">
                                        <label class="col-sm-2 control-label">登录手机</label>
                                        <div class="col-sm-3">
                                            <input class="form-control" name="mobile" v-model="user.mobile"/>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group clearfix">
                                        <label class="col-sm-2 control-label">职务</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" name="user.position" v-model="user.position">
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
                                        <label class="col-sm-2 control-label">分公司</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" name="subCompany" v-model="user.subCompany">
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
                                                    <input type="radio" name="gender" v-model="user.gender" value="0">
                                                    <i></i> 男
                                                </label>
                                            </div>
                                            <div class="radio i-checks">
                                                <label>
                                                    <input type="radio" name="gender" v-model="user.gender" value="1">
                                                    <i></i> 女
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">角色</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" v-model="user.role.id">
                                                <option :value="role.id" v-for="role in roles">{{role.name}}</option>
                                            </select>
                                            <label class="checkbox i-checks">
                                                <input type="checkbox" name="authority" v-model="user.authorities"
                                                       value="competitor:grant"><i></i>
                                                可分配潜在客户记录权限
                                            </label>
                                            <label class="checkbox i-checks">
                                                <input type="checkbox" name="authority" v-model="user.authorities"
                                                       value="competitor:view"><i></i>
                                                拥有潜在客户记录权限
                                            </label>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                </div>
                                <footer class="panel-footer bg-light lter">
                                    <button type="button" class="btn btn-info btn-s-xs col-lg-offset-2" @click="save">
                                        保存
                                    </button>
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
<!-- App -->
<script src="/assets/js/app.js"></script>
<script src="/assets/js/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/assets/js/app.plugin.js"></script>
<script>
    var vm = new Vue({
        el: "#app",
        data: {
            id: ${id},
            user: {
                role: {}//如果取的二级对象 一定要设置初始化
            },
            roles: []
        },
        created: function () {
            this.queryRoles();
            this.queryDetails();
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
            queryDetails: function () {
                var _self = this;
                $.ajax({
                    url: "/api/v1/user/details/" + _self.id,
                    type: "GET",
                    dataType: "json",
                    success: function (result) {
                        _self.user = result.data.user;
                    },
                    error: function (xhr, textStatus) {
                        console.log('错误')
                    }
                })
            },
            save: function () {
                $.ajax({
                    url: "/api/v1/user/update",
                    type: "POST",
                    data: JSON.stringify(vm.user),
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
                                location.href = "/user/list";
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