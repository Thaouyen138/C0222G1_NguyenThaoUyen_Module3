<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/5/2022
  Time: 5:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete product</title>
</head>
<body>
<h1>Delete product</h1>
<p>
    <a href="/product">Back to product list</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>product information</legend>
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
                <td>describle: </td>
                <td>${requestScope["product"].getDescrible()}</td>
            </tr>
            <tr>
                <td>produce: </td>
                <td>${requestScope["product"].getProduce()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete produce"></td>
                <td><a href="/product">Back to product list</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>