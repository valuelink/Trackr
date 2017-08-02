<%@page contentType="text/html" pageEncoding="UTF-8" %>
<aside class="bg-inverse aside hidden-print" id="nav">
    <section class="vbox">
        <section class="scrollable">
            <div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0"
                 data-size="10px" data-railOpacity="0.2">
                <!-- nav -->
                <nav class="nav-primary hidden-xs">
                    <ul class="nav bg clearfix">
                        <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
                            项目
                        </li>
                        <li>
                            <a href="index.html">
                                <i class="fa-dashboard fa"></i>
                                <span class="font-bold">控制面板</span>
                            </a>
                        </li>
                        <li class="m-b hidden-nav-xs"></li>
                    </ul>
                    <ul class="nav" data-ride="collapse">
                        <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
                            项目评估
                        </li>
                        <li>
                            <a href="#" class="auto">
						<span class="pull-right text-muted">
                          <i class="fa fa-angle-left text"></i>
                          <i class="fa fa-angle-down text-active"></i>
                        </span>
                                <i class="icon-user icon"></i>
                                <span>客户管理</span>
                            </a>
                            <ul class="nav dk text-sm">
                                <li class="active">
                                    <a href="/company/list" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>
                                        <span>客户管理</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/clue/list" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>
                                        <span>潜在客户管理</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/competitor/list" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>
                                        <span>友商管理</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#" class="auto">
                                <span class="pull-right text-muted">
                                  <i class="fa fa-angle-left text"></i>
                                  <i class="fa fa-angle-down text-active"></i>
                                </span>
                                <i class="icon-screen-desktop icon">
                                </i>
                                <span>项目管理</span>
                            </a>
                            <ul class="nav dk text-sm">
                                <li class="active">
                                    <a href="/project/list" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>
                                        <span>立项管理</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/contract/list" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>
                                        <span>项目列表</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#" class="auto">
                        <span class="pull-right text-muted">
                          <i class="fa fa-angle-left text"></i>
                          <i class="fa fa-angle-down text-active"></i>
                        </span>
                                <i class="icon-folder-alt icon">
                                </i>
                                <span>文档管理</span>
                            </a>
                            <ul class="nav dk text-sm">
                                <li>
                                    <a href="buttons.html" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>
                                        <span>文档模板</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="icons.html" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>
                                        <span>报价函和保密函</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#" class="auto">
                        <span class="pull-right text-muted">
                          <i class="fa fa-angle-left text"></i>
                          <i class="fa fa-angle-down text-active"></i>
                        </span>
                                <i class="fa-tasks fa">
                                </i>
                                <span>任务管理</span>
                            </a>
                            <ul class="nav dk text-sm">
                                <li>
                                    <a href="/workflow/tasks/todo" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>
                                        <span>待办任务</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/workflow/tasks/complete" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>
                                        <span>已办任务</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="invoice.html" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>
                                        <span>任务历史</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav text-sm">
                        <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
                            数据
                        </li>
                        <li>
                            <a href="#">
                                <i class="icon-pie-chart icon"></i>
                                <span>收款统计</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="icon-speedometer icon"></i>
                                <span>工作统计</span>
                            </a>
                        </li>
                    </ul>
                    <ul class="nav text-sm">
                        <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
                            财务
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa-dollar fa"></i>
                                <span>收款核实</span>
                            </a>
                        </li>
                    </ul>
                    <ul class="nav text-sm" data-ride="collapse">
                        <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
                            <span class="pull-right">
                                <a href="#"><i class="icon-plus i-lg"></i></a>
                            </span>
                            系统
                        </li>
                        <li>
                            <a href="#">
                                <i class="icon-equalizer icon"></i>
                                <span>受托方</span>
                            </a>
                        </li>

                        <li>
                            <a href="#" class="auto">
                                <span class="pull-right text-muted">
                                  <i class="fa fa-angle-left text"></i>
                                  <i class="fa fa-angle-down text-active"></i>
                                </span>
                                <i class="icon-lock-open icon"></i>
                                <span>权限管理</span>
                            </a>
                            <ul class="nav dk text-sm">
                                <li class="active">
                                    <a href="/user/list" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>
                                        <span>员工管理</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/role/list" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>
                                        <span>角色管理</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#" class="auto">
                                <span class="pull-right text-muted">
                                  <i class="fa fa-angle-left text"></i>
                                  <i class="fa fa-angle-down text-active"></i>
                                </span>
                                <i class="icon-settings icon"></i>
                                <span>系统设置</span>
                            </a>
                            <ul class="nav dk text-sm">
                                <li class="active">
                                    <a href="/dict/type/list" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>
                                        <span>数据字典</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/process/list" class="auto">
                                        <i class="fa fa-angle-right text-xs"></i>
                                        <span>流程定义</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <!-- / nav -->
            </div>
        </section>
    </section>
</aside>