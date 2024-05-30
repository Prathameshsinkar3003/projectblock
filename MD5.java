package com.algo;

	import java.security.MessageDigest;
	import java.security.NoSuchAlgorithmException;

	public class MD5 {
		 public  String generate(String title) 
		    {
		        String TitleToHash = title;
		        String generatedHashcode = null;
		        try {
		            // Create MessageDigest instance for MD5
		            MessageDigest md = MessageDigest.getInstance("MD5");
		            
		            //Add title bytes to digest
		            md.update(TitleToHash.getBytes());
		            
		            //Get the hash's bytes 
		            byte[] bytes = md.digest();
		            //This bytes[] has bytes in decimal format;
		            //Convert it to hexadecimal format
		            
		            StringBuilder sb = new StringBuilder();
		            for(int i=0; i< bytes.length ;i++)
		            {
		                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
		            }
		            //Get complete hashed password in hex format
		            generatedHashcode = sb.toString();
		            System.out.println(generatedHashcode);
		        } 
		        catch (NoSuchAlgorithmException e) 
		        {
		            e.printStackTrace();
		        }
		        return generatedHashcode;
		    }
	}


