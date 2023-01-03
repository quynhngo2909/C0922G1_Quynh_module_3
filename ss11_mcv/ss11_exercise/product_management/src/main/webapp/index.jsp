<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <link href="bootstrap-5.3.0-alpha1-dist/css/bootstrap.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="text-decoration-none bg-primary-subtle" href="products?action=list"><h1>Product Management</h1></a>
        <form class="d-flex" role="search" action="products?action=search" method="post">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
    </div>
</nav>
<div class="row justify-content-evenly">
    <div class="col-sm-4 col-md-4 justify-content-center">
        <a class="text-decoration-none" href="products?action=list">
            <button class="button btn-outline-info">Product List</button>
        </a>
    </div>
    <div class="col-sm-4 col-md-4 justify-content-center">
        <a class="text-decoration-none" href="products?action=create">
            <button class="button btn-outline-info">Create new product</button>
        </a>
    </div>
    <div class="col-sm-4 col-md-4 justify-content-center">
        <c:if test="${requestScope['message'] != null }">
            <span class="bg-body-secondary">${requestScope['message']}</span>
        </c:if>
    </div>
</div>
<div>
    <table class="table justify-content-start">
        <tr>
            <td>No.</td>
            <td>ID</td>
            <td>Name</td>
            <td>Price</td>
            <td>Description</td>
            <td>Producer</td>
        </tr>
    </table>
</div>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
