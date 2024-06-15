<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>deleteCustomer</title>
<link rel="stylesheet" type="text/css" href="CSS/stylesUserAccount.css">
 <style>
        input {
            border: none;
        }
        input[type=text] {
  width: 100%;
  padding: 5px 8px;
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
        margin-top:80px;//* This centers the container horizontally */
    }
    </style>
</head>
<body style="background-image: url('img/sign1.jpg')">
	<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String userName = request.getParameter("uname");
	String password = request.getParameter("pass");
	%>

	<div class="container">
        <h1>Delete Your Account</h1>

	<form action="delete" method="post">
		<table>
			<tr>
				<td>Customer ID</td>
				<td><input type="text" name="cusid" value="<%=id%>" readonly></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><input type="text" name="name" value="<%=name%>" readonly></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="email" value="<%=email%>"
					readonly></td>
			</tr>
			<tr>
				<td>Phone number</td>
				<td><input type="text" name="phone" value="<%=phone%>"
					readonly></td>
			</tr>
			<tr>
				<td>User name</td>
				<td><input type="text" name="uname" value="<%=userName%>"
					readonly></td>
			</tr>
		</table>
		<div class="buttonsub">
	    <input type="submit" name="submit" value="Delete My Account">
	    </div>
	</form>
	</div>
</body>
</html>