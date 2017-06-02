<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <meta charset="utf-8"/>
    <title>京东金融接口说明文档</title>
    <jsp:include page="/WEB-INF/views/commons/header.jsp"/>
</head>
<body class="bg-light dker">
<section id="content" class="m-t-lg wrapper-md animated fadeInDown">
    <div class="container aside-xl">
        <a class="navbar-brand block" href="index.html"><span class="h1 font-bold">京东金融</span></a>
        <section class="m-b-lg">
            <header class="wrapper text-center">
                <strong>接口说明文档</strong>
            </header>
            <form action="${pageContext.servletContext.contextPath}/project/search" method="post">
                <div class="form-group">
                    <input type="text" name="keyword" class="form-control  input-lg">
                </div>
                <button type="submit" class="btn btn-lg btn-warning lt b-white b-2x btn-block">
                    <i class="icon-arrow-right pull-right"></i>
                    <span class="m-r-n-lg">搜索</span>
                </button>
            </form>
        </section>
    </div>
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