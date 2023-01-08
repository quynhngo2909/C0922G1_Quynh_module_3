<%--
  Created by IntelliJ IDEA.
  User: Dieu Quynh
  Date: 1/8/2023
  Time: 1:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Employee List</title>
    <link rel="stylesheet" href="bootstrap/bootstrap-5.2.3-dist/css/bootstrap.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.css">
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

    <div class="row d-flex justify-content-center fw-bold fs-3">Employee Management</div>
</div>
<div class="row d-flex justify-content-between">
    <div class="col-md-3">
        <a href="/EmployeeServlet">
            <button class="btn btn-outline-primary btn-sm" type="submit">Back to employee list</button>
        </a>
    </div>
    <div class="col-md-3">
        <button type="button" class="btn btn-outline-info btn-sm" data-bs-toggle="modal" data-bs-target="#create">
            Create new
        </button>
    </div>
    <div class="col-md-6">
        <c:if test="${requestScope['message'] != null}">
            <span class="text-bg-success text-warning">${requestScope['message']}</span>
        </c:if>
    </div>
</div>
<table class="table table-hover">
    <thead>
    <tr>
        <th>No.</th>
        <th>ID</th>
        <th>Name</th>
        <th>Birthday</th>
        <th>ID card</th>
        <th>Salary</th>
        <th>Phone Number</th>
        <th>Email</th>
        <th>Address</th>
        <th>Position ID</th>
        <th>Education ID</th>
        <th>Division ID</th>
        <th>Username</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${employeeList}" var="employee" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${employee.getId()}</td>
            <td>${employee.getName()}</td>
            <td>${employee.getBirthday()}</td>
            <td>${employee.getIdCard()}</td>
            <td>${employee.getSalary()}</td>
            <td>${employee.getPhoneNumber()}</td>
            <td>${employee.getEmail()}</td>
            <td>${employee.getAddress()}</td>
            <td>${employee.getPositionId()}</td>
            <td>${employee.getEducationDegree()}</td>
            <td>${employee.getDivisionId()}</td>
            <td>${employee.getUsername()}</td>
            <td>
                <button type="button" onclick="infoUpdate('${employee.getId()}','${employee.getName()}')" data-bs-toggle="modal" data-bs-target="#update"
                        class="btn btn-outline-warning btn-sm">
                    Update
                </button>
                <button type="button" onclick="infoDelete('${employee.getId()}','${employee.getName()}')" data-bs-toggle="modal" data-bs-target="#delete"
                        class="btn btn-outline-dark btn-sm">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="row bg-success sticky-bottom">
    <span class="d-flex justify-content-center fw-bold text-white">Footer</span>
</div>
<!--    Footer-->
<%--Modal--%>
<div class="modal" id="delete">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Delete Employee</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form action="/EmployeeServlet?action=delete" method="post">
            <div class="modal-body">
                <span>Do you want to delete this employee?</span>
                <input hidden type="text" id="deleteId" name="deleteId">
                <table>
                    <tr>
                        <td>Name:</td>
                        <td><span class="bg-light text-danger" id="deleteName"></span></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-sm btn-primary">Delete</button>
            </div>
            </form>
        </div>
    </div>
</div>

<div class="modal" id="update">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Update Employee</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form action="/EmployeeServlet?action=update" method="post">
                <div class="modal-body">
                    <span>Do you want to update this employee?</span>
                    <input hidden type="text" id="updateId" name="updateId">
                    <table>
                        <tr>
                            <td>Name:</td>
                            <td><span class="bg-light text-danger" id="updateName"></span></td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-sm btn-primary">Update</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal" id="create">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Create Employee</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form action="/EmployeeServlet?action=create" method="get">
                <div class="modal-body">
                    <span>Do you want to create new employee?</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-sm btn-primary">Create</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>

<script src="bootstrap/bootstrap-5.2.3-dist/js/bootstrap.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.js"></script>
<script src="datatables/js/dataTables.bootstrap5.js"></script>
<script>
    function infoDelete(id, name) {
        document.getElementById("deleteId").innerHTML = id;
        document.getElementById("deleteName").innerHTML = name;
    }

    function infoUpdate(id, name) {
        document.getElementById("deleteId").innerHTML = id;
        document.getElementById("deleteName").innerHTML = name;
    }
</script>
</html>
