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
                                                    <p class="form-control-static">${project.name}</p>
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
                                <img src="/workflow/diagram?executionId=${execution.id}">
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-list"></i> 审批历史记录
                            </div>
                            <div class="panel-body">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>审批节点</th>
                                        <th>操作人</th>
                                        <th>审批时间</th>
                                        <th>任务创建时间</th>
                                        <th>意见</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${historicTasks}" var="historic">
                                        <tr>
                                            <td>${historic.name}</td>
                                            <td>${historic.assignee}</td>
                                            <td><fmt:formatDate value="${historic.endTime}" pattern="yyyy-MM-dd HH:mm" /></td>
                                            <td><fmt:formatDate value="${historic.startTime}" pattern="yyyy-MM-dd HH:mm" /></td>
                                            <td></td>
                                        </tr>
                                    </c:forEach>
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