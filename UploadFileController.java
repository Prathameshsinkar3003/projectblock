package com.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.algo.Encryptor;
import com.algo.KeyGeneration;
import com.algo.MD5;
import com.bean.UploadBean;
import com.connection.DBConnection;
import com.dao.StudentDao;

@WebServlet("/UploadFileController")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50)
public class UploadFileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UploadFileController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		HttpSession ss=request.getSession();
		String username=(String) ss.getAttribute("email");
	
		String filename=request.getParameter("file");
		String groupname=(String) ss.getAttribute("groupname");
		UploadBean bean=new UploadBean();
		bean.setFilename(filename);
		bean.setCloudname(username);
		bean.setGroupname(groupname);
		InputStream inputStream = null;
		InputStream inputStream1 = null;
		
        Part part=request.getPart("file1");
        String file_name=extractFileName(part);
        
        MD5 md5=new MD5();
		String hashcode=md5.generate(file_name);
        
        System.out.println("FirstPath==="+file_name); 
        

      
        StudentDao dao=new StudentDao();
      
      
        ResultSet rm=dao.getfilename(file_name);
        try {
			if(rm.next())
			{
				System.out.println("File Name Exists. Please Change File Name");
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('File Name Exists. Please Change File Name.........');");  
				out.println("</script>");    
				request.getRequestDispatcher("UploadFile.jsp").include(request, response);
			}
			else {
			
			 String savePath="C:\\"+File.separator+"Files";
			
			
			
			ArrayList<String> list=new ArrayList<String>();
			
     
			
			list.add(savePath);
			//list.add(EncryptedPath);

			
			for(String s:list)
			{
			File fileSaveDir=new File(s);
			   if(!fileSaveDir.exists())
			   {
			       fileSaveDir.mkdir();
			   }
			} 
			
      
			String filePath= savePath + File.separator + file_name ; 
			
			System.out.println("C Drive file path"+filePath);
			Encryptor bfe=new Encryptor();
			
			try {
				
				bfe.encrypt(filePath);
				
				  
			} catch (Exception e1) {
				
				e1.printStackTrace();
			}
      
           KeyGeneration key=new KeyGeneration();
           String filekey=key.blowFishKey(file_name);
           
			part.write(filePath);
			//String file = EncryptedPath + File.separator + file_name ; 
			
			if (part != null) 
			{
			    System.out.println(part.getName());
			    System.out.println(part.getSize());
			    System.out.println(part.getContentType());
			  
			    inputStream = part.getInputStream();
			    inputStream1 = part.getInputStream();
			}
			 bean.setFilename(file_name);
			    bean.setKey(filekey);
			
				bean.setFile(inputStream);
				bean.setFile1(inputStream1);
				bean.setHashcode(hashcode);
				StudentDao.insert(bean);
			    Connection conn = DBConnection.getConnection();
			   
			    
			  try {
				
				PreparedStatement ps;
				
				String sql="insert into tbl_files(username,filename,file,filekey,hashcode) values(?,?,?,?,?)";
				Connection con=DBConnection.getConnection();
				
					ps=con.prepareStatement(sql);
			
					ps.setString(1, bean.getCloudname());
					ps.setString(2, bean.getFilename());
				
					
					if(inputStream!=null)
					{
						ps.setBlob(3, inputStream1);
					}
					
					ps.setString(4, bean.getKey());
					ps.setString(5, bean.getHashcode());
				
					int index=ps.executeUpdate();
					
					
					if(index>0)
					{
						
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Upload File Successfully');");
						out.println("location='UploadFile.jsp';");
						
						out.println("</script>");
					}
					
					
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
				
			finally
			{
			 if (conn != null) 
			 {
			     try
			     {
			         conn.close();
			     } 
			     
			     catch (SQLException ex)
			     {
			         ex.printStackTrace();
			     }
			 }
			}}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
        
            }
	
	private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
