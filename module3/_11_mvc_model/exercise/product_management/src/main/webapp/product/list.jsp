<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/5/2022
  Time: 4:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
<h1>Product</h1>
<p>
    <a href="/product?action=create">Create new product</a>
</p>
<table border="1">
    <tr>
        <td>name</td>
        <td>price</td>
        <td>describle</td>
        <td>produce</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${requestScope["product"]}' var="pr">
        <tr>
            <td><a style=" color: black;text-decoration: none" href="/product?action=view&id=${pr.getId()}">${pr.getName()}</a></td>
            <td>${pr.getPrice()}</td>
            <td>${pr.getDescrible()}</td>
            <td>${pr.getProduce()}</td>
            <td><a href="/product?action=edit&id=${pr.getId()}">edit</a></td>
            <td><a href="/product?action=delete&id=${pr.getId()}">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>

</html>
