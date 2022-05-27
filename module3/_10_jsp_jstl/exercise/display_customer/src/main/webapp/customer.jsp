<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 27/5/2022
  Time: 3:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="stylesheet" href="bootstrap.min.css">

    <title>Title</title>
    <style>
        #img{
            width: 50px;
            height: 50px;
        }
    </style>
</head>
<body>

<table border="1" width="500px">
    <tr>

        <th>Name</th>
        <th>Date of birth</th>
        <th>Address</th>
        <th>Avatar</th>
    </tr>
    <c:forEach items="${customer}" var="s"> ;
        <tr>
            <td>${s.name}</td>
            <td>${s.dateBirth}</td>
            <td>${s.address}</td>
            <td id="img"><img src="${s.image}" alt=""></td>
        </tr>
    </c:forEach>
</table>
<%--<nav class="navbar navbar-expand-lg navbar-light bg-light">--%>
<%--    <a class="navbar-brand" href="#">Navbar</a>--%>
<%--    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">--%>
<%--        <span class="navbar-toggler-icon"></span>--%>
<%--    </button>--%>

<%--    <div class="collapse navbar-collapse" id="navbarSupportedContent">--%>
<%--        <ul class="navbar-nav mr-auto">--%>
<%--            <li class="nav-item active">--%>
<%--                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>--%>
<%--            </li>--%>
<%--            <li class="nav-item">--%>
<%--                <a class="nav-link" href="#">Link</a>--%>
<%--            </li>--%>
<%--            <li class="nav-item dropdown">--%>
<%--                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">--%>
<%--                    Dropdown--%>
<%--                </a>--%>
<%--                <div class="dropdown-menu" aria-labelledby="navbarDropdown">--%>
<%--                    <a class="dropdown-item" href="#">Action</a>--%>
<%--                    <a class="dropdown-item" href="#">Another action</a>--%>
<%--                    <div class="dropdown-divider"></div>--%>
<%--                    <a class="dropdown-item" href="#">Something else here</a>--%>
<%--                </div>--%>
<%--            </li>--%>
<%--            <li class="nav-item">--%>
<%--                <a class="nav-link disabled">Disabled</a>--%>
<%--            </li>--%>
<%--        </ul>--%>
<%--        <form class="form-inline my-2 my-lg-0">--%>
<%--            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">--%>
<%--            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
<%--        </form>--%>
<%--    </div>--%>
<%--</nav>--%>
<%--<form>--%>
<%--    <div class="form-group">--%>
<%--        <label for="exampleInputEmail1">Email address</label>--%>
<%--        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">--%>
<%--        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--        <label for="exampleInputPassword1">Password</label>--%>
<%--        <input type="password" class="form-control" id="exampleInputPassword1">--%>
<%--    </div>--%>
<%--    <div class="form-group form-check">--%>
<%--        <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--        <label class="form-check-label" for="exampleCheck1">Check me out</label>--%>
<%--    </div>--%>
<%--    <button type="submit" class="btn btn-primary">Submit</button>--%>
<%--</form>--%>
</body>
<script crossorigin="anonymous"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script crossorigin="anonymous"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"></script>
<script src="bootstrap.min.js"></script>

</html>
