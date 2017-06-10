<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                                        <th>名称</th>
                                        <th>描述</th>
                                        <th>启用</th>
                                        <th>创建时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <c:forEach items="${details.values}" var="codeValue">
                                        <tr>
                                            <td>${ codeValue.id }</td>
                                            <td>${ codeValue.name }</td>
                                            <td>${ codeValue.description }</td>
                                            <td>
                                                <c:if test="${ codeValue.active }">
                                                    <span class="label label-success ml5">否</span>
                                                </c:if>
                                                <c:if test="${not codeValue.active }">
                                                    <span class="label label-success ml5">是</span>
                                                </c:if>
                                            </td>
                                            <td>
                                                <fmt:formatDate value="${ codeValue.createTime }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                            </td>
                                            <td>
                                                <a class="btn btn-sm btn-primary" href="/code/edit/${codeValue.id}">修改</a>
                                                <a class="btn btn-sm btn-primary" data-drop="delete">删除</a>

                                                <div class="modal" id="mymodal">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-body">
                                                                <p align="center">确定要删除吗？</p>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                                <button type="button" class="btn btn-primary"  data-drop="sure"  data-id="${codeValue.id}">确定</button>
                                                            </div>
                                                        </div><!-- /.modal-content -->
                                                    </div><!-- /.modal-dialog -->
                                                </div><!-- /.modal -->

                                                <c:if test="${ codeValue.active }">
                                                    <a data-provider="active" class="btn btn-sm btn-danger" data-code="${details.id}" data-id="${codeValue.id}">停用</a>
                                                </c:if>
                                                <c:if test="${not codeValue.active }">
                                                    <a  data-provider="active" class="btn btn-sm btn-primary" data-code="${details.id}" data-id="${codeValue.id}">启用</a>
                                                </c:if>

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