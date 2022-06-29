<%@ page import="java.util.List" %>
<%@ page import="com.example.demo1.Guest" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <style>
    tr,td{border: 1px cyan}
    table{background: dimgray}
  </style>
</head>
<body>
<%! List<Guest> guest= new ArrayList();
%>
<%
  guest.add(new Guest("Mai Văn Hoàn","1983-08-20","Hà Nội","https://haycafe.vn/wp-content/uploads/2022/02/Anh-gai-xinh-Viet-Nam-682x600.jpg"));
  guest.add(new Guest("Nguyễn Văn Nam","1983-08-21","Bắc Giang","https://haycafe.vn/wp-content/uploads/2022/02/Anh-gai-xinh-Viet-Nam-682x600.jpg"));
  guest.add(new Guest("Nguyễn Thái Hòa","1983-08-22","Nam Định","https://haycafe.vn/wp-content/uploads/2022/02/Anh-gai-xinh-Viet-Nam-682x600.jpg"));
  guest.add(new Guest("Trần Đăng Khoa","1983-08-23","Hà Nam","https://haycafe.vn/wp-content/uploads/2022/02/Anh-gai-xinh-Viet-Nam-682x600.jpg"));
  request.setAttribute("guests",guest);
%>
<table style="border: 1px">
  <tr> <th colspan="4">Danh Sách Khách hàng </th></tr>
  <tr>
    <td>Tên</td>
    <td>Ngày tháng năm sinh</td>
    <td>Quê quán</td>
    <td>Ảnh</td>
  </tr>
  <c:forEach var="item" items="${guests}">
    <tr>
      <td>${item.name}</td>
      <td>${item.birthday}</td>
      <td>${item.address}</td>
      <td><img src="${item.img}" style="height: 50px"></td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
