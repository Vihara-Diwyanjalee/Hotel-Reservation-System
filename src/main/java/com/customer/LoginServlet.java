package com.customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		boolean isTrue;
		
		isTrue = CustomerDBUtil.validate(userName, password);
		
		if (isTrue == true) {
//			List<Customer> cusDetails = CustomerDBUtil.getCustomer(userName);
//			request.setAttribute("cusDetails", cusDetails);
//			
//			RequestDispatcher dis = request.getRequestDispatcher("useraccount.jsp");
//			dis.forward(request, response);
			
			HttpSession session=request.getSession();
			session.setAttribute("userName", userName);
			response.sendRedirect("index.jsp");
			
		} else {
			out.println("<script type='text/javascript'>");
			out.println("alert('Your username or password is incorrect');");
			out.println("location='login.jsp'");
			out.println("</script>");
		}
	}

}
