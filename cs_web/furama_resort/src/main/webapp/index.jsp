<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Furama Home Page</title>
    <link href="bootstrap/bootstrap-5.2.3-dist/css/bootstrap.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

</head>
<body>

<div class="row justify-content-evenly bg-light">
    <div class="col-md-4">Time</div>
    <div class="col-md-4">Weather</div>
    <div class="col-md-4">Language</div>
</div>
<!--        Furama contact info-->
<div class="row bg-white">
    <div class="col-sm-12 col-md-2">
        <a href="https://furamavietnam.com/wp-content/uploads/2018/08/logo@2x.png">
            <img class="img-fluid" style="width: 4rem;"
                 src="https://furamavietnam.com/wp-content/uploads/2018/08/logo@2x.png"
                 alt="Furama">
        </a>
    </div>
    <div class=" col-sm-12 col-md-10">
        <div class="row">
            <div class="col-sm-12 col-md-4">
                <img src="picture/widget-tripadvisor-rating.png" alt="tripadvisor">
            </div>
            <div class="col-sm-12 col-md-4">
                <p class="fs-6 lh-sm">
                    <i class="bi bi-geo-alt-fill"></i>
                    103 – 105 Đường Võ Nguyên Giáp, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Tp.
                    Đà Nẵng, Việt
                    Nam
                </p>
                <p class="fs-6 lh-sm"> 7.0 km từ Sân bay Quốc tế Đà Nẵng</p>
            </div>
            <div class="col-sm-12 col-md-4">
                <div class="col-sm-10 col-md-11">
                    <span class="fs-6 lh-sm">
                        <span><i class="bi bi-telephone-fill"></i></span>
                        84-236-3847 333/888
                    </span>
                </div>
                <div>
                    <span class="fs-6 lh-sm">
                        <span><i class="bi bi-envelope-fill"></i></span>
                        reservation@furamavietnam.com
                    </span>
                </div>
                <div class="row text-center">
                    <p class="fs-6 lh-sm">Ngo Dieu Quynh</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!--        navbar-->
<nav class="navbar navbar-expand-lg bg-success justify-content-between">
    <div class="d-flex justify-content-between" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
                <a class="nav-link text-white fw-bold" href="/HomeServlet">HOME</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white fw-bold" href="/HomeServlet?action=employee">EMPLOYEE</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white fw-bold" href="/HomeServlet?action=customer">CUSTOMER</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white fw-bold" href="/HomeServlet?action=service">SERVICE</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white fw-bold" href="/HomeServlet?action=contract">CONTRACT</a>
            </li>
        </ul>
    </div>
    <div>
        <form class="d-flex" role="search" action="/HomeServlet/action=search" method="post">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-info text-white fw-bold" type="submit">Search</button>
        </form>
    </div>
</nav>
<!--    Content-->
<div class="row">
    <img src="https://furamavietnam.com/wp-content/uploads/2018/11/Vietnam_Danang_Furama_Resort_Exterior_Courtyard-Night-768x480.jpg">
</div>
<!--    Content-->
<!--    Footer-->
<div class="row bg-success">
    <span class="d-flex justify-content-center fw-bold text-white">Footer</span>
</div>
<!--    Footer-->

</body>
<script src="bootstrap/bootstrap-5.2.3-dist/js/bootstrap.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</html>