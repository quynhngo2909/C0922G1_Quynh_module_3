<%--
  Created by IntelliJ IDEA.
  User: Dieu Quynh
  Date: 1/4/2023
  Time: 2:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete user</title>
    <link href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>
<nav class="navbar navbar-expand-md bg-dark">
    <div class="container-fluid justify-content-between">
        <a class="navbar-brand fs-2 text-white fw-bold " href="/users">User Management</a>
        <form class="d-flex" role="search" action="/users?action=search" method="post">
            <input class="form-control" type="search" name ="country" placeholder="Search user by country">
            <button class="btn btn-outline-info" type="submit">Search</button>
        </form>
    </div>
</nav>
<div class="container-fluid d-flex justify-content-start bg-light">
    <a href="/users?action=list">
        <button class="btn btn-outline-primary" type="submit">User List</button>
    </a>
    <a href="/users?action=create">
        <button class="btn btn-outline-success" type="submit">Create new user</button>
    </a>
    <a href="/users?action=sort">
        <button class="btn btn-outline-warning" type="submit">Sort by name descending</button>
    </a>
    <span>
        <c:if test="${requestScope['message'] != null}">
            <span>${requestScope['message']}</span>;
        </c:if>
    </span>
</div>
<div class="row justify-content-center container-fluid bg-light fw-bold fs-4">Do you want to delete this user?</div>
<div>
    <form action="/users?action=delete&id=${user.getId()}" method="post">
        <fieldset>
            <legend>User information</legend>
            <table>
                <tr>
                    <td>Id: </td>
                    <td>${user.getId()}</td>
                </tr>
                <tr>
                    <td>Name: </td>
                    <td>${user.getName()}</td>
                </tr>
                <tr>
                    <td>Email: </td>
                    <td>${user.getEmail()}</td>
                </tr>
                <tr>
                    <td>Country: </td>
                    <td>${user.getCountry()}</td>
                </tr>
                <tr>
                    <td><a href="/users?action=list"><button class="btn btn-outline-primary" type="button">Cancel</button></a></td>
                    <td><button class="btn btn-outline-primary" type="submit">Delete</button></td>
                </tr>
            </table>
        </fieldset>
    </form>
</div>
</body>
</html>
<script src="bootstrap-5.2.3-dist/js/bootstrap.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
