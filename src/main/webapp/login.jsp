<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login</title>
<link rel="stylesheet" type="text/css" href="CSS/stylesLogin.css">
<style>
    .container {
        width: 25%; /* You can adjust this value as needed */ 
        margin-top: 150px; /* This centers the container vertically */
    }
</style>
<script>
    function validateForm() {
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;

        if (username === "" || password === "") {
            alert("All fields must be filled out");
            return false;
        }

        return true;
    }
</script>
</head>
<body>
	<div class="container">
		<div class="login-container">
			<h2>Login</h2>
			<form action="login" method="post" onsubmit="return validateForm()">
				<div class="input-container">
					<label for="username">Username</label>
					<input type="text" id="username" name="username" placeholder="Enter your username" />
				</div>
				<div class="input-container">
					<label for="password">Password</label>
					<input type="password" id="password" name="password" placeholder="Enter your password" />
				</div>
				<button class="login-button" name="submit"><b>Login</b></button>
				<p>
					New Here? <a href="customerInsert.jsp"><b>Sign Up</b></a>
				</p>
			</form>
		</div>
	</div>
</body>
</html>
