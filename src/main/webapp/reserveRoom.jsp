<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>reserveRoom</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="CSS/reserveRoom.css" rel="stylesheet" type="text/css">
<script>
function validateForm() {
    var username = document.getElementById("username").value;
    var roomType = document.getElementById("room_type").value;
    var roomNumber = document.getElementById("room_number").value;
    var personNumber = document.getElementById("person_number").value;
    
    if (username === "" || roomType === "0" || roomNumber === "0" || personNumber === "0") {
        alert("Please fill in all required fields.");
        return false;
    }
    return true;
}
</script>
</head>
<body>
  <div class="hotel_reserve_box">
         <h3> Hotel Reservation Form </h3><br>
         
         <form action="Datainsert" method="post" onsubmit="return validateForm();">
             <div class="form-group">
             	<label>Username</label> 
             	<input name="username" type="text" class="form-control" id="username" placeholder="Enter your username" />
             	<br>
                 <label>Room/Suite Type</label>
                 <select name="room_type" class="form-control" id="room_type" onchange="finalCost()">
                     <option value="0" selected>Select Room/Suite</option>
                     <option value="Standard">Standard</option>
                     <option value="Deluxe">Deluxe</option>
                     <option value="Superior Deluxe">Superior Deluxe</option>
                     <option value="Premier Deluxe">Premier Deluxe</option>
                     <option value="Executive Suite">Executive Suite</option>
                     <option value="Junior Suite">Junior Suite</option>
                     <option value="Honeymoon Suite">Honeymoon Suite</option>
                 </select>
             </div>
             <div class="form-group">
                 <label>Number of room/suite</label>
                 <select name="room_number" class="form-control" id="room_number" onchange="finalCost()">
                     <option value="1">1</option>
                     <option value="2">2</option>
                     <option value="3">3</option>
                     <option value="4">4</option>
                     <option value="5">5</option>
                     <option value="6">6</option>
                     <option value="7">7</option>
                 </select>
             </div>
             <div class "form-group">
                 <label>Number of persons</label>
                 <select name="person_number" class="form-control" id="person_number" onchange="finalCost()">
                     <option value="1">1</option>
                     <option value="2">2</option>
                     <option value="3">3</option>
                     <option value="4">4</option>
                     <option value="5">5</option>
                     <option value="6">6</option>
                     <option value="7">7</option>
                 </select>
             </div>
             <br>
             <div class="form-group">
                 <label>Number of children</label>
                 <select name="child_number" class="form-control" id="child_number" onchange="finalCost()">
                     <option value="0">0</option>
                     <option value="1">1</option>
                     <option value="2">2</option>
                     <option value="3">3</option>
                     <option value="4">4</option>
                     <option value="5">5</option>
                     <option value="6">6</option>
                     <option value="7">7</option>
                 </select>
             </div>
             <div class="form-group">
                 <label>Do you want Restaurant facilities?</label>
                 <select name="res_facilities" class="form-control" id="res_facilities" onchange="finalCost()">
                     <option value="0" selected>Do you want restaurant facilities?</option>
                     <option value="Yes">Yes</option>
                     <option value="No">No</option>
                 </select>
             </div>
             <div class="form-group">
                <label>Description</label> Please describe your needs<br>eg:-Extra beds, Children's cots
                <input name="description" type="text" class="form-control" id="res_facilities"/>
            </div>

            <!-- Submit button -->
            <input type="submit" class="btn btn-primary" value="Submit Reservation">
         </form>
     </div>
</body>
</html>
