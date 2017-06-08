<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <meta charset="utf-8"/>
    <title>项目管理系统测试</title>
    <jsp:include page="/WEB-INF/views/commons/head.jsp"/>
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
                        <form class="form-horizontal" data-validate="parsley">
                            <section class="panel panel-default">
                                <header class="panel-heading">
                                    <span class="h4"><span class="fa fa-plus"></span> 用户详情</span>
                                </header>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">姓名 </label>
                                        <div class="col-sm-3">
                                            <p class="form-control-static">${user.realName}</p>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group">
                                        <label for="email" class="col-sm-2 control-label">
                                            登录邮箱
                                            <i class="icon icon-question"
                                               data-container="body"
                                               data-trigger="hover"
                                               data-toggle="popover"
                                               data-placement="top"
                                               data-content="在PC端用户只能通过该邮箱账号登录系统."
                                               title="公司邮箱"></i>
                                        </label>
                                        <div class="col-sm-3">
                                            <p class="form-control-static">${user.companyEmail}</p>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group clearfix">
                                        <label class="col-sm-2 control-label">登录手机</label>
                                        <div class="col-sm-3">
                                            <p class="form-control-static">${user.mobile}</p>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group clearfix">
                                        <label for="position" class="col-sm-2 control-label">职务</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" id="position" name="user.position">
                                                <option value="总监">总监</option>
                                                <option value="行政">行政</option>
                                                <option value="合伙人">合伙人</option>
                                                <option value="评估助理">评估助理</option>
                                                <option value="评估助理经理">评估助理经理</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group clearfix">
                                        <label for="subCompany" class="col-sm-2 control-label">分公司</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" id="subCompany" name="user.subCompany">
                                                <option value="BJ">北京</option>
                                                <option value="SH">上海</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">部门

                                        </label>
                                        <div class="col-sm-3">
                                            <div class="checkbox i-checks">
                                                <label>
                                                    <input type="checkbox" name="department" checked value=""><i></i> 法定部门
                                                </label>
                                            </div>
                                            <div class="checkbox i-checks">
                                                <label>
                                                    <input type="checkbox" name="department" value=""><i></i> 咨询部门
                                                </label>
                                            </div>
                                            <div class="checkbox i-checks">
                                                <label>
                                                    <input type="checkbox" name="department" value=""><i></i> 财务部门
                                                </label>
                                            </div>
                                            <div class="checkbox i-checks">
                                                <label>
                                                    <input type="checkbox" name="department" value="">
                                                    <i></i> 物业部门
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">性别</label>
                                        <div class="col-sm-3">
                                            <div class="radio i-checks">
                                                <label>
                                                    <input type="radio" name="gender" checked value="MALE">
                                                    <i></i> 男
                                                </label>
                                            </div>
                                            <div class="radio i-checks">
                                                <label>
                                                    <input type="radio" name="gender" value="FEMALE">
                                                    <i></i> 女
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="line line-dashed b-b line-lg pull-in"></div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">角色</label>
                                        <div class="col-sm-3">
                                            <select data-required="true" class="form-control m-t parsley-validated">
                                                <option value="">合伙人</option>
                                                <option value="foo">财务</option>
                                                <option value="bar">同学</option>
                                            </select>
                                            <label class="checkbox i-checks">
                                                <input type="checkbox" name="inlineCheckbox1" value="option1"><i></i>
                                                可分配潜在客户记录权限
                                            </label>
                                            <label class="checkbox i-checks">
                                                <input type="checkbox" name="inlineCheckbox1" value="option1"><i></i>
                                                拥有潜在客户记录权限
                                            </label>
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
<script src="${pageContext.servletContext.contextPath}/assets/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.servletContext.contextPath}/assets/js/bootstrap.js"></script>
<!-- App -->
<script src="${pageContext.servletContext.contextPath}/assets/js/app.js"></script>
<script src="${pageContext.servletContext.contextPath}/assets/js/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/assets/js/app.plugin.js"></script>

</body>
</html>