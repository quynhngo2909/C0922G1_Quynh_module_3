<%--
  Created by IntelliJ IDEA.
  User: Dieu Quynh
  Date: 1/7/2023
  Time: 8:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Facility List</title>
    <link rel="stylesheet" href="bootstrap/bootstrap-5.2.3-dist/css/bootstrap.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.css">
</head>
<body>
<c:import url="../../headerNavbar.jsp"></c:import>;
<!--    Content-->
<div class="row d-flex justify-content-center fw-bold fs-3">Facility Management</div>
<div class="row d-flex justify-content-between">
    <div class="col-md-3">
        <a href="/ServiceServlet">
            <button class="btn btn-outline-primary btn-sm" type="submit">Back to facility list</button>
        </a>
    </div>
    <div class="col-md-3 dropdown">
        <button class="btn btn-outline-info dropdown-toggle" type="button" data-bs-toggle="dropdown"
                aria-expanded="false">
            Create new
        </button>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/ServiceServlet?action=create&id=1">Villa</a></li>
            <li>
                <hr class="dropdown-divider">
            </li>
            <li><a class="dropdown-item" href="/ServiceServlet?action=create&id=2">House</a></li>
            <li>
                <hr class="dropdown-divider">
            </li>
            <li><a class="dropdown-item" href="/ServiceServlet?action=create&id=3">Room</a></li>
        </ul>
    </div>
    <div class="col-md-6">
        <c:if test="${requestScope['message'] != null}">
            <span class="text-bg-success text-warning">${requestScope['message']}</span>
        </c:if>
    </div>
</div>

<table class="table table-hover" id="tableCustomer">
    <thead>
    <tr class="text-center">
        <th>No.</th>
        <th>ID</th>
        <th>Facility Name</th>
        <th>Area</th>
        <th>Cost</th>
        <th>Max people</th>
        <th>Rent type ID</th>
        <th>Facility Type ID</th>
        <th>Standard Room</th>
        <th>Description Other convenience</th>
        <th>Pool Area</th>
        <th>Number of floors</th>
        <th>Facility free</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${facilityList}" var="facility" varStatus="status">
    <tr>
        <td>${status.count}</td>
        <c:choose>
        <c:when test="${facility.getFacilityTypeId() == 1}">
        <td>${facility.getId()}</td>
        <td>${facility.getName()}</td>
        <td>${facility.getArea()}</td>
        <td>${facility.getCost()}</td>
        <td>${facility.getMaxPeople()}</td>
        <td>${facility.getRentTypeId()}</td>
        <td>${facility.getFacilityTypeId()}</td>
        <td>${facility.getStandardRoom()}</td>
        <td>${facility.getDescriptionOtherConvenience()}</td>
        <td>${facility.getPoolArea()}</td>
        <td>${facility.getNumberOfFloors()}</td>
        <td>-</td>
        </c:when>
        <c:when test="${facility.getFacilityTypeId() == 2}">
        <td>${facility.getId()}</td>
        <td>${facility.getName()}</td>
        <td>${facility.getArea()}</td>
        <td>${facility.getCost()}</td>
        <td>${facility.getMaxPeople()}</td>
        <td>${facility.getRentTypeId()}</td>
        <td>${facility.getFacilityTypeId()}</td>
        <td>${facility.getStandardRoom()}</td>
        <td>${facility.getDescriptionOtherConvenience()}</td>
        <td>-</td>
        <td>${facility.getNumberOfFloors()}</td>
        <td></td>
        </c:when>
        <c:otherwise>
        <td>${facility.getId()}</td>
        <td>${facility.getName()}</td>
        <td>${facility.getArea()}</td>
        <td>${facility.getCost()}</td>
        <td>${facility.getMaxPeople()}</td>
        <td>${facility.getRentTypeId()}</td>
        <td>${facility.getFacilityTypeId()}</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>${facility.getFacilityFree()}</td>
        </c:otherwise>
        </c:choose>
        <td class="d-flex justify-content-between">
            <a href="/ServiceServlet?action=update&id=${facility.getId()}">
                <button class="btn btn-outline-warning btn-sm" type="submit">Update</button>
            </a>
            <button onclick="infoDelete('${facility.getId()}','${facility.getName()}')" type="button"
                    class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#delete">
                Delete
            </button>
        </td>
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
            <form action="/ServiceServlet?action=delete" method="post">
                <div class="modal-body">
                    <input hidden type="text" id="deleteId" name="deleteId">
                    <span>Do you want to delete this facility? </span>
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
