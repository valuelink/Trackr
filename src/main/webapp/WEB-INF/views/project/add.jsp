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
<body class="">
<section class="vbox">
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
                                    <span class="h4"><span class="fa fa-plus"></span> 立项申请</span>
                                </header>
                                <div class="panel-body">

                                    <div class="form-group">
                                        <label for="name" class="col-sm-2 control-label">项目名称 </label>
                                        <div class="col-sm-3">
                                            <input class="form-control" id="name" name="user.name" placeholder="项目名称"/>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group">
                                        <label for="email" class="col-sm-2 control-label">客户名称</label>
                                        <div class="col-sm-3">
                                            <input class="form-control" id="email" name="user.loginName"
                                                   placeholder="客户名称"/>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group clearfix">
                                        <label for="riskLevel" class="col-sm-2 control-label">财务风险等级</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" name="riskLevel" id="riskLevel">
                                                <option value="1">新客户未上市</option>
                                                <option value="2">老客户未上市</option>
                                                <option value="3">新客户已上市</option>
                                                <option value="4">老客户已上市</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group clearfix">
                                        <label for="position" class="col-sm-2 control-label">经济行为</label>
                                        <div class="col-sm-3">
                                            <input class="form-control" id="email" name="user.loginName"
                                                   placeholder="客户名称"/>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group clearfix">
                                        <label for="purposeType" class="col-sm-2 control-label"> 评估目的</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" name="purposeType" id="purposeType">
                                                <option value="1">法定用途</option>
                                                <option value="2">交易支持</option>
                                                <option value="3">财务报告</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label"> 评估内容</label>
                                        <div class="col-sm-2">
                                            <div class="checkbox i-checks">
                                                <label>
                                                    <input type="checkbox" name="department" checked value=""><i></i>
                                                    企业价值
                                                </label>
                                            </div>
                                            <div class="checkbox i-checks">
                                                <label>
                                                    <input type="checkbox" name="department" value=""><i></i> 单项资产-物业
                                                </label>
                                            </div>
                                            <div class="checkbox i-checks">
                                                <label>
                                                    <input type="checkbox" name="department" value=""><i></i> 资产组合
                                                </label>
                                            </div>
                                            <div class="checkbox i-checks">
                                                <label>
                                                    <input type="checkbox" name="department" value=""><i></i> 无形资产
                                                </label>
                                            </div>
                                            <div class="checkbox i-checks">
                                                <label>
                                                    <input type="checkbox" name="department" value=""><i></i> 金融不良资产
                                                </label>
                                            </div>
                                            <div class="checkbox i-checks">
                                                <label>
                                                    <input type="checkbox" name="department" value=""><i></i> 珠宝首饰艺术品
                                                </label>
                                            </div>
                                            <div class="checkbox i-checks">
                                                <label>
                                                    <input type="checkbox" name="department" value=""><i></i> 其他（需描述)
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="checkbox i-checks">
                                                <label>
                                                    <input type="checkbox" name="department" value=""><i></i> 固定资产
                                                </label>
                                            </div>
                                            <div class="checkbox i-checks">
                                                <label>
                                                    <input type="checkbox" name="department" value=""><i></i> 优先股
                                                </label>
                                            </div>
                                            <div class="checkbox i-checks">
                                                <label>
                                                    <input type="checkbox" name="department" value=""><i></i> 期权
                                                </label>
                                            </div>
                                            <div class="checkbox i-checks">
                                                <label>
                                                    <input type="checkbox" name="department" value=""><i></i> 涡轮
                                                </label>
                                            </div>
                                            <div class="checkbox i-checks">
                                                <label>
                                                    <input type="checkbox" name="department" value=""><i></i> 可转债
                                                </label>
                                            </div>
                                            <div class="checkbox i-checks">
                                                <label>
                                                    <input type="checkbox" name="department" value=""><i></i> 其他金融资产
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">报告类型</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" name="reportType" id="reportType">
                                                <option value="1">评估报告</option>
                                                <option value="2">咨询报告</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label"> 评估基准日</label>
                                        <div class="col-sm-3">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="_valuateTime"
                                                       name="_valuateTime" value="" readonly="readonly">
                                                <span class="input-group-addon" id="clearTimeBtn"
                                                      style="cursor:pointer;">X</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">受托方</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" name="reportType" id="reportType">
                                                <option value="1">评估报告</option>
                                                <option value="2">咨询报告</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">报告出具公司</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" name="reportType" id="reportType">
                                                <option value="1">评估报告</option>
                                                <option value="2">咨询报告</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>


                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">项目合伙人</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" name="reportType" id="reportType">
                                                <option value="1">评估报告</option>
                                                <option value="2">咨询报告</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                </div>
                                <footer class="panel-footer bg-light lter">
                                    <button type="submit" class="btn btn-success btn-s-xs col-lg-offset-2">保存</button>
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
<!-- App -->
<script src="/assets/js/app.js"></script>
<script src="/assets/js/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/assets/js/app.plugin.js"></script>

</body>
</html>