<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hotel Details</title>
    <style>
        body {
            background-color: #fff; /* White background color */
            color: #333; /* Text color */
            font-family: Arial, sans-serif;
        }
        h1 {
            background-color: #0077b6; /* Blue background color */
            color: #fff; /* Text color */
            padding: 10px;
        }
        .hotel-details {
            text-align: center;
            margin: 20px;
        }
        h2 {
            font-size: 24px;
            margin: 10px 0;
        }
        p {
            font-size: 18px;
            margin: 10px 0;
        }
        img {
            max-width: 400px; /* Set a fixed maximum width for the image */
            height: auto; /* Maintain the aspect ratio */
        }
        a {
            background-color: #0077b6; /* Blue background color */
            color: #fff; /* Text color */
            text-decoration: none;
            padding: 10px 20px;
            font-size: 18px;
            margin: 20px;
        }
    </style>
</head>
<body>
    <h1>Hotel Details</h1>

    <c:choose>
        <c:when test="${not empty param.id}">
            <%
                int hotelId = Integer.parseInt(request.getParameter("id"));
                com.hotel.Hotel hotel = com.hotel.HotelDBUtil.getHotelById(hotelId);
                request.setAttribute("hotel", hotel);
            %>
            <div class="hotel-details">
                <h2>${hotel.name}</h2>
                <p>Type: ${hotel.type}</p>
                <img src="showphoto.jsp?id=${hotel.id}" alt="${hotel.name} Photo">
                <a href="reserveRoom.jsp">Make Reservation</a>
            </div>
        </c:when>
        <c:otherwise>
            <p>Hotel not found.</p>
        </c:otherwise>
    </c:choose>
</body>
</html>
