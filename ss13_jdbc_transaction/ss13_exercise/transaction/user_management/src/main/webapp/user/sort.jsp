<%--
  Created by IntelliJ IDEA.
  User: Dieu Quynh
  Date: 1/3/2023
  Time: 9:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User Sorted List</title>
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
<div>
    <table class="table justify-content-center">
        <tr>
            <th>No.</th>
            <th>Id</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        <c:forEach items="${requestScope['userList']}" var="user" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${user.getId()}</td>
                <td>${user.getName()}</td>
                <td>${user.getEmail()}</td>
                <td>${user.getCountry()}</td>
                <td>
                    <a href="/users?action=update&id=${user.getId()}">
                        <button class="button btn-outline-success">Update</button>
                    </a>
                </td>
                <td>
                    <a href="/users?action=delete&id=${user.getId()}">
                        <button class="button btn-outline-warning">Delete</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
<script src="bootstrap-5.2.3-dist/js/bootstrap.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>