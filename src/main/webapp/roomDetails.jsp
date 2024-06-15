<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>roomDetails</title>
<link rel="stylesheet" type="text/css" href="CSS/stylesUserAccount.css">
<style>
    .container {
        width: 40%; /* You can adjust this value as needed */ 
        margin-top:80px;//* This centers the container horizontally */
    }
</style>
</head>
<body>
	<div class="container">
        <h1>Room Details</h1>
	<table>
	<c:forEach var="room" items="${roomData}">
	
	<c:set var="id" value="${room.id}"/>
	<c:set var="room_type" value="${room.roomType}"/>
	<c:set var="room_number" value="${room.roomNumber}"/>
	<c:set var="person_number" value="${room.personNumber}"/>
	<c:set var="child_number" value="${room.childNumber}"/>
	<c:set var="res_facilities" value="${room.resFacilities}"/>
	<c:set var="description" value="${room.description}"/>
	<c:set var="username" value="${room.username}"/>
	
	<tr>
		<td>Reservation ID</td>
		<td>${room.id}</td>
	</tr>
	<tr>
		<td>UserName</td>
		<td>${room.username}</td>
	</tr>
	<tr>
		<td>Room Type</td>
		<td>${room.roomType}</td>
	</tr>
	<tr>
		<td>Number of Rooms</td>
		<td>${room.roomNumber}</td>
	</tr>
	<tr>
		<td>Number of Persons</td>
		<td>${room.personNumber}</td>
	</tr>
	<tr>
		<td>Number of children</td>
		<td>${room.childNumber}</td>
	</tr>
	<tr>
		<td>Requested Restaurant Facilities</td>
		<td>${room.resFacilities}</td>
	</tr>
	<tr>
		<td>Description</td>
		<td>${room.description}</td>
	</tr>

	</c:forEach>
	</table>
	
	<c:url value="updateRoom.jsp" var="Roomupdate">
		<c:param name="id" value="${id}"/>
		<c:param name="roomType" value="${room_type}"/>
		<c:param name="roomNumber" value="${room_number}"/>
		<c:param name="personNumber" value="${person_number}"/>
		<c:param name="resFacilities" value="${child_number}"/>
		<c:param name="restaurant" value="${res_facilities}"/>
		<c:param name="description" value="${description}"/>
		<c:param name="username" value="${username}"/>
		
	</c:url>
	<div class="button-container">
	<a href="${Roomupdate}">
	<input type="button" name="update" value="Edit Details">
	</a>
	</div>
	<br>
	
	<c:url value="cancel.jsp" var="Roomdelete">
		<c:param name="id" value="${id}"/>
		<c:param name="roomType" value="${room_type}"/>
		<c:param name="roomNumber" value="${room_number}"/>
		<c:param name="personNumber" value="${person_number}"/>
		<c:param name="resFacilities" value="${child_number}"/>
		<c:param name="restaurant" value="${res_facilities}"/>
		<c:param name="description" value="${description}"/>
		<c:param name="username" value="${username}"/>
		
	</c:url>
	<div class="button-container">
	<a href="${Roomdelete}">
	<input type="button" name="delete" value="Cancel Reservation">
	</a>
	</div>

</body>
</html>