package com.tech.blog.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tech.blog.entities.user;
import com.tech.blog.helper.ConnectionProvider;

public class userDao {
	
private Connection con;

public userDao(Connection con) {
	super();
	this.con = con;
}

public user getUserbyEmailandPassword(String email , String password) {
	user user = null;
	try {
	String query =  "select * from users where email = ? and password = ?" ;
	PreparedStatement ps = ConnectionProvider.getConn().prepareStatement(query);
	ps.setString(1, email);
	ps.setString(2, password);
ResultSet rs = 	ps.executeQuery();

while(rs.next()) {
	user = new user(); 
	user.setName(rs.getString("name"));
	user.setAbout(rs.getString("about"));
	user.setDatetime(rs.getTimestamp("Rdate"));
	user.setId(Integer.parseInt(rs.getString("id")));
	user.setEmail(rs.getString("email"));
	user.setPhoneNumber(rs.getString("phonenumber"));
	user.setPassword(rs.getString("password"));
	user.setProfile(rs.getString("profile"));
	
}
	}catch(Exception e) {
		e.printStackTrace();
	}
	return user;
}

// method to insert user to Database 
public boolean saveUser(user u) {
	try {
		String query = "insert into users(name,email,password , phonenumber , about ) values(?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, u.getName());
		pstmt.setString(2, u.getEmail());
		pstmt.setString(3, u.getPassword());
		pstmt.setString(4, u.getPhoneNumber());
		pstmt.setString(5, u.getAbout());
		
		int n = pstmt.executeUpdate();
		if(n>0) {
			return true;
		}else {
			return false;
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	
	return false;
}


public boolean updateUser(user u ) {
	try {
		String query  =  "update users set name = ? , email = ? , password = ? , about = ?, profile= ?   , phonenumber = ? where id = ? ";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, u.getName());
		ps.setString(2, u.getEmail());
		ps.setString(3, u.getPassword());
		ps.setString(4, u.getAbout());
		ps.setString(5, u.getProfile());
		ps.setString(6, u.getPhoneNumber());
		ps.setInt(7,u.getId());
		ps.executeUpdate();
		return true;
		
	}catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
		return false;
	}
}

public user getUserbyUserId(int id) {
	user user = null;
	try {
		String query = "select * from users where id=? ";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			user = new user(); 
			user.setName(rs.getString("name"));
			user.setAbout(rs.getString("about"));
			user.setDatetime(rs.getTimestamp("Rdate"));
			user.setId(Integer.parseInt(rs.getString("id")));
			user.setEmail(rs.getString("email"));
			user.setPhoneNumber(rs.getString("phonenumber"));
			user.setPassword(rs.getString("password"));
			user.setProfile(rs.getString("profile"));
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return user;
}
}
