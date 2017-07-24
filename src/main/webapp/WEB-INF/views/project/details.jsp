<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="app">
<head>
    <meta charset="utf-8"/>
    <title>立项申请 - 项目管理系统测试</title>
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
                                <i class="fa fa-list"></i> 项目详情
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <form role="form" action="/jobCode/updateGroup" class="form-horizontal" method="POST">
                                    <div class="clearfix">
                                        <fieldset>
                                            <legend>
                                                <h4>
                                                    <i class="glyphicon glyphicon-plus-sign"></i>
                                                    王坤项目借款申请
                                                    <small>详细信息</small>
                                                </h4>
                                            </legend>
                                            <div class="form-group clearfix">
                                                <label class="col-sm-2 control-label">项目名称 </label>
                                                <div class="col-sm-3">
                                                    <p class="form-control-static">{{project.name}}</p>
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group clearfix">
                                                <label class="col-sm-2 control-label">客户名称 </label>
                                                <div class="col-sm-3">
                                                    <p class="form-control-static">{{project.companyId}}</p>
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">项目金额</label>
                                                <div class="col-sm-3">
                                                    <p class="form-control-static">{{project.amount}}</p>
                                                </div>
                                                <label class="col-sm-2 control-label">财务风险等级</label>
                                                <div class="col-sm-3">
                                                    <p class="form-control-static">财务风险等级</p>
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">经济行为</label>
                                                <div class="col-sm-3">
                                                    <p class="form-control-static">{{project.economicBehavior}}</p>
                                                </div>
                                                <label class="col-sm-2 control-label">评估目的</label>
                                                <div class="col-sm-3">
                                                    <p class="form-control-static">评估目的</p>
                                                </div>
                                            </div>

                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">评估基准日</label>
                                                <div class="col-sm-3">
                                                    <p class="form-control-static">{{project.valuateTime}}</p>
                                                </div>
                                                <label class="col-sm-2 control-label">受托方</label>
                                                <div class="col-sm-3">
                                                    <p class="form-control-static">评估目的</p>
                                                </div>
                                            </div>

                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">项目合伙人</label>
                                                <div class="col-sm-3">
                                                    <p class="form-control-static">{{project.partnerId}}</p>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                </form>
                            </div>
                            <!-- /.panel-body -->
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-list"></i> 审批流程
                            </div>
                            <div class="panel-body">
                                <img :src="'/workflow/diagram?processInstanceId='+project.processInstanceId" v-if="project.processInstanceId!=null">
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-list"></i> 审批历史记录
                            </div>
                            <div class="panel-body">
                                <table class="table table-bordered table-condensed table-responsive">
                                    <thead>
                                    <tr>
                                        <th style="width:150px;">审批节点</th>
                                        <th>操作人</th>
                                        <th>审批时间</th>
                                        <th>任务创建时间</th>
                                        <th>审批结果</th>
                                        <th>意见</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="historic in historicTasks">
                                        <td>{{historic.name}}</td>
                                        <td>{{historic.assignee}}</td>
                                        <td>{{historic.endTime}}</td>
                                        <td>{{historic.startTime}}</td>
                                        <td>
                                            <span class="label label-success" v-show="historic.approvalType=='APPROVE'">审批通过</span>
                                            <span class="label label-danger" v-show="historic.approvalType=='REJECT'">审批驳回</span>
                                        </td>
                                        <td>{{historic.comment}}</td>
                                    </tr>
                                    </tbody>
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
<!-- App -->
<script src="/assets/js/app.js"></script>
<script src="/assets/js/app.plugin.js"></script>

<script>
    var vm = new Vue({
        el: "#app",
        data: {
            id: "${id}",
            project: {},
            historicTasks: []
        },
        created: function () {
            this.queryDetail();
        },
        methods: {
            queryDetail: function () {
                var _self = this;
                //console.log(_self.id)
                $.ajax({
                    url: "/api/v1/project/details/" + _self.id,
                    type: "GET",
                    dataType: "json",
                    success: function (result) {
                        vm.project = result.data.project;
                        vm.historicTasks = result.data.historicTasks;
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