<%--
  Created by IntelliJ IDEA.
  User: Dieu Quynh
  Date: 1/7/2023
  Time: 12:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update customer</title>
    <link href="bootstrap/bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="bootstrap/bootstrap-5.2.3-dist/css/bootstrap.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
<div class="sticky-top">
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
                    <a class="nav-link text-white fw-bold" href="/HomeServlet?action=contact">CONTRACT</a>
                </li>
            </ul>
        </div>
        <form class="d-flex my-0" role="search" action="/CustomerServlet/action=search" method="post">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-info text-white fw-bold btn-sm" type="submit">Search</button>
        </form>
    </nav>
    <!--    Content-->
    <div class="row d-flex justify-content-center fw-bold fs-3">Customer Management</div>
</div>
<div class="row d-flex justify-content-between">
    <div class="col-md-3">
        <a href="/CustomerServlet">
            <button class="btn btn-outline-primary btn-sm" type="submit">Back to customer list</button>
        </a>
    </div>
    <div class="col-md-3">
        <a href="/CustomerServlet?action=create">
            <button class="btn btn-outline-info btn-sm" type="submit">Create new</button>
        </a>
    </div>
    <div class="col-md-6">
        <c:if test="${requestScope['message'] != null}">
            <span class="text-bg-info text-warning">${requestScope['message']}</span>
        </c:if>
    </div>
</div>
<div class="align-content-center">
    <form action="/CustomerServlet?action=create" method="post">
        <fieldset>
            <legend class="justify-content-center">Update Customer's information</legend>
            <table class="table table-hover">
                <tr>
                    <td><label for="name">Name</label></td>
                    <td><input name="name" id="name" type="text" required="required"
                               placeholder="${customer.getName()}"></td>
                    <td hidden><i class="bi bi-check" id="checkName"></i></td>
                    <td><span id="errorName"></span></td>
                </tr>
                <tr>
                    <td><label for="birthday">Birthday</label></td>
                    <td><input name="birthday" id="birthday" type="date" required="required"
                               placeholder="${customer.getBirthday()}"></td>
                    <td hidden><i class="bi bi-check" id="checkBirthday"></i></td>
                    <td hidden><span id="errorBirthday"></span></td>
                </tr>
                <tr>
                    <td><label for="gender">Gender</label></td>
                    <td>
                        <select name="gender" id="gender">
                            <option value="true">Male</option>
                            <option value="false">Female</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="idCard">Identity card</label></td>
                    <td>
                        <input name="idCard" id="idCard" type="text" required="required"
                               placeholder="${customer.getIdCard()}">
                    </td>
                    <td hidden><i class="bi bi-check" id="checkIdCard"></i></td>
                    <td hidden><span id="errorIdCard"></span></td>
                </tr>
                <tr>
                    <td><label for="phoneNumber">Phone number</label></td>
                    <td>
                        <input name="phoneNumber" id="phoneNumber" type="text" required="required"
                               placeholder="${customer.getPhoneNumber()}">
                    </td>
                    <td hidden><i class="bi bi-check" id="checkPhoneNumber"></i></td>
                    <td hidden><span id="errorPhoneNumber"></span></td>
                </tr>
                <tr>
                    <td><label for="email">Email</label></td>
                    <td>
                        <input name="email" id="email" type="text" required="required"
                               placeholder="${customer.getEmail()}">
                    </td>
                    <td hidden><i class="bi bi-check" id="checkEmail"></i></td>
                    <td hidden><span id="errorEmail"></span></td>
                </tr>
                <tr>
                    <td><label for="address">Address</label></td>
                    <td>
                        <input name="address" id="address" type="text" required="required"
                               placeholder="${customer.getAddress()}">
                    </td>
                    <td hidden><i class="bi bi-check" id="checkAddress"></i></td>
                    <td hidden><span id="errorAddress"></span></td>
                </tr>
                <tr>
                    <td><label for="customerTypeID">Customer type Id</label></td>
                    <td>
                        <select name="customerTypeID" id="customerTypeID">
                            <c:forEach items="${customerTypeIdList}" var="customerTypeId">
                                <option value="${customerTypeId}">${customerTypeId}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <a href="/CustomerServlet">
                            <input type="button" value="Cancel" class="btn btn-outline-secondary btn-sm">
                        </a>
                        <input type="submit" value="Submit" class="btn btn-outline-success btn-sm">
                    </td>
                </tr>
            </table>
        </fieldset>
    </form>
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

