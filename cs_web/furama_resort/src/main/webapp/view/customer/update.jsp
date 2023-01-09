<%--
  Created by IntelliJ IDEA.
  User: Dieu Quynh
  Date: 1/7/2023
  Time: 12:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update customer</title>
    <link href="bootstrap/bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="bootstrap/bootstrap-5.2.3-dist/css/bootstrap.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<c:import url="../../headerNavbar.jsp"></c:import>
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
<div class="align-content-center">
    <form action="/CustomerServlet?action=update" method="post">
        <fieldset>
            <legend class="justify-content-center">Update Customer's information</legend>
            <table class="table table-hover">
                <tr hidden="hidden">
                    <td><label for="id">ID</label></td>
                    <td><input name="id" id="id" type="text" readonly="readonly" value="${customer.getId()}"></td>
                </tr>
                <tr>
                    <td><label for="name">Name</label></td>
                    <td><input name="name" id="name" type="text" required="required"
                               value="${customer.getName()}"></td>
                    <td hidden><i class="bi bi-check" id="checkName"></i></td>
                    <td><span id="errorName"></span></td>
                </tr>
                <tr>
                    <td><label for="birthday">Birthday</label></td>
                    <td><input name="birthday" id="birthday" type="date" required="required"
                               value="${customer.getBirthday()}"></td>
                    <td hidden><i class="bi bi-check" id="checkBirthday"></i></td>
                    <td hidden><span id="errorBirthday"></span></td>
                </tr>
                <tr>
                    <td><label for="gender">Gender</label></td>
                    <td>
                        <select name="gender" id="gender">
                            <c:choose>
                                <c:when test="${customer.isGender() == true}">
                                    <option value="true" selected="selected">Male</option>
                                    <option value="false">Female</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="true" >Male</option>
                                    <option value="false"selected="selected">Female</option>
                                </c:otherwise>
                            </c:choose>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="idCard">Identity card</label></td>
                    <td>
                        <input name="idCard" id="idCard" type="text" required="required"
                               value="${customer.getIdCard()}">
                    </td>
                    <td hidden><i class="bi bi-check" id="checkIdCard"></i></td>
                    <td hidden><span id="errorIdCard"></span></td>
                </tr>
                <tr>
                    <td><label for="phoneNumber">Phone number</label></td>
                    <td>
                        <input name="phoneNumber" id="phoneNumber" type="text" required="required"
                               value="${customer.getPhoneNumber()}">
                    </td>
                    <td hidden><i class="bi bi-check" id="checkPhoneNumber"></i></td>
                    <td hidden><span id="errorPhoneNumber"></span></td>
                </tr>
                <tr>
                    <td><label for="email">Email</label></td>
                    <td>
                        <input name="email" id="email" type="text" required="required"
                               value="${customer.getEmail()}">
                    </td>
                    <td hidden><i class="bi bi-check" id="checkEmail"></i></td>
                    <td hidden><span id="errorEmail"></span></td>
                </tr>
                <tr>
                    <td><label for="address">Address</label></td>
                    <td>
                        <input name="address" id="address" type="text" required="required"
                               value="${customer.getAddress()}">
                    </td>
                    <td hidden><i class="bi bi-check" id="checkAddress"></i></td>
                    <td hidden><span id="errorAddress"></span></td>
                </tr>
                <tr>
                    <td><label for="customerType">Customer type</label></td>
                    <td>
                        <select name="customerType" id="customerType">
                            <c:forEach items="${customerTypeList}" var="customerType">
                                <c:choose>
                                    <c:when test="${customerType == customer.getCustomerTypeId().getName()}">
                                        <option value="${customerType}" selected="selected">${customerType}</option>
                                    </c:when>
                                <c:otherwise>
                                    <option value="${customerType}">${customerType}</option>
                                </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <a href="/CustomerServlet">
                            <input type="button" value="Cancel" class="btn btn-outline-secondary btn-sm">
                        </a>
                        <input type="submit" value="Submit" class="btn btn-outline-success btn-sm">
                    </td>
                </tr>
            </table>
        </fieldset>
    </form>
</div>
<!--    Content-->
<!--    Footer-->
<div class="row bg-success">
    <span class="d-flex justify-content-center fw-bold text-white">Footer</span>
</div>
<!--    Footer-->
</body>
<script src="bootstrap/bootstrap-5.2.3-dist/js/bootstrap.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</html>

