  <%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 26/5/2022
  Time: 4:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <style>
      #product {
        border: 2px solid black;
        background: deeppink;
        width: 500px;
        margin: 50px auto;
        padding: 0 20px 20px;
        color: white;
      }

      #data label {
        float: left;
        width: 160px;
        padding-right: 10px;
        color: white;
      }

      #data input {
        float: left;
        width: 260px;
        height: 20px;
        margin-bottom: 20px;
        background-color: lightpink;
        color: black;
      }
      #sumit{
        color: white;
        background-color: lightpink;
        border: solid lightpink;
      }
    </style>
  </head>
  <body>
  <div id="product">
    <h1>Product Discount Calculator</h1>calculator
    <form action="calculator" method="post">
      <div id="data">
        <label>Product Description</label>
        <input type="text" name="description">
        <label>List Price</label>
        <input type="text" name="price">
        <label>Discount Percent</label>
        <input type="text" name="discount">
      </div>
      <div>
        <br>
        <input id="sumit" type="submit" value="Discount Amount">
      </div>

    </form>

  </div>
  </body>
</html>
