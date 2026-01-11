package com.tech.blog.helper;

import java.sql.*;

public class ConnectionProvider {
private static Connection conn;
 public static Connection getConn() {
	 try {
		 if(conn==null) {
			 Class.forName("com.mysql.cj.jdbc.Driver");
	 conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog" , "root" ,"AYUSH3578");
	
		 }
		 
		 
	 }catch(Exception e) {
		 e.printStackTrace();
	 }
	return conn;
}
 
 public static void main(String[] args) {
	
}
}
