<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="app">
<head>
    <title>客户列表-项目管理系统</title>
    <jsp:include page="/WEB-INF/views/commons/head.jsp"/>
    <!-- DataTables CSS -->
    <link href="/assets/js/datatables-plugins/dataTables.bootstrap.css"
          rel="stylesheet">
    <!-- DataTables Responsive CSS -->
    <link href="/assets/js/datatables-responsive/dataTables.responsive.css"
          rel="stylesheet">
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
                                <i class="fa fa-list"></i> 客户列表
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="well">
                                    <a href="/project/add" class="btn btn-primary">
                                        <i class="glyphicon glyphicon-plus-sign"></i>
                                        新建客户
                                    </a>
                                </div>
                                <table width="100%" class="table table-bordered" id="dataTables">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>客户编号</th>
                                        <th>客户简称</th>
                                        <th>客户名称</th>
                                        <th>签约代号</th>
                                        <th>创建人</th>
                                        <th>关联公司数</th>
                                        <th>最后修改时间</th>
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
<script src="/assets/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/assets/js/bootstrap.js"></script>
<script src="/assets/js/slimscroll/jquery.slimscroll.min.js"></script>

<script src="/assets/js/format.js"></script>
<!-- DataTables JavaScript -->
<script src="/assets/js/datatables/js/jquery.dataTables.min.js"></script>
<script src="/assets/js/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="/assets/js/datatables-responsive/dataTables.responsive.js"></script>
<!-- App -->
<script src="/assets/js/app.js"></script>
<script src="/assets/js/app.plugin.js"></script>

<script>
    $(document).ready(function () {
        var dataTable = $('#dataTables').DataTable({
            "bProcessing": true,
            "processing": true,
            "serverSide": true,
            "searching": false,
            ajax: {
                url: '/api/v1/company/list/tables',
                method: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                data: function (data) {
                    return JSON.stringify(data);
                }
            },
            columns: [
                {data: 'id', name: 'id'},
                {data: 'companyNumber', name: 'companyNumber'},
                {data: 'abbrName', name: 'abbrName'},
                {data: 'companyName', name: 'companyName'},
                {data: 'signCode', name: 'signCode'},
                {data: 'creator.realName', name: 'creator.realName'},
                {data: 'associatedCount', name: 'associatedCount'},
                {
                    data: 'updateTime',
                    name: 'updateTime',
                    render: function (data, type, row, meta) {
                        return new Date(data).Format("yyyy-MM-dd hh:mm:ss");
                    }
                },
                {
                    data: 'id',
                    name: 'id',
                    "render": function (data, type, full, meta) {
                        return '<a href="/company/details/' + data + '" class="text-info">详细信息</a>';
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