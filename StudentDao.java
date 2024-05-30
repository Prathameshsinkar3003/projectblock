package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.bean.StudentBean;
import com.bean.UploadBean;
import com.connection.DBConnection;

public class StudentDao {
	
	Connection connection=null;
	Boolean resultStatus=Boolean.FALSE;
	PreparedStatement ps;
	ResultSet rs;
    Statement st=null;
    String sql;
    boolean flag = false;
    
    public static void insert(UploadBean bean) {
		try {

			PreparedStatement ps;

			String sql = "insert into tbl_audit(username,filename,file,filekey,hashcode) values(?,?,?,?,?)";
			Connection con = DBConnection.getConnection();

			ps = con.prepareStatement(sql);

			ps.setString(1, bean.getCloudname());
			ps.setString(2, bean.getFilename());

			ps.setBlob(3, bean.getFile());

			ps.setString(4, bean.getKey());
			ps.setString(5, bean.getHashcode());
			int index = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
    
    public boolean UpdateContent(String filename,String filecontent)
	   {
		   String sql="update tbl_files set file='"+filecontent+"' where filename='"+filename+"'";
		   
		try {
			Connection con=DBConnection.getConnection();
			PreparedStatement ps=con.prepareStatement(sql);
		
			int index=ps.executeUpdate(sql);
			
			if(index>0)
			{
				flag=true;
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
			
		   return flag;
	   }

	public boolean InsertStudentData(StudentBean b) {
		sql = "insert into student(std_name,std_address,email,std_mobileno,std_dob,password,status) values(?,?,?,?,?,?,?)";

		Connection con = DBConnection.getConnection();

		try {
			ps = con.prepareStatement(sql);
			
			
			ps.setString(1, b.getStd_name());
			ps.setString(2, b.getStd_address());
			ps.setString(3, b.getEmail());
			ps.setString(4, b.getStd_mobileno());
			ps.setString(5, b.getStd_dob());
			ps.setString(6, b.getPassword());
			ps.setString(7, b.getStatus());
			

			int index = ps.executeUpdate();

			if (index > 0) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return flag;
	}

	public StudentBean CheckStudent(String email, String password) {
		StudentBean bean=new StudentBean();
		sql = "select * from student where email='" + email + "' and password='" + password + "' ";
		int flag = 0;
		try {
			Statement stmt = DBConnection.getConnection().createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				flag = 1;
				bean.setStd_id(rs.getInt(1));
				bean.setStd_name(rs.getString(2));					
				bean.setStd_address(rs.getString(3));
				bean.setEmail(rs.getString(4));
				bean.setStd_mobileno(rs.getString(5));
				bean.setStd_dob(rs.getString(6));
				bean.setPassword(rs.getString(7));
				bean.setStatus(rs.getString(8));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
		if(flag ==1)
			return bean;
		else 
			return null;
	}

	public boolean UpdateStudentPassword(String oldpass, String newpass) {
sql="update student set password=? where password='"+oldpass+"'";
		
		Connection con = DBConnection.getConnection();
		
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, newpass);
			
			int index=ps.executeUpdate();
			
			if(index>0)
			{
				flag=true;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return flag;
	}

	public boolean DeleteStudent(int id) {
		String sql="delete from student where id='"+id+"'";
		 Connection con=DBConnection.getConnection();
		 try {
			ps=con.prepareStatement(sql);
			int index =ps.executeUpdate();
			if(index>0)
			{
				flag=true;
			}
			else
			{
				flag=false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 
			return flag;
	}

	public ResultSet getfilename(String file_name) {
		sql = "select filename from tbl_files where filename='" + file_name + "'";

		Connection con = DBConnection.getConnection();

		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return rs;
	}

	/*public static void insert(UploadBean bean) {
		try {

			PreparedStatement ps;

			String sql = "insert into tbl_audit(username,filename,file,filekey) values(?,?,?,?)";
			Connection con = DBConnection.getConnection();

			ps = con.prepareStatement(sql);

			ps.setString(1, bean.getCloudname());
			ps.setString(2, bean.getFilename());

			ps.setBlob(3, bean.getFile());

			ps.setString(4, bean.getKey());
			int index = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


*/
	
	

	

}
