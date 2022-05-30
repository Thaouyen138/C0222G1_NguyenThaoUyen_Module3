<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/5/2022
  Time: 4:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new product</title>
    <style>
        .message{
            color:green;
        }
    </style>
</head>
<body>
<h1>Create new product</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/product">Back to product list</a>
</p>
<form method="post">

    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
 //id, tên sản phẩm, giá sản phẩm, mô tả của sản phẩm, nhà sản xuất.

                <td>Name: </td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>Price: </td>
                <td><input type="text" name="price" id="price"></td>
            </tr>
            <tr>
                <td>Describle: </td>
                <td><input type="text" name="des" id="describle"></td>
            </tr>
            <tr>
                <td>produce: </td>
                <td><input type="text" name="pro" id="produce"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create produce"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
