package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.StudentBean;
import com.dao.StudentDao;


/**
 * Servlet implementation class StudentRegistrationController
 */
@WebServlet("/StudentRegistrationController")
public class StudentRegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentRegistrationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String std_name = request.getParameter("std_name");		
		String std_address = request.getParameter("std_address");		
		String email = request.getParameter("email");
		String std_mobileno = request.getParameter("std_mobileno");
		String std_dob = request.getParameter("std_dob");		
		String password = request.getParameter("password");		
		String status = "Active";

		StudentBean b = new StudentBean();
		

		b.setStd_name(std_name);		
		b.setStd_address(std_address);
		b.setEmail(email);
		b.setStd_mobileno(std_mobileno);	
		b.setStd_dob(std_dob);
		b.setPassword(password);
		b.setStatus(status);

		StudentDao dao = new StudentDao();

		if (dao.InsertStudentData(b)) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Registration Successful')");
			out.println("location='StudentLogin.jsp';");
			out.println("</script>");
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Registration UnSuccessful')");
			out.println("location='StudentRegistration.jsp';");
			out.println("</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
