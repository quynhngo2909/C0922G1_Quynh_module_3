<%--
  Created by IntelliJ IDEA.
  User: Dieu Quynh
  Date: 1/6/2023
  Time: 11:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer List</title>
    <link rel="stylesheet" href="bootstrap/bootstrap-5.2.3-dist/css/bootstrap.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.css">

</head>
<body>
<c:import url="../../headerNavbar.jsp"></c:import>;
<!--    Content-->
<div class="row d-flex justify-content-center fw-bold fs-3">Customer Management</div>
<div class="row d-flex justify-content-between">
    <div class="col-md-2">
        <a href="/CustomerServlet">
            <button class="btn btn-outline-primary btn-sm" type="submit">Back to customer list</button>
        </a>
    </div>
    <div class="col-md-2">
        <a href="/CustomerServlet?action=create">
            <button class="btn btn-outline-info btn-sm" type="submit">Create new</button>
        </a>
    </div>
    <div class="col-md-4">
        <c:if test="${requestScope['message'] != null}">
            <span class="text-bg-success text-warning">${requestScope['message']}</span>
        </c:if>
    </div>
    <div class="col-md-4">
        <div class="row">
            <form action="/CustomerServlet?action=search" method="post">
                <button class="btn btn-outline-info btn-sm col-md-2 px-0" type="submit">Search by</button>
                <input class="col-md-3 form-control-sm px-0 py-0" name="name" placeholder="Name">
                <input class="col-md-3 form-control-sm px-0 py-0" name="customerType" placeholder="Type">
                <input class="col-md-3 form-control-sm px-0 py-0" name="address" placeholder="Address">
            </form>
        </div>
    </div>
</div>
<table class="table table-hover" id="tableCustomer">
    <thead>
    <tr class="text-center">
        <th>No.</th>
        <th>ID</th>
        <th>Name</th>
        <th>Customer Type</th>
        <th>Birthday</th>
        <th>Gender</th>
        <th>ID Card</th>
        <th>Phone number</th>
        <th>Email</th>
        <th>Address</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${requestScope['customerList']}" var="customer" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${customer.getId()}</td>
            <td>${customer.getName()}</td>
            <td>${customer.getCustomerTypeId().getName()}</td>
            <td>${customer.getBirthday()}</td>
            <td>
                <c:choose>
                    <c:when test="${customer.isGender()}">
                        <span>Nam</span>
                    </c:when>
                    <c:otherwise>
                        <span>Nữ</span>
                    </c:otherwise>
                </c:choose>
            </td>
            <td>${customer.getIdCard()}</td>
            <td>${customer.getPhoneNumber()}</td>
            <td>${customer.getEmail()}</td>
            <td>${customer.getAddress()}</td>
            <td class="d-flex justify-content-between">
                <a href="/CustomerServlet?action=update&id=${customer.getId()}">
                    <button class="btn btn-outline-warning btn-sm" type="submit">Update</button>
                </a>
                <button onclick="infoDelete('${customer.getId()}','${customer.getName()}')" type="button"
                        class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#delete">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<!--    Content-->
<!--    Footer-->
<div class="row bg-success sticky-bottom">
    <span class="d-flex justify-content-center fw-bold text-white">Footer</span>
</div>
<!--    Footer-->
<!-- Modal -->
<div class="modal fade" id="delete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete customer</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/CustomerServlet?action=delete" method="post">
                <div class="modal-body">
                    <input hidden type="text" id="deleteId" name="deleteId">
                    <span>Do you want to delete this customer? </span>
                    <span style="color: red" id="deleteName"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-sm btn-primary">Delete</button>
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
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        })
    });
</script>
<script>
    function infoDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }
</script>
</html>
