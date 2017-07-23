<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="app">
<head>
    <meta charset="utf-8"/>
    <title>立项申请 - 项目管理系统测试</title>
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
                        <form class="form-horizontal" data-validate="parsley" action="/project/save" method="post">
                            <section class="panel panel-default">
                                <header class="panel-heading">
                                    <span class="h4">
                                        <i class="fa fa-plus"></i>
                                        立项申请</span>
                                </header>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">项目名称 </label>
                                        <div class="col-sm-3">
                                            <input class="form-control" name="name" v-model="project.name" v-validate="'required'"/>
                                            <span class="text-danger block" v-show="errors.has('name')">
                                                {{errors.first('name')}}
                                            </span>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">客户名称</label>
                                        <div class="col-sm-3">
                                            <input class="form-control" v-model="project.companyId"/>
                                        </div>
                                    </div>

                                    <div class="line line-dashed b-b line-lg pull-in"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">项目金额</label>
                                        <div class="col-sm-3">
                                            <input class="form-control" v-model="project.amount"/>
                                        </div>
                                    </div>

                                    <div class="line line-dashed b-b line-lg pull-in"></div>
                                    <div class="form-group clearfix">
                                        <label class="col-sm-2 control-label">财务风险等级</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" v-model="project.riskLevel">
                                                <option value="1">新客户未上市</option>
                                                <option value="2">老客户未上市</option>
                                                <option value="3">新客户已上市</option>
                                                <option value="4">老客户已上市</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group clearfix">
                                        <label class="col-sm-2 control-label">经济行为</label>
                                        <div class="col-sm-3">
                                            <input class="form-control" v-model="project.economicBehavior"/>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group clearfix">
                                        <label class="col-sm-2 control-label"> 评估目的</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" v-model="project.purpose">
                                                <option value="1">法定用途</option>
                                                <option value="2">交易支持</option>
                                                <option value="3">财务报告</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label"> 评估基准日</label>
                                        <div class="col-sm-3">
                                            <div class="input-group">
                                                <input type="text" class="form-control" v-model="project.valuateTime">
                                                <span class="input-group-addon" id="clearTimeBtn">X</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">受托方</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" v-model="project.reportType">
                                                <option value="1">评估报告</option>
                                                <option value="2">咨询报告</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">报告出具公司</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" v-model="project.reportId">
                                                <option value="1">评估报告</option>
                                                <option value="2">咨询报告</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>


                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">项目合伙人</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" v-model="project.partnerId">
                                                <option value="1">合伙人1</option>
                                                <option value="2">合伙人2</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

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
<!-- App -->
<script src="/assets/js/app.js"></script>
<script src="/assets/js/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/assets/js/app.plugin.js"></script>

<script>
    //vue验证
    Vue.use(VeeValidate,{
        errorBagTag:"errors",
        locale:"zh_CN"
    });

    var vm = new Vue({
        el: "#app",
        data: {
            project:{
                id:"",
                name:"测试项目名称",
                amount:"0",
                companyId:"1",
                riskLevel:"1",
                economicBehavior:"测试经济行为",
                purpose:"1",
                valuateTime:"2017,2018",
                reportType:"1",
                reportId:"1",
                partnerId:"1"
            }
        },
        methods: {
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