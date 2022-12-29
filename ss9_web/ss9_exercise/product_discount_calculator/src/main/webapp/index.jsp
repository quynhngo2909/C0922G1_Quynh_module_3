<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<form action="product-discount-calculator" method="post">
    <h2>Currency Converter</h2>
    <b>Product Description</b>
    <br>
    <textarea name="prodDescription" id="pD" cols="30" rows="5"></textarea>
    <br>
    <b>List Price</b>
    <br>
    <input type="number" name="listPrice">
    <br>
    <b>Discount Percent (%)</b>
    <br>
    <input type="number" name="discountPercent">
    <br>
    <br>
    <button type="submit">Calculate Discount</button>
</form>
</body>
</html>