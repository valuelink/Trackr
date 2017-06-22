<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="app">
<head>
    <title>用户列表-项目管理系统</title>
    <jsp:include page="/WEB-INF/views/commons/head.jsp"/>

    <link href="/assets/js/fileinput-4.4.1/css/fileinput.css"
          rel="stylesheet"/>
    <%--<link href="/assets/js/fileinput-4.4.1/themes/explorer/theme.css" rel="stylesheet"/>--%>

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
                                <i class="fa fa-list"></i> 用户数据列表
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="well form-inline">
                                    <input id="processUpload" type="file" name="file" class="input-lg">
                                </div>
                                <table width="100%" class="table table-striped table-bordered table-hover"
                                       id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>流程ID</th>
                                        <th>流程名称</th>
                                        <th>流程版本</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="process" items="${list}">
                                        <tr>
                                            <td>${process.id}</td>
                                            <td>${process.name}</td>
                                            <td>${process.version}</td>
                                            <td>
                                                <a href="/simple/start.do?processDefId=${process.id}">启动</a>
                                                &nbsp;|&nbsp;
                                                <a href="/simple/viewprocessDef.do?processDefId=${process.id}"
                                                   target="_blank">流程定义</a>
                                                &nbsp;|&nbsp;
                                                <a href="javascript:showModle('请假流程图','${pageContext.servletContext.contextPath}/simple/viewprocessDefImage.do?processDefId=${process.id}');">流程图</a>
                                                &nbsp;|&nbsp;
                                                <a href="/simple/remove.do?processDefId=${process.deploymentId}">删除</a>
                                                &nbsp;|&nbsp;
                                                <a href="/simple/bpmnModel.do?processDefId=${process.id}">查看模型</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <!-- /.table-responsive -->
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
<script src="/assets/js/fileinput-4.4.1/js/fileinput.js" type="text/javascript"></script>
<script src="/assets/js/fileinput-4.4.1/js/locales/zh.js" type="text/javascript"></script>
<%--<script src="/assets/js/fileinput-4.4.1/themes/explorer/theme.js" type="text/javascript"></script>--%>
<!-- App -->
<script src="/assets/js/app.js"></script>
<script src="/assets/js/app.plugin.js"></script>
<script>
    $(document).ready(function () {
        $("#processUpload").fileinput({
            language: 'zh',
            showUpload: true,
            showPreview:false,
            uploadUrl: '/process/deploy',
            allowedFileExtensions: ['bpmn']
        });
    });
</script>
</body>
</html>