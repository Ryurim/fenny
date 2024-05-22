<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ryuri
  Date: 2024-05-14(Tue)
  Time: PM 8:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="/resources/resources/jquery/jquery-3.7.1.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light shadow">
    <div class="container d-flex justify-content-between align-items-center">

        <a class="navbar-brand text-success logo h1 align-self-center" href="/">
            FENNY
        </a>

        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
            <div class="flex-fill">
                <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/">오늘의 학습</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/my/main">나의 학습</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/share/main">공유 학습</a>
                    </li>
                </ul>
            </div>
            <div class="navbar align-self-center d-flex">
                <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                    <div class="input-group">
                        <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                        <div class="input-group-text">
                            <i class="fa fa-fw fa-search"></i>
                        </div>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${not empty sessionScope.member_id}">
                        <div class="nav-icon position-relative text-decoration-none" href="#">
                            <span>${sessionScope.member_id}</span>
                        </div>
                        <a class="nav-icon position-relative text-decoration-none" href="/member/view">
                            <i class="fa fa-fw fa-user text-dark mr-3"></i>
                        </a>
                        <button class="btn btn-secondary" onclick="location.href='/login/logout'">
                            로그아웃
                        </button>
                    </c:when>
                    <c:otherwise>
                        <button class="btn btn-primary" onclick="location.href='/login/login'">
                            로그인
                        </button>
                        &nbsp;
                        <button class="btn btn-secondary" onclick="location.href='/member/regist'">
                            회원가입
                        </button>
                    </c:otherwise>
                </c:choose>


            </div>
        </div>

    </div>
</nav>
</body>
</html>
