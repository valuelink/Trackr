<%-- 
    Document   : header
    Created on : 2016-6-19, 16:25:13
    Author     : wangkun23
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<header class="bg-primary header header-md navbar navbar-fixed-top-xs">
    <div class="navbar-header aside">
        <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen,open" data-target="#nav,html">
            <i class="icon-list"></i>
        </a>
        <a href="index.html" class="navbar-brand text-lt">
            <i class="fa-vimeo-square fa"></i>
            <span class="hidden-nav-xs m-l-sm">BBT</span>
        </a>
        <a class="btn btn-link visible-xs" data-toggle="dropdown" data-target=".user">
            <i class="icon-settings"></i>
        </a>
    </div>
    <ul class="nav navbar-nav hidden-xs">
        <li>
            <a href="#nav,.navbar-header" data-toggle="class:nav-xs,nav-xs" class="text-muted">
                <i class="fa fa-indent text"></i>
                <i class="fa fa-dedent text-active"></i>
            </a>
        </li>
    </ul>
    <form class="navbar-form navbar-left input-s-lg m-t m-l-n-xs hidden-xs" role="search">
        <div class="form-group">
            <div class="input-group">
            <span class="input-group-btn">
              <button type="submit" class="btn btn-sm bg-white btn-icon rounded"><i class="fa fa-search"></i></button>
            </span>
                <input type="text" class="form-control input-sm no-border rounded" placeholder="搜索">
            </div>
        </div>
    </form>
    <div class="navbar-right ">
        <ul class="nav navbar-nav m-n hidden-xs nav-user user">
            <li class="hidden-xs">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="icon-grid"></i>
                </a>
            </li>
            <li class="hidden-xs">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="icon-bell"></i>
                    <span class="badge badge-sm up bg-danger count">2</span>
                </a>
                <section class="dropdown-menu aside-xl animated fadeInUp">
                    <section class="panel bg-white">
                        <div class="panel-heading b-light bg-light">
                            <strong>有 <span class="count">2</span> 条未读消息</strong>
                        </div>
                        <div class="list-group list-group-alt">
                            <a href="#" class="media list-group-item">
                    <span class="pull-left thumb-sm">
                      <img src="${pageContext.servletContext.contextPath}/assets/images/a0.png" class="img-circle">
                    </span>
                                    <span class="media-body block m-b-none">
                      合同审核申请<br>
                      <small class="text-muted">10 分钟以前</small>
                    </span>
                            </a>
                            <a href="#" class="media list-group-item">
                    <span class="media-body block m-b-none">
                      张三上传了合同文件<br>
                      <small class="text-muted">1 小时前</small>
                    </span>
                            </a>
                        </div>
                        <div class="panel-footer text-sm">
                            <a href="#notes" data-toggle="class:show animated fadeInRight">查看所有消息</a>
                        </div>
                    </section>
                </section>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <span class="thumb-sm avatar pull-right m-t-n-sm m-b-n-sm m-l-sm">
                <img src="${pageContext.servletContext.contextPath}/assets/images/m0.jpg" alt="...">
              </span>
                    图形控制 <b class="caret"></b>
                </a>
                <ul class="dropdown-menu animated fadeInRight">
                    <li>
                        <span class="arrow top"></span>
                        <a href="#">个人资料</a>
                    </li>
                    <li>
                        <a href="profile.html">修改密码</a>
                    </li>
                    <li>
                        <a href="docs.html">帮助文档</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="modal.lockme.html" data-toggle="ajaxModal">退出</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</header>
