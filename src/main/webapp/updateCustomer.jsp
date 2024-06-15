<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>updateCustomer</title>
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
            margin: 8px;
        }

        .container {
            width: 40%;
            margin-top: 80px;
        }
    </style>
<script>
function validateForm() {
    var name = document.forms["updateForm"]["name"].value;
    var email = document.forms["updateForm"]["email"].value;
    var phone = document.forms["updateForm"]["phone"].value;
    var password = document.forms["updateForm"]["pass"].value;
    var username = document.forms["updateForm"]["username"].value; // Get the username field

    // Simple validation checks (you can customize these to your requirements)
    if (name === "") {
        alert("Name must be filled out");
        return false;
    }

    if (email === "") {
        alert("Email must be filled out");
        return false;
    } else if (!isValidEmail(email)) {
        alert("Invalid email format");
        return false;
    }

    if (phone === "") {
        alert("Phone number must be filled out");
        return false;
    } else if (!isValidPhone(phone)) {
        alert("Invalid phone number format");
        return false;
    }

    if (username === "") { // Check if username is empty
        alert("Username must be filled out");
        return false;
    } else if (username.length < 4) { // Customize the username length requirement as needed
        alert("Username must be at least 4 characters long");
        return false;
    }

    if (password === "") {
        alert("Password must be filled out");
        return false;
    } else if (password.length < 6) {
        alert("Password must be at least 6 characters long");
        return false;
    }

    return true;
}

</script>


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

    <div class="container" >
        <h1>Update Your Details</h1>
        <form name="updateForm" action="update" method="post" onsubmit="return validateForm()">
            <table>
                <tr>
                    <td>Customer ID</td>
                    <td><input type="text" name="cusid" value="<%=id%>" readonly></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" value="<%=name%>"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="email" value="<%=email%>"></td>
                </tr>
                <tr>
                    <td>Phone number</td>
                    <td><input type="text" name="phone" value="<%=phone%>"></td>
                </tr>
                <tr>
                    <td>User name</td>
                    <td><input type="text" name="uname" value="<%=userName%>"></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="pass" value="<%=password%>"></td>
                </tr>
            </table>
            <div class="buttonsub">
                <input type="submit" name="submit" value="Update My Data">
            </div>
        </form>
    </div>
</body>
</html>
