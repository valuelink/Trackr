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
                                <i class="fa fa-list"></i> 用户数据列表
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="well form-inline">
                                    <a href="/user/add" class="btn btn-primary">
                                        <i class="glyphicon glyphicon-plus-sign"></i>
                                        增加用户
                                    </a>

                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon">手机号码</span>
                                            <input type="text" id="search-mobile" class="form-control input-s"
                                                   placeholder="手机号码">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon">姓名</span>
                                            <input type="text" id="search-name" class="form-control input-s"
                                                   placeholder="姓名">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon">状态</span>
                                            <select id="search-enterprise" class="form-control input-s">
                                                <option>正常</option>
                                                <option>冻结</option>
                                            </select>
                                        </div>
                                    </div>

                                    <button id="search-btn" class="btn btn-info">查询</button>
                                </div>
                                <table width="100%" class="table table-striped table-bordered table-hover"
                                       id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>UID</th>
                                        <th>姓名</th>
                                        <th>用户名</th>
                                        <th>分公司</th>
                                        <th>手机号</th>
                                        <%--<th>角色</th>--%>
                                        <th>部门</th>
                                        <th>创建时间</th>
                                        <th>用户状态</th>
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
                url: '/api/v1/user/list/dataTables',
                method: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                data: function (data) {
                    return JSON.stringify(data);
                }
            },
            columns: [
                {data: 'id', 'name': 'id'},
                {data: 'realName', name: 'realName'},
                {data: 'loginName', name: 'loginName'},
                {
                    data: 'subCompany',
                    name: 'subCompany',
                    render: function (data, type, row, meta) {
                        if (data === "BJ") {
                            return "北京";
                        } else if (data === "SH") {
                            return "上海";
                        } else {
                            return "未知";
                        }
                    }
                },
                {data: 'mobile', name: 'mobile'},
//                {data: 'roleId', name: 'roleId'},
                {data: 'departmentId', name: 'departmentId'},
                {
                    data: 'createTime',
                    name: 'createTime',
                    render: function (data, type, row, meta) {
                        return new Date(data).Format("yyyy-MM-dd hh:mm:ss");
                    }
                },
                {
                    data: 'status',
                    name: 'status',
                    "render": function (data, type, full, meta) {
                        if (data == 1) {
                            return '<span class="label label-success ml5">正常</span>';
                        } else {
                            return '<span class="label label-danger ml5">禁用</span>';
                        }
                    }
                },
                {
                    data: 'id',
                    name: 'id',
                    "render": function (data, type, full, meta) {
                        return '<div class="btn-group" role="group" aria-label="...">' +
                            '<button type="button" class="btn btn-default">冻结</button>' +
                            '<button type="button" class="btn btn-danger">删除</button>' +
                            '<a href="/user/details/' + data + '" type="button" class="btn btn-success">编辑</a>' +
                            '</div>';
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

        //搜索查询
        $("#search-btn").click(function () {
            var _name = $("#search-name").val();
            var _mobile = $("#search-mobile").val();
            if (_name) {
                dataTable.column(1).search(_name);
            } else {
                dataTable.column(1).search("");
            }
            if (_mobile) {
                dataTable.column(2).search(_mobile);
            } else {
                dataTable.column(2).search("");
            }
            dataTable.draw();
        });
    });
</script>
</body>
</html>