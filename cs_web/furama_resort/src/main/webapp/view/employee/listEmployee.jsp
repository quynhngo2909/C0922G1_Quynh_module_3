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
<c:import url="../../headerNavbar.jsp"></c:import>;
<div class="row d-flex justify-content-center fw-bold fs-3">Employee Management</div>
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
                        <td>ID:</td>
                        <td><span class="bg-light text-danger" id="idDeleted"></span></td>
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
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerHTML = name;
        document.getElementById("idDeleted").innerHTML = id;
    }

    function infoUpdate(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerHTML = name;
    }
</script>
</html>
