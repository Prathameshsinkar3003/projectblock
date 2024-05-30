package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.bean.StaffBean;
import com.bean.StudentBean;
import com.connection.DBConnection;

public class StaffDao {

	Connection connection=null;
	Boolean resultStatus=Boolean.FALSE;
	PreparedStatement ps;
	ResultSet rs;
    Statement st=null;
    String sql;
    boolean flag = false;
    
    public boolean CheckFileContent(String user_email,String file_name,String file_content)
	   {
		   
		   
		  String sql="select * from tbl_audit where username='"+user_email+"' && filename='"+file_name+"' && file='"+file_content+"'";
		  
		 Connection con=DBConnection.getConnection();
		 
		 try {
			PreparedStatement ps=con.prepareStatement(sql);
		
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				flag=true;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		 
		 return flag;
	   }
	public boolean InsertStaffData(StaffBean b) {
		sql = "insert into staff(name,address,email,mobileno,dob,password,status) values(?,?,?,?,?,?,?)";

		Connection con = DBConnection.getConnection();

		try {
			ps = con.prepareStatement(sql);
			
			
			ps.setString(1, b.getName());
			ps.setString(2, b.getAddress());
			ps.setString(3, b.getEmail());
			ps.setString(4, b.getMobileno());
			ps.setString(5, b.getDob());
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
	public StaffBean CheckStaff(String email, String password) {
		StaffBean bean=new StaffBean();
		sql = "select * from staff where email='" + email + "' and password='" + password + "' ";
		int flag = 0;
		try {
			Statement stmt = DBConnection.getConnection().createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				flag = 1;
				bean.setId(rs.getInt(1));
				bean.setName(rs.getString(2));					
				bean.setAddress(rs.getString(3));
				bean.setEmail(rs.getString(4));
				bean.setMobileno(rs.getString(5));
				bean.setDob(rs.getString(6));
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
	public boolean UpdateStaffPassword(String oldpass, String newpass) {
    sql="update staff set password=? where password='"+oldpass+"'";
		
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
	public boolean DeleteStaff(int id) {
		String sql="delete from staff where id='"+id+"'";
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
}
