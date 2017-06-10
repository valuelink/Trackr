<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="app">
<head>
    <title>用户列表-项目管理系统</title>
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
                                <i class="fa fa-list"></i> 字典数据列表
                                <div class="pull-right">
                                    <a href="/code/add" class="btn btn-success btn-xs">
                                        <i class="fa fa-plus"></i> 增加字典
                                    </a>
                                </div>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <table width="100%" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>字典名称</th>
                                        <th>系统内置</th>
                                        <th>创建时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <c:forEach items="${list}" var="code">
                                        <tr>
                                            <td>${ code.id }</td>
                                            <td>${ code.name }</td>
                                            <td>
                                                <c:if test="${ code.system }">
                                                    <span class="label label-success ml5">是</span>
                                                </c:if>
                                                <c:if test="${not code.system }">
                                                    <span class="label label-success ml5">否</span>
                                                </c:if>
                                            </td>
                                            <td>
                                                <fmt:formatDate value="${ code.createTime }"
                                                                pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                            </td>
                                            <td>
                                                <a class="btn btn-sm btn-primary"
                                                   href="/code/details/${code.id}">详情</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
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