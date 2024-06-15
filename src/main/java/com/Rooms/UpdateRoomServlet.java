package com.Rooms;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.customer.Customer;
import com.customer.CustomerDBUtil;

public class UpdateRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String roomType = request.getParameter("room_type");
		int roomNumber = Integer.parseInt(request.getParameter("room_number"));
		int personNumber = Integer.parseInt(request.getParameter("person_number"));
		int childNumber = Integer.parseInt(request.getParameter("child_number"));
		String resFacilities = request.getParameter("res_facilities");
		String description = request.getParameter("description");
		String username = request.getParameter("username");
		
		boolean isTrue;

		isTrue = RoomDBUtil.updateRoomDetails(id, roomType, roomNumber, personNumber, childNumber, resFacilities, description, username);

		if (isTrue == true) {

			//List<Customer> cusDetails = CustomerDBUtil.getCustomerDetails(id);
			//request.setAttribute("cusDetails", cusDetails);

			RequestDispatcher dis = request.getRequestDispatcher("success.jsp");
			dis.forward(request, response);
		} else {
			//List<Customer> cusDetails = CustomerDBUtil.getCustomerDetails(id);
			//request.setAttribute("cusDetails", cusDetails);

			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
		}
		
	}

}
