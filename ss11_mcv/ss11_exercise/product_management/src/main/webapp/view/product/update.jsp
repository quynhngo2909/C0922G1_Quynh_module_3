<%--
  Created by IntelliJ IDEA.
  User: Dieu Quynh
  Date: 1/2/2023
  Time: 3:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update product information</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<div class="row justify-content-center">
    <a class="text-decoration-none" href="products?action=list"><h1>Product Management</h1></a>
</div>
<div class="row justify-content-evenly">
    <div class="col-sm-6 col-md-6 justify-content-center">
        <a class="text-decoration-none" href="products?action=list">
            <button class="button">Back to product list</button>
        </a>
    </div>
    <div class="col-sm-6 col-md-6 justify-content-center">
        <c:if test="${requestScope['message'] != null}">
            <span class="bg-body-secondary">${requestScope['message']}</span>
        </c:if>
    </div>
</div>
<div><h2>Update product information</h2></div>
<div>
    <form method="post">
        <fieldset>
            <legend>Product information</legend>
            <table class="table">
                <tr>
                    <td>Product Name :</td>
                    <td><input type="text" name="name" value="${requestScope['product'].getName()}"></td>
                </tr>
                <tr>
                    <td>Product Price :</td>
                    <td><input type="number" name="price" value="${requestScope['product'].getPrice()}"></td>
                </tr>
                <tr>
                    <td>Product Description :</td>
                    <td><input type="text" name="description" value="${requestScope['product'].getDescription()}"></td>
                </tr>
                <tr>
                    <td>Product Producer :</td>
                    <td><input type="text" name="producer" value="${requestScope['product'].getProducer()}"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Submit"></td>
                </tr>
            </table>
        </fieldset>
    </form>
</div>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
