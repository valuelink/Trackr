<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="app">
<head>
    <title>用户列表-项目管理系统</title>
    <jsp:include page="/WEB-INF/views/commons/head.jsp"/>
    <!-- DataTables CSS -->
    <link href="${pageContext.servletContext.contextPath}/assets/js/datatables-plugins/dataTables.bootstrap.css"
          rel="stylesheet">
    <!-- DataTables Responsive CSS -->
    <link href="${pageContext.servletContext.contextPath}/assets/js/datatables-responsive/dataTables.responsive.css"
          rel="stylesheet">
    <link href="${pageContext.servletContext.contextPath}/assets/css/app.css" rel="stylesheet"/>

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
                                <i class="fa fa-list"></i> 待办任务列表
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <table width="100%" class="table table-striped table-bordered table-hover"
                                       id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>任务ID</th>
                                        <th>任务名称</th>
                                        <th>办理人</th>
                                        <th>创建时间</th>
                                        <th>到期时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
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
<script src="${pageContext.servletContext.contextPath}/assets/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.servletContext.contextPath}/assets/js/bootstrap.js"></script>
<script src="${pageContext.servletContext.contextPath}/assets/js/slimscroll/jquery.slimscroll.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/format.js"></script>
<!-- DataTables JavaScript -->
<script src="${pageContext.servletContext.contextPath}/assets/js/datatables/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/assets/js/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/assets/js/datatables-responsive/dataTables.responsive.js"></script>
<!-- App -->
<script src="${pageContext.servletContext.contextPath}/assets/js/app.js"></script>
<script src="${pageContext.servletContext.contextPath}/assets/js/app.plugin.js"></script>

<script>
    $(document).ready(function () {
        var dataTable = $('#dataTables-example').DataTable({
            "bProcessing": true,
            "processing": true,
            "serverSide": true,
            "searching": false,
            ajax: {
                url: '/api/v1/workflow/tasks/todo',
                method: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                data: function (data) {
                    return JSON.stringify(data);
                }
            },
            columns: [
                {data: 'id', 'name': 'id'},
                {data: 'name', name: 'name'},
                {data: 'assignee', name: 'assignee'},
                {
                    data: 'createTime',
                    name: 'createTime',
                    render: function (data, type, row, meta) {
                        return new Date(data).Format("yyyy-MM-dd hh:mm:ss");
                    }
                },
                {
                    data: 'dueDate',
                    name: 'dueDate',
                    render: function (data, type, row, meta) {
                        return new Date(data).Format("yyyy-MM-dd hh:mm:ss");
                    }
                },
                {
                    data: 'id',
                    name: 'id',
                    "render": function (data, type, full, meta) {
                        return '<a href="/workflow/tasks/form/'+data+'" class="text-info-dker">办理任务</a>';
                    }
                }
            ],
            //"sDom": '<"dt-panelmenu clearfix"lfr>t<"dt-panelfooter clearfix"ip>',
            "fnDrawCallback": function () {
                this.api().column(0).nodes().each(function (cell, i) {
                    cell.innerHTML = i + 1;
                });
            },
            "language": {
                "processing": "正在努力加载中...",
                "lengthMenu": "显示 _MENU_ 项结果 ",
                "zeroRecords": "没有匹配结果",
                "info": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "infoEmpty": "显示第 0 至 0 项结果，共 0 项",
                "infoFiltered": "(由 _MAX_ 项结果过滤)",
                "infoPostFix": "",
                "sSearch": "搜索",
                "url": "",
                "paginate": {
                    "first": "首页",
                    "previous": "上一页",
                    "next": "下一页",
                    "last": "末页"
                }
            }
        });
    });
</script>
</body>
</html>