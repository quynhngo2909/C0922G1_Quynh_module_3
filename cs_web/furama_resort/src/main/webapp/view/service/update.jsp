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
    <title>Create Facility</title>
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
    <div class="col-md-2">
        <a href="/ServiceServlet">
            <button class="btn btn-outline-primary btn-sm" type="submit">Back to facility list</button>
        </a>
    </div>
    <div class="col-md-2">
        <button class="btn btn-outline-info btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#createFacility">
            Create new
        </button>
    </div>
    <div class="col-md-4">
        <c:if test="${requestScope['message'] != null}">
            <span class="text-bg-success text-warning">${requestScope['message']}</span>
        </c:if>
    </div>
    <div class="col-md-4">
        <div class="row">
            <form action="/ServiceServlet?action=search" method="post">
                <button class="btn btn-outline-info btn-sm col-md-2 px-0" type="submit">Search by</button>
                <input class="col-md-3 form-control-sm px-0 py-0" name="name" placeholder="Name">
                <input class="col-md-3 form-control-sm px-0 py-0" name="rentType" placeholder="Rent Type">
                <input class="col-md-3 form-control-sm px-0 py-0" name="cost" placeholder="Cost">
            </form>
        </div>
    </div>
</div>
<br>
<div class="align-content-center">
    <form action="/ServiceServlet?action=update" method="post">
        <fieldset>
            <legend>Update facility</legend>
        <table class="table table-hover">
            <tr hidden class="commonAttribute">
                <td><label for="id">ID</label></td>
                <td><input name="id" id="id" type="text" readonly="readonly" value="${facility.getId()}">
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr class="commonAttribute">
                <td><label for="name">Name</label></td>
                <td><input name="name" id="name" type="text" required="required" value="${facility.getName()}">
                </td>
                <td hidden><i class="bi bi-check" id="checkName"></i></td>
                <td><span id="errorName"></span></td>
            </tr>
            <tr class="commonAttribute">
                <td><label for="area">Area</label></td>
                <td><input name="area" id="area" type="text" required="required" value="${facility.getArea()}"></td>
                <td hidden><i class="bi bi-check" id="checkArea"></i></td>
                <td hidden><span id="errorArea"></span></td>
            </tr>
            <tr class="commonAttribute">
                <td><label for="cost">Cost</label></td>
                <td><input name="cost" id="cost" type="text" required="required" value="${facility.getCost()}"></td>
                <td hidden><i class="bi bi-check" id="checkCost"></i></td>
                <td hidden><span id="errorCost"></span></td>
            </tr>
            <tr class="commonAttribute">
                <td><label for="maxPeople">Max people</label></td>
                <td>
                    <input name="maxPeople" id="maxPeople" type="text" required="required" value="${facility.getMaxPeople()}">
                </td>
                <td hidden><i class="bi bi-check" id="checkMaxPeople"></i></td>
                <td hidden><span id="errorMaxPeople"></span></td>
            </tr>
            <tr class="commonAttribute">
                <td><label for="rentType">Rent Type</label></td>
                <td>
                    <select name="rentType" id="rentType">
                        <c:forEach items="${rentTypeList}" var="rentType">
                            <c:choose>
                                <c:when test="${rentType} == ${facility.getRentType()}">
                                    <option selected="selected" value="${rentType}">${rentType}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${rentType}">${rentType}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr class="commonAttribute">
                <td><label for="facilityType">Facility Type</label></td>
                <td>
                    <select name="facilityType" id="facilityType">
                        <c:forEach items="${facilityTypeList}" var="facilityType">
                            <c:choose>
                                <c:when test="${facilityType} == ${facility.getFacilityType()}">
                                    <option selected="selected" value="${facilityType}">${facilityType}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${facilityType}">${facilityType}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr class="commonAttribute">
                <td><label for="standardRoom">Standard Room</label></td>
                <td>
                    <input name="standardRoom" id="standardRoom" type="text" required="required"
                           value="${facility.getStandardRoom()}">
                </td>
                <td hidden><i class="bi bi-check" id="checkStandardRoom"></i></td>
                <td hidden><span id="errorStandardRoom"></span></td>
            </tr>
            <tr class="commonAttribute">
                <td><label for="descriptionOtherConvenience">Other Convenience</label></td>
                <td>
                    <input name="descriptionOtherConvenience" id="descriptionOtherConvenience" type="text"
                           required="required" value="${facility.getDescriptionOtherConvenience()}">
                </td>
                <td hidden><i class="bi bi-check" id="checkOtherConvenience"></i></td>
                <td hidden><span id="errorOtherConvenience"></span></td>
            </tr>
            <tr class="villaAttribute">
                <td><label for="poolArea">Pool Area</label></td>
                <td>
                    <input name="poolArea" id="poolArea" type="text" value="${facility.getPoolArea()}">
                </td>
                <td hidden><i class="bi bi-check" id="checkPoolArea"></i></td>
                <td hidden><span id="errorPoolArea"></span></td>
            </tr>
            <tr class="villaHouseAttribute">
                <td><label for="numberOfFloors">Number Of Floors </label></td>
                <td>
                    <input name="numberOfFloors" id="numberOfFloors" type="text" value="${facility.getNumberOfFloors()}">
                </td>
                <td hidden><i class="bi bi-check" id="checkNumberOfFloors"></i></td>
                <td hidden><span id="errorNumberOfFloors"></span></td>
            </tr>
            <tr class="roomAttribute" >
                <td><label for="facilityFree">Facility Free </label></td>
                <td>
                    <input name="facilityFree" id="facilityFree" type="text" value="${facility.getFacilityFree()}">
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
                <td></td>
                <td></td>
            </tr>
        </table>
        </fieldset>
    </form>
</div>

<div class="modal fade" id="createFacility" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="mainCreate">Create new facility</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <%--      Link--%>
            <form action="/ServiceServlet" method="get">
                <div class="modal-body">
                    <span>Do you want to create new facility? </span>
                    <input type="hidden" name="action" value="create">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-sm btn-primary">Create</button></a>
                </div>
            </form>
        </div>
    </div>
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
<%--//jQuery hide() and show()--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
    $("#selectFacilityType").change(function () {
        let selected_option = $('#selectFacilityType').val();
        if (selected_option === "Villa") {
            $(".houseAttribute").hide();
            $(".roomAttribute").hide();
            $(".villaAttribute").show();
            $(".villaHouseAttribute").show();
        }
        if (selected_option === "House") {
            $(".villaAttribute").hide();
            $(".roomAttribute").hide();
            $(".houseAttribute").show();
            $(".villaHouseAttribute").show();
        }
        if (selected_option === "Room") {
            $(".villaAttribute").hide();
            $(".houseAttribute").hide();
            $(".villaHouseAttribute").hide();
            $(".roomAttribute").show();
        }
    });
</script>
</html>
