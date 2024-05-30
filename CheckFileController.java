package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.StaffDao;




@WebServlet("/CheckFileController")
public class CheckFileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public CheckFileController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        PrintWriter out=response.getWriter();
		int id=Integer.parseInt(request.getParameter("id"));
		String user_email=request.getParameter("username");
		String file_name=request.getParameter("filename");
		String file_content=request.getParameter("file");
		
		StaffDao dao=new StaffDao();
		
		if(dao.CheckFileContent(user_email, file_name, file_content))
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('File Content not Chnaged..');");
			out.println("location='ViewFileStaff.jsp';");
			out.println("</script>");
			
			
		}
		else
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('File Content Corrupted..');");
			out.println("location='ViewFileStaff.jsp';");
			out.println("</script>");
			
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
