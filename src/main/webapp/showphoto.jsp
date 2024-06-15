<%@ page language="java" contentType="image/jpeg" pageEncoding="UTF-8" %>
<%@ page import="com.hotel.HotelDBUtil" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.OutputStream" %>

<%
    // Get the hotel ID from the request parameter
    int hotelId = Integer.parseInt(request.getParameter("id"));

    // Get the photo for the specified hotel
    InputStream photoStream = HotelDBUtil.getHotelPhoto(hotelId);

    // Set the content type to image/jpeg
    response.setContentType("image/jpeg");

    // Get the response output stream
    OutputStream outputStream = response.getOutputStream();
    
    // Read the photo data from the input stream and write it to the output stream
    byte[] buffer = new byte[4096];
    int bytesRead;
    while ((bytesRead = photoStream.read(buffer)) != -1) {
        outputStream.write(buffer, 0, bytesRead);
    }

    // Close the streams
    photoStream.close();
    outputStream.close();
%>
