<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/5/2022
  Time: 5:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View product</title>
</head>
<body>
<h1>Product details</h1>
<p>
    <a href="/product">Back to product list</a>
</p>
<table>
    <tr>
        <td>Name: </td>
        <td>${requestScope["product"].getName()}</td>
    </tr>
    <tr>
        <td>price: </td>
        <td>${requestScope["product"].getPrice()}</td>
    </tr>
    <tr>
        <td>Descible: </td>
        <td>${requestScope["product"].getDescrible()}</td>
    </tr>
    <tr>
        <td>Produce: </td>
        <td>${requestScope["product"].getProduce()}</td>
    </tr>
</table>
</body>
</html>