package com.tech.blog.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class likeDao {
Connection con;

public likeDao(Connection con) {
	this.con = con;
}


public boolean insertLike(int pid , int uid) {
	boolean f = false;
	try {
		String query = "insert into liked(pid,uid) values(?,?)";
		PreparedStatement ps = this.con.prepareStatement(query);
		ps.setInt(1, pid);
		ps.setInt(2, uid);
		ps.executeUpdate();
		f=true;
	}catch(Exception e ) {
		e.printStackTrace();
	}
	
	return f;
}

public int countLike(int pid) {
	int count = 0;
	String s = "select count(*) from liked where pid= ?";
	try {
		PreparedStatement ps = con.prepareStatement(s);
		ps.setInt(1, pid);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			count = rs.getInt(1);
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return count;
}
public boolean checkIsLiked(int pid , int uid) {
	boolean f = false;
	try {
		String s = "select * from liked where pid=? and uid= ?";
		PreparedStatement ps = this.con.prepareStatement(s);
		ps.setInt(1, pid);
		ps.setInt(2, uid);
		ResultSet  rs =  ps.executeQuery();
		if(rs.next()) {
			f=true;
		}
	}catch(Exception e ) {
		e.printStackTrace();
	}
	
	return f ;

}

public boolean deleteLike(int pid , int uid) {
	boolean f = false;
	try {
		PreparedStatement ps = this.con.prepareStatement("delete * from liked where pid=? and uid=?");
		ps.setInt(1, pid);
		ps.setInt(2, uid);
		ps.executeUpdate();
		
		f=true;
	}catch(Exception e) {
		e.printStackTrace();
	}
	return f;
}

}
