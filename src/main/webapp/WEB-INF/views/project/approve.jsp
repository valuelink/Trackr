<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-list"></i> 立项审批
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
                                                <label class="col-sm-2 control-label">xxx项目借款申请 </label>
                                                <div class="col-sm-3">
                                                    <p class="form-control-static">项目名称</p>
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group clearfix">
                                                <label class="col-sm-2 control-label">项目邮件组 </label>
                                                <div class="col-sm-3">
                                                    <p class="form-control-static">项目邮件组</p>
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">底稿提交客户时间</label>
                                                <div class="col-sm-3">
                                                    <p class="form-control-static">底稿提交客户时间</p>
                                                </div>
                                                <label class="col-sm-2 control-label">底稿提交审核时间</label>
                                                <div class="col-sm-3">
                                                    <p class="form-control-static">底稿提交审核时间</p>
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">报告草稿提交客户时间</label>
                                                <div class="col-sm-3">
                                                    <p class="form-control-static">报告草稿提交客户时间</p>
                                                </div>
                                                <label class="col-sm-2 control-label">报告草稿提交审核时间</label>
                                                <div class="col-sm-3">
                                                    <p class="form-control-static">报告草稿提交客户时间</p>
                                                </div>
                                            </div>
                                            <div class="line line-dashed b-b line-lg pull-in"></div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">审批备注</label>
                                                <div class="col-sm-8">
                                                    <textarea class="form-control parsley-validated" rows="6" cols="100" data-minwords="6"  placeholder="审批备注"></textarea>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                </form>
                            </div>
                            <!-- /.panel-body -->
                            <div class="panel-footer">
                                <button class="col-sm-offset-1 btn btn-success">审批通过</button>
                                <button class="btn btn-danger">审批驳回</button>
                            </div>
                        </div>
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
<script src="/assets/js/slimscroll/jquery.slimscroll.min.js"></script>
<!-- App -->
<script src="/assets/js/app.js"></script>
<script src="/assets/js/app.plugin.js"></script>

<script>
    $(document).ready(function () {

    });
</script>
</body>
</html>