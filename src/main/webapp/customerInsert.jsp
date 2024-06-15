<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>customerInsert</title>
<link rel="stylesheet" type="text/css" href="CSS/stylesLogin.css">
<style>
    .container {
        width: 40%; /* You can adjust this value as needed */
        margin-top: 80px; /* This centers the container horizontally */
    }
    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 5px 8px;
        margin: 8px 0;
        box-sizing: border-box;
        border: 3px solid #ccc;
        -webkit-transition: 0.5s;
        transition: 0.5s;
        outline: none;
    }

    input[type="text"]:focus,
    input[type="password"]:focus {
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
        margin: 8px;
    }
</style>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var signupForm = document.forms["signupForm"];
        var nameField = signupForm["name"];
        var emailField = signupForm["email"];
        var phoneField = signupForm["phone"];
        var usernameField = signupForm["uid"];
        var passwordField = signupForm["psw"];

        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        var phonePattern = /^\d{10}$/;

        nameField.addEventListener("input", function() {
            var nameValue = nameField.value.trim();
            if (!/^[A-Za-z\s]+$/.test(nameValue) || nameValue.indexOf(' ') === -1) {
                nameField.setCustomValidity("Name should contain only letters");
            } else {
                nameField.setCustomValidity("");
            }
        });

        emailField.addEventListener("input", function() {
            if (!emailField.value.match(emailPattern)) {
                emailField.setCustomValidity("Please enter a valid email address");
            } else {
                emailField.setCustomValidity("");
            }
        });

        phoneField.addEventListener("input", function() {
            if (!phoneField.value.match(phonePattern)) {
                phoneField.setCustomValidity("Please enter a valid 10-digit phone number");
            } else {
                phoneField.setCustomValidity("");
            }
        });

        passwordField.addEventListener("input", function() {
            if (passwordField.value.length < 6) {
                passwordField.setCustomValidity("Password must be at least 6 characters long");
            } else {
                passwordField.setCustomValidity("");
            }
        });
    });

    function validateForm() {
        var name = document.forms["signupForm"]["name"].value;
        var email = document.forms["signupForm"]["email"].value;
        var phone = document.forms["signupForm"]["phone"].value;
        var username = document.forms["signupForm"]["uid"].value;
        var password = document.forms["signupForm"]["psw"].value;

        if (name === "" || email === "" || phone === "" || username === "" || password === "") {
            alert("All fields must be filled out");
            return false;
        }

        return true;
    }
</script>
</head>
<body style="background-image: url('img/sign1.jpg')">
    <div class="container">
        <div class="login-container">
            <h2>Create Account</h2>

            <form name="signupForm" action="insert" method="post" onsubmit="return validateForm()">

                <div class="input-container">
                    <label for="username">Name</label> <input type="text"
                        id="username" name="name" placeholder="Enter your name" />
                </div>
                <div class="input-container">
                    <label for="username">Email</label> <input type="text"
                        id="username" name="email" placeholder="abc@mail.com" />
                </div>
                <div class="input-container">
                    <label for="username">Phone Number</label> <input type="text"
                        id="username" name="phone" placeholder="Enter your Phone Number" />
                </div>
                <div class="input-container">
                    <label for="username">Username</label> <input type="text"
                        id="username" name="uid" placeholder="Enter your username" />
                </div>
                <div class="input-container">
                    <label for="password">Password</label> <input type="password"
                        id="password" name="psw" placeholder="Password should be at least 6 chars" />
                </div>
                <div class="buttonsub">
                    <input type="submit" name="submit" value="Create Account">
                </div>
                <br>
                <p>
                    You Have Account? <a href="login.jsp"><b>Login</b></a>
                </p>
            </form>
        </div>
    </div>
</body>
</html>
