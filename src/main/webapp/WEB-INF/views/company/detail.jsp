<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="app">
<head>
    <meta charset="utf-8"/>
    <title>客户详情 - 项目管理系统测试</title>
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
                                <i class="fa fa-list"></i> 客户详细信息
                                <a href="javascript:void(0);" class="pull-right"><i class="fa fa-edit"></i></a>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <form class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">公司简称 </label>
                                        <div class="col-sm-3">
                                            <p class="form-control-static">{{company.abbrName}}</p>
                                        </div>

                                        <label class="col-sm-2 control-label">所在地 </label>
                                        <div class="col-sm-3">
                                            <p class="form-control-static">{{company.cityId}}</p>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">公司全称</label>
                                        <div class="col-sm-3">
                                            <p class="form-control-static">{{company.companyName}}</p>
                                        </div>
                                        <label class="col-sm-2 control-label">地址</label>
                                        <div class="col-sm-3">
                                            <p class="form-control-static">{{company.address}}</p>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>


                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">客户编号</label>
                                        <div class="col-sm-3">
                                            <p class="form-control-static">{{company.companyNumber}}</p>
                                        </div>
                                        <label class="col-sm-2 control-label">组邮箱</label>
                                        <div class="col-sm-3">
                                            <p class="form-control-static">{{company.email}}</p>
                                        </div>
                                    </div>

                                    <div class="line line-dashed b-b line-lg pull-in"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">所在行业</label>
                                        <div class="col-sm-3">
                                            <p class="form-control-static">{{company.industryId}}</p>
                                        </div>
                                        <label class="col-sm-2 control-label">创建人</label>
                                        <div class="col-sm-3">
                                            <p class="form-control-static">{{company.creator.realName}}</p>
                                        </div>
                                    </div>

                                    <div class="line line-dashed b-b line-lg pull-in"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">签约代号</label>
                                        <div class="col-sm-3">
                                            <p class="form-control-static">{{company.signCode}}</p>
                                        </div>

                                        <label class="col-sm-2 control-label">最后修改时间</label>
                                        <div class="col-sm-3">
                                            <p class="form-control-static">{{company.updateTime}}</p>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!-- /.panel-body -->
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-list"></i> 合同列表
                                <span class="badge badge-sm up bg-danger count">{{contracts.length}}</span>
                            </div>
                            <div class="panel-body">
                                <table class="table table-bordered table-condensed table-responsive">
                                    <thead>
                                    <tr>
                                        <th>合同编号</th>
                                        <th>合同名称</th>
                                        <th>金额</th>
                                        <th>合同状态</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="contract in contracts">
                                        <td>{{contract.contractNumber}}</td>
                                        <td>{{contract.contractName}}</td>
                                        <td>{{contract.amount}}</td>
                                        <td>{{contract.status}}</td>
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
            company: {},
            contracts: []
        },
        created: function () {
            this.queryDetail();
        },
        methods: {
            queryDetail: function () {
                var _self = this;
                $.ajax({
                    url: "/api/v1/company/detail/" + _self.id,
                    type: "GET",
                    dataType: "json",
                    success: function (result) {
                        vm.company = result.data.company;
                        vm.contracts = result.data.contracts;
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