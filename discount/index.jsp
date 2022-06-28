<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
  <title>Discount</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<h2>Discount</h2>
<form method="post" action="/display_discount">
  <input type="text" name="info" placeholder="Product Description "/>
  <input type="text" name="price" placeholder="List Price"/>
  <input type="text" name="discount" placeholder="Discount Percent "/>
  <input type = "submit" id = "submit" value = "display_discount"/>
</form>
</body>
</html>