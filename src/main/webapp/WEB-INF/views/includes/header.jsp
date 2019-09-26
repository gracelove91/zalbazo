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
                    <a href="index.html"><img src="/resources/img/logo.png" alt="logo" width="100px"
                                              height="100px"></a>
                </div>
            </div>
            <div class="col-lg-9" style="text-align: right">
                <div class="main-menu">
                    <ul>
                        <li class="active"><a href="index.html">home</a></li>
                        <li><a href="about.html">about us</a></li>
                        <li><a href="job-category.html">category</a></li>
                        <li><a href="#">blog</a>
                            <ul class="sub-menu">
                                <li><a href="blog-home.html">Blog Home</a></li>
                                <li><a href="blog-details.html">Blog Details</a></li>
                            </ul>
                        </li>
                        <li><a href="contact-us.html">contact</a></li>
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
                                <a href="#" class="login">log in</a>
                                <a href="#" class="template-btn">sign up</a>
                            </sec:authorize>
                            <sec:authorize access="isAuthenticated()">
                                <sec:authentication property="principal.username"/>
                            </sec:authorize>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Header Area End -->