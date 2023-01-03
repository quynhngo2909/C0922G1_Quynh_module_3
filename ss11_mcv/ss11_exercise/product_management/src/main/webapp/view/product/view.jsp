<%--
  Created by IntelliJ IDEA.
  User: Dieu Quynh
  Date: 1/2/2023
  Time: 3:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product information</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="text-decoration-none" href="products?action=list"><h1>Product Management</h1></a>
        <form class="d-flex" role="search" method="post">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
    </div>
</nav>
<div class="row justify-content-end">
    <div class="col-sm-12 col-md-12">
        <a class="text-decoration-none" href="products?action=list">
            <button class="button btn-outline-info">Back to product list</button>
        </a>
    </div>
</div>
<div><h2>Product information</h2></div>
<div>
    <table class="table justify-content-start">
        <tr>
            <td>ID</td>
            <td>Name</td>
            <td>Price</td>
            <td>Description</td>
            <td>Producer</td>
            <td>Edit</td>
            <td>Delete</td>
        </tr>
        <tr>
            <td><a href="products?action=view&id=${product.getId()}">${requestScope['product'].getId()}</a></td>
            <td><a href="products?action=view&id=${product.getId()}">${requestScope['product'].getName()}</a></td>
            <td>${requestScope['product'].getPrice()}</td>
            <td>${requestScope['product'].getDescription()}</td>
            <td>${requestScope['product'].getProducer()}</td>
            <td><a href="products?action=update&id=${requestScope['product'].getId()}">
                <button>Edit</button>
            </a></td>
            <td><a href="products?action=delete&id=${requestScope['product'].getId()}">
                <button>Delete</button>
            </a></td>
        </tr>
    </table>
</div>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
