<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required Meta Tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Page Title -->
    <title>Comport</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="/resources/img/logo/favicon.png" type="image/x-icon">

    <!-- CSS Files -->
    <link rel="stylesheet" href="/resources/css/animate-3.7.0.css">
    <link rel="stylesheet" href="/resources/css/font-awesome-4.7.0.min.css">
    <link rel="stylesheet" href="/resources/fonts/flat-icon/flaticon.css">
    <link rel="stylesheet" href="/resources/css/bootstrap-4.1.3.min.css">
    <link rel="stylesheet" href="/resources/css/owl-carousel.min.css">
    <link rel="stylesheet" href="/resources/css/nice-select.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
</head>

<body>
<!-- Preloader Starts -->
<div class="preloader">
    <div class="spinner"></div>
</div>
<!-- Preloader End -->

<!-- Header Area Starts -->
<header class="header-area main-header">
    <div class="container">
        <div class="row">
            <div class="col-lg-2" style="text-align: center">
                <div class="logo-area">
                    <a href="/index"><img src="/resources/img/logo.png" alt="logo" width="100px"
                                              height="100px"></a>
                </div>
            </div>
            <div class="col-lg-9" style="text-align: right">
                <div class="main-menu">
                    <ul>
                        <li class="active"><a href="/index">home</a></li>
                        <li><a href="about.html">about us</a></li>
                        <li><a href="/jisikdong/list">지식동</a></li>
                        <li><a href="/community/list">커뮤니티</a></li>
                        <li><a href="/hospital/list">병원찾기</a></li>
                        <li><a href="#">pages</a>
                            <ul class="sub-menu">
                                <li><a href="job-search.html">Job Search</a></li>
                                <li><a href="job-single.html">Job Single</a></li>
                                <li><a href="pricing-plan.html">Pricing Plan</a></li>
                                <li><a href="elements.html">Elements</a></li>
                            </ul>
                        </li>
                        <li class="menu-btn">
                            <sec:authorize access="isAnonymous()">
                                <a href="/login" class="login">log in</a>
                                <a href="/user/register" class="template-btn">sign up</a>
                            </sec:authorize>

                            <sec:authorize access="isAuthenticated()">
                                <a href="#"><sec:authentication property="principal.username"/></a>
                                <ul class="sub-menu">
                                    <li><a href="/user/mypage">마이페이지</a></li>
                                    <li><a href="/logout">로그아웃</a></li>
                                </ul>
                            </sec:authorize>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Header Area End -->