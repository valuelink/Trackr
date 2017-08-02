<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="app">
<head>
    <title>潜在客户管理-项目管理系统</title>
    <jsp:include page="/WEB-INF/views/commons/head.jsp"/>
    <link href="/assets/js/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
    <!-- DataTables Responsive CSS -->
    <link href="/assets/js/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

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
                                <i class="fa fa-list"></i> 潜在客户列表
                            </div>
                            <div class="panel-body">
                                <div class="well form-inline">
                                    <a href="/user/add" class="btn btn-primary">
                                        <i class="glyphicon glyphicon-plus-sign"></i>
                                        新增潜在客户
                                    </a>
                                    <div class="form-group">
                                        <select class="form-control">
                                            <option value="customerName">客户名</option>
                                            <option value="ipo">上市地</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="keyword">
                                            <span class="input-group-btn">
                                                <button id="search-btn" class="btn btn-info">
                                                    <i class="glyphicon glyphicon-search"></i> 查询
                                                </button>
                                            </span>
                                        </div>
                                    </div>

                                </div>
                                <table id="dataTables" class="table table-striped table-bordered table-hover">
                                </table>
                            </div>
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
                url: '/api/v1/clue/tables',
                method: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                data: function (data) {
                    return JSON.stringify(data);
                }
            },
            columns: [
                {title: "ID", data: 'id', 'name': 'id'},
                {title: "客户名称", data: 'name', name: 'name'},
                {title: "上市地", data: 'ipo', name: 'ipo'},
                {title: "联系人", data: 'contactName', name: 'contactName'},
                {
                    title: "预计评估时间",
                    data: 'valuateTime',
                    name: 'valuateTime',
                    "render": function (data, type, full, meta) {
                        if (data) {
                            return new Date(data).Format("yyyy-MM-dd");
                        } else {
                            return "";
                        }
                    }
                },
                {
                    title: "签约",
                    data: 'signed',
                    name: 'signed',
                    render: function (data, type, row, meta) {
                        if (data) {
                            return '<span class="label label-success">是</span>';
                        } else {
                            return '<span class="label bg-warning">否</span>';
                        }
                    }
                },
                {title: "计划下次联系时间", data: 'nextTime', name: 'nextTime'},
                {title: "创建时间", data: 'createTime', name: 'createTime'},
                {
                    title: "操作",
                    data: 'id',
                    name: 'id',
                    "render": function (data, type, full, meta) {
                        return '<a href="/dict/type/details/' + data + '" class="text-info">详情信息</a>';
                    }
                }
            ],
            //"sDom": '<"dt-panelmenu clearfix"lfr>t<"dt-panelfooter clearfix"ip>',
            fnDrawCallback: function () {
                this.api().column(0).nodes().each(function (cell, i) {
                    cell.innerHTML = i + 1;
                });
            },
            language: {
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