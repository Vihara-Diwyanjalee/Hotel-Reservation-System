<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>deleteRoom</title>
<link rel="stylesheet" type="text/css" href="CSS/stylesUserAccount.css">
    <style>
        input {
            border: none;
        }
        input[type=text] {
  width: 100%;
  padding: 1px 1px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 3px solid #ccc;
  -webkit-transition: 0.5s;
  transition: 0.5s;
  outline: none;
}

input[type=text]:focus {
  border: 3px solid #555;
}
input[type=password] {
  width: 100%;
  padding: 5px 8px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 3px solid #ccc;
  -webkit-transition: 0.5s;
  transition: 0.5s;
  outline: none;
}

input[type=password]:focus {
  border: 3px solid #555;
}
.buttonsub {
        text-align: center;
    }

    .buttonsub input[type="submit"] {
        background-color: #3498db;
    color: #fff;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    cursor: pointer;
    font-size: 16px;
    margin:8px;
    }
    .container {
        width: 40%; /* You can adjust this value as needed */ 
        margin-top:20px;//* This centers the container horizontally */
    }
    </style>
</head>
<body>
  <%
	String roomId = request.getParameter("id");
	String roomType = request.getParameter("roomType");
	String roomNumber = request.getParameter("roomNumber");
	String personNumber = request.getParameter("personNumber");
	String childNumber = request.getParameter("resFacilities");
	String resFacilities = request.getParameter("restaurant");
	String description = request.getParameter("description");
	String userName = request.getParameter("username");
	%>

    <div class="container">
        <h1>Cancel your Reservation</h1>
        <form action="DeleteRoom" method="post">
            <table>
                <tr>
                    <td>Reservation ID</td>
                    <td><input type="text" name="id" value="<%=roomId%>" readonly></td>
                </tr>
                <tr>
                    <td>UserName</td>
                    <td><input type="text" name="username" value="<%=userName%>" readonly></td>
                </tr>
                <tr>
                    <td>Room Type</td>
                    <td><input type="text" name="room_type" value="<%=roomType%>" readonly></td>
                </tr>
                <tr>
                    <td>Number of Rooms</td>
                    <td><input type="text" name="room_number" value="<%=roomNumber%>" readonly></td>
                </tr>
                <tr>
                    <td>Number of Persons</td>
                    <td><input type="text" name="person_number" value="<%=personNumber%>" readonly></td>
                </tr>
                <tr>
                    <td>Number of Children</td>
                    <td><input type="text" name="child_number" value="<%=childNumber%>" readonly></td>
                </tr>
                <tr>
                    <td>Requested Restaurant Facilities</td>
                    <td><input type="text" name="res_facilities" value="<%=resFacilities%>" readonly></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><input type="text" name="description" value="<%=description%>" readonly></td>
                </tr>
            </table>
            <div class="buttonsub">
                <input type="submit" name="submit" value="Cancel Reservation">
            </div>
        </form>
    </div>  
</body>
</html>