<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/5/2022
  Time: 5:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit product</title>
</head>
<body>
<h1>Edit product</h1>
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
        <legend>product information</legend>
        <table>
            <tr>
                //id, tên sản phẩm, giá sản phẩm, mô tả của sản phẩm, nhà sản xuất.

                <td>Name: </td>
                <td><input type="text" name="name" id="name" value="${requestScope["product"].getName()}"></td>
            </tr>
            <tr>
                <td>Price: </td>
                <td><input type="text" name="price" id="price" value="${requestScope["product"].getPrice()}"></td>
            </tr>
            <tr>
                <td>describle: </td>
                <td><input type="text" name="describle" id="des" value="${requestScope["product"].getDescrible()}"></td>
            </tr>
            <tr>
                <td>produce: </td>
                <td><input type="text" name="produce" id="produce" value="${requestScope["product"].getProduce()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update produce"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>

</html>
