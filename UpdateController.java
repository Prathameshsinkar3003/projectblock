package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.StudentDao;




@WebServlet("/UpdateController")
public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public UpdateController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String filename=(String) session.getAttribute("filename");
		System.out.println("Filename"+filename);
		String newfile=request.getParameter("newfile");
		String email=(String) session.getAttribute("email");
		System.out.println("file_content"+newfile);

        StudentDao ff=new StudentDao();
		
		if(ff.UpdateContent(filename, newfile))
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Update data successfully..');");
			out.println("location='ViewFile.jsp';");
			out.println("</script>");
			
			
		}
		else
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Data Updation fail..');");
			out.println("location='ViewFile.jsp';");
			out.println("</script>");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
