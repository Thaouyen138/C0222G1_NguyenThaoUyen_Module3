<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/6/2022
  Time: 3:57 PM
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
    <a href="/customer?action=create">Create new customer</a>
<%--    customer= url partern--%>
</p>
<table border="1">
<%--    customer_id"));--%>
<%--    customer.setTypeId(rs.getInt("customer_type_id"));--%>
<%--    customer.setCode(rs.getString("customer_code"));--%>
<%--    customer.setName(rs.getString("customer_name"));--%>
<%--    customer.setDayOfBirth(rs.getString("customer_birthday"));--%>
<%--    customer.setGender(rs.getInt("gender"));--%>
<%--    customer.setPassport(rs.getString("customer_id_card"));--%>
<%--    customer.setPhone(rs.getString("customer_phone"));--%>
<%--    customer.setEmail(rs.getString("customer_email"));--%>
<%--    customer.setAddress(rs.getString("customer_address"));--%>

    <tr>
        <td> id</td>
        <td> type id</td>
        <td> code</td>
        <td> name</td>
        <td> birthday </td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${requestScope["customerLists"]}' var="c">
        <tr>
            <td><a style=" color: black;text-decoration: none" href="/product?action=view&id=${c.getId()}">${c.getId()}</a></td>
            <td>${c.getTypeId()}</td>
            <td>${c.getCode()}</td>
            <td>${c.getName()}</td>
<%--            <td><a href="/product?action=edit&id=${pr.getId()}">edit</a></td>--%>
<%--            <td><a href="/product?action=delete&id=${pr.getId()}">delete</a></td>--%>
        </tr>
    </c:forEach>
</table>
</body>
</html>
