<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TechBlog | Home</title>

<!-- Bootstrap -->
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- Font Awesome -->
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Custom CSS -->
<link rel="stylesheet" href="components/style.css">

<style>
.background_clip {
    clip-path: polygon(0 0, 100% 0, 100% 88%, 75% 100%, 35% 89%, 0 99%);
}
</style>
</head>

<body>

<%@include file="components/navbar.jsp"%>

<!-- HERO SECTION -->
<div class="container-fluid p-0">
    <div class="jumbotron primary_background background_clip text-white py-6 mb-0">
        <div class="container" style="max-width: 900px;">
            <h1 class="display-4 font-weight-bold">Build. Learn. Share.</h1>

            <p class="lead mt-3">
                A modern tech blog where I share knowledge about Java, Web Technologies,
                Backend Development, and real-world programming concepts.
            </p>

            <p class="text-light">
                Created to practice JSP, Servlets, and backend development while building something meaningful.
            </p>

            <a class="btn btn-lg btn-primary-cta">Start Reading</a>

            <a href="login.jsp" class="btn btn-lg btn-outline-light">
                Login
            </a>
        </div>
    </div>
</div>

<!-- FEATURED SECTION -->
<div style="background-color:#f8fafc;">
    <div class="container py-5" style="max-width:1100px;">

        <h3 class="text-center font-weight-bold mb-5">
            Featured Topics
        </h3>

        <div class="row">

            <!-- CARD 1 -->
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body p-4 d-flex flex-column">
                        <h5 class="card-title">Java Programming Fundamentals</h5>

                        <p class="card-text flex-grow-1">
                            Learn core Java concepts including OOP, JVM architecture,
                            memory management, and backend development basics.
                        </p>

                        <a href="#" class="btn btn-card-cta">Read Article →</a>

                    </div>
                </div>
            </div>

            <!-- CARD 2 -->
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body p-4 d-flex flex-column">
                        <h5 class="card-title">Web Development Basics</h5>

                        <p class="card-text flex-grow-1">
                            Understand how HTML, CSS, Bootstrap, and JavaScript work
                            together to build responsive web applications.
                        </p>

                        <a href="#" class="btn btn-card-cta">Read Article →</a>

                    </div>
                </div>
            </div>

            <!-- CARD 3 -->
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body p-4 d-flex flex-column">
                        <h5 class="card-title">JSP & Servlets</h5>

                        <p class="card-text flex-grow-1">
                            Explore how JSP and Servlets handle requests, sessions,
                            and dynamic content in Java-based web applications.
                        </p>

                       <a href="#" class="btn btn-card-cta">Read Article →</a>

                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>

</body>
</html>
