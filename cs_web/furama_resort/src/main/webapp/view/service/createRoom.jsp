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
    <title>Create Room</title>
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
<div class="align-content-center">
    <form action="/ServiceServlet?action=create&id=3" method="post">
        <fieldset>
            <legend class="justify-content-center">Create new house: House's information</legend>
            <table class="table table-hover">
                <tr>
                    <td><label for="name">Name</label></td>
                    <td><input name="name" id="name" type="text" required="required" placeholder="Input Room's name">
                    </td>
                    <td hidden><i class="bi bi-check" id="checkName"></i></td>
                    <td><span id="errorName"></span></td>
                </tr>
                <tr>
                    <td><label for="area">Area</label></td>
                    <td><input name="area" id="area" type="text" required="required"></td>
                    <td hidden><i class="bi bi-check" id="checkArea"></i></td>
                    <td hidden><span id="errorArea"></span></td>
                </tr>
                <tr>
                    <td><label for="cost">Cost</label></td>
                    <td><input name="cost" id="cost" type="text" required="required"></td>
                    <td hidden><i class="bi bi-check" id="checkCost"></i></td>
                    <td hidden><span id="errorCost"></span></td>
                </tr>
                <tr>
                    <td><label for="maxPeople">Max people</label></td>
                    <td>
                        <input name="maxPeople" id="maxPeople" type="text" required="required">
                    </td>
                    <td hidden><i class="bi bi-check" id="checkMaxPeople"></i></td>
                    <td hidden><span id="errorMaxPeople"></span></td>
                </tr>
                <tr>
                    <td><label for="rentTypeID">Rent type Id</label></td>
                    <td>
                        <select name="rentTypeID" id="rentTypeID">
                            <c:forEach items="${rentTypeIdList}" var="rentTypeId">
                                <option value="${rentTypeId}">${rentTypeId}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="facilityTypeId">Facility type Id</label></td>
                    <td>
                        <select name="facilityTypeId" id="facilityTypeId">
                            <c:forEach items="${facilityTypeIdList}" var="facilityTypeId">
                                <option value="${facilityTypeId}">${facilityTypeId}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="facilityFree">Facility free</label></td>
                    <td>
                        <input name="facilityFree" id="facilityFree" type="text" required="required">
                    </td>
                    <td hidden><i class="bi bi-check" id="checkFacilityFree"></i></td>
                    <td hidden><span id="errorFacilityFree"></span></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="reset" value="Reset" class="btn btn-outline-secondary btn-sm">
                        <input type="submit" value="Submit" class="btn btn-outline-success btn-sm">
                    </td>
                </tr>
            </table>
        </fieldset>
    </form>
</div>

<!--    Footer-->
<div class="row bg-success sticky-bottom">
    <span class="d-flex justify-content-center fw-bold text-white">Footer</span>
</div>
<!--    Footer-->

</body>
<script src="bootstrap/bootstrap-5.2.3-dist/js/bootstrap.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.js"></script>
<script src="datatables/js/dataTables.bootstrap5.js"></script>
</html>
