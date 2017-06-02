<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
  <meta charset="utf-8"/>
  <title>京东金融接口说明文档</title>
  <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/assets/css/bootstrap.css" type="text/css"/>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/assets/css/animate.css" type="text/css"/>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/assets/css/font-awesome.min.css" type="text/css"/>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/assets/css/simple-line-icons.css" type="text/css"/>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/assets/css/font.css" type="text/css"/>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/assets/css/app.css" type="text/css"/>
  <!--[if lt IE 9]>
  <script src="${pageContext.servletContext.contextPath}/assets/js/ie/html5shiv.js"></script>
  <script src="${pageContext.servletContext.contextPath}/assets/js/ie/respond.min.js"></script>
  <script src="${pageContext.servletContext.contextPath}/assets/js/ie/excanvas.js"></script>
  <![endif]-->
</head>
<body class="bg-light dker">
<section id="content" class="m-t-lg wrapper-md animated fadeInDown">
  <div class="container aside-xl">
    <a class="navbar-brand block" href="index.html"><span class="h1 font-bold">京东金融</span></a>
    <section class="m-b-lg">
      <header class="wrapper text-center">
        <strong>接口说明文档</strong>
      </header>
      <form action="index.html">
        <c:forEach items="${list}" var="category">
          <a href="${pageContext.servletContext.contextPath}/docs/list?categoryId=${category.id}" class="btn btn-lg btn-info btn-block btn-rounded">${category.name}</a>
        </c:forEach>
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