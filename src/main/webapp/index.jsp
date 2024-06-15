<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hotel Management System</title>
    <link rel="stylesheet" type="text/css" href="style/homestyle.css">
</head>
<body>
    <header>
        <nav>
            <ul>
            <li><a href="index.jsp">Home</a></li>
                <li><a href="gallery.jsp">Gallery</a></li>
                <li><a href="aboutus.jsp">About Us</a></li>
                <li><a href="customerInsert.jsp">Sign Up</a></li>
                <li>
                    <form action="displayAccount" method="post">
                        <input type="text" name="uname" value="${userName}" hidden>
                        <input type="submit" value="${userName}" class="btn3">
                    </form>
                </li>
                <li><%
                if (session.getAttribute("userName") != null) {
    
                    out.println("<li>");
                    out.println("<form action='LogoutServlet'>");
                    out.println("<a><input type='submit' value='Logout' class='btn2'></a>");
                    out.println("</form>");
                    out.println("</li>");
                } else {
                    out.println(" <li ><a href='login.jsp'>Login</a></li>");
                }
                %></li>
            </ul>
        </nav>
    </header>

    <div class="top-bar">
        <section class="search-bar">
    <form action="hotelSearch" method="post">
        <input type="text" id="search-input" name="searchKeyword" placeholder="Search...">
        <button id="search-button" type="submit">Search</button>
    </form>
</section>

<!-- Display search results in this section -->
<section class="search-results">
    <c:if test="${not empty searchResults}">
        <h2>Search Results</h2>
        <div class="package-tiles">
            <c:forEach var="hotel" items="${searchResults}">
                <!-- Display hotel information as needed -->
                <div class="package-tile">
                    <img src="showphoto.jsp?id=${hotel.id}" alt="${hotel.name} Photo">
                    <h3>${hotel.name}</h3>
                    <p>Type: ${hotel.type}</p>
                    <a href="hotelDetails.jsp?id=${hotel.id}" class="learn-more-button">Learn More</a>
                </div>
            </c:forEach>
        </div>
    </c:if>
</section>
    </div>

    

    <section class="room-packages">
    <style>
        .package-tile img {
            max-width: 200px; /* Set a fixed maximum width for the images */
            height: auto;} /* Maintain the aspect ratio */
        .learn-more-button {
        display: inline-block;
        background-color: #0077b6; /* Blue background color */
        color: #fff; /* Text color */
        text-decoration: none;
        padding: 10px 20px;
        border: none;
        cursor: pointer;
        font-size: 16px;
        margin-top: 10px;
        border-radius: 5px; /* Rounded corners */
        text-align: center;
    }

    .learn-more-button:hover {
        background-color: #005a91; /* Darker blue on hover */
    }
     .image-slider {
        max-width: 800px; /* Set a maximum width for the slider */
        margin: auto;
        position: relative;
        overflow: hidden; /* Hide images that overflow */
    }

    .mySlides {
        display: none;
        width="800"; height="auto";
        
    }

    img {
        width: 100%;
        height: 100%;
        object-fit: cover; /* Maintain the aspect ratio and cover the slide area */
    }
    </style>
    
    <section class="image-slider">
        <div class="mySlides fade">
            <img src="img/img1.png" alt="Image 1" width="800" height="auto">
        </div>
        <div class="mySlides fade">
            <img src="img/img2.png" alt="Image 2" width="800" height="auto">
        </div>
        <div class="mySlides fade">
            <img src="img/img3.png" alt="Image 3" width="800" height="auto">
        </div>
    </section>
    
        <div class="package-tiles">
            <c:forEach var="hotel" items="<%= com.hotel.HotelDBUtil.getAllHotels() %>">
                <div class="package-tile">
                    <img src="showphoto.jsp?id=${hotel.id}" alt="${hotel.name} Photo">
                    <h3>${hotel.name}</h3>
                    <p>Type: ${hotel.type}</p>
                    <a href="hotelDetails.jsp?id=${hotel.id}" class="learn-more-button">Learn More</a>

                </div>
            </c:forEach>
        </div>
    </section>

    <section class="contact">
        <h2>Contact Us</h2>
        <p>For reservations and inquiries:</p>
        <p>Phone: +1-123-456-7890</p>
        <p>Email: info@hotel.com</p>
    </section>

    <footer>
        <div class="logo">
            <img src="img/dd.gif" alt="Hotel Logo">
        </div>
        <div class="social-media">
            <p>@tharindu.2023</p>
        </div>
    </footer>
    <script>
        let slideIndex = 0;
        showSlides();

        function showSlides() {
            let i;
            const slides = document.getElementsByClassName("mySlides");

            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }

            slideIndex++;
            if (slideIndex > slides.length) {
                slideIndex = 1;
            }

            slides[slideIndex - 1].style.display = "block";
            setTimeout(showSlides, 2000); // Change image every 2 seconds
        }
    </script>
</body>
</html>
