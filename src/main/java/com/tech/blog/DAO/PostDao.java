package com.tech.blog.DAO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.category;
import com.tech.blog.entities.posts;
public class PostDao {
Connection con ;
public PostDao(Connection con) {
	this.con = con;
}


public ArrayList<category> getAllCategories(){

	ArrayList<category> list=  new ArrayList<category>();
	
	try {
		String query = "select * from categories";
		
		PreparedStatement ps = con.prepareStatement(query);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
		int cid = rs.getInt("cid");
		String name = rs.getString("cName");
		String description =  rs.getString("description");
		String Image = rs.getString("image");
		category c = new category(cid,name,description,Image);
		list.add(c);
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	return list;
}


public boolean savePost(posts p) {
	try {
		String query ="insert into posts(ptitle , pContent ,pCode , pPic ,catID,userId) values(?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, p.getpTitle());
		ps.setString(2, p.getpContent());
		ps.setString(3, p.getpCode());
		ps.setString(4, p.getpPic());
		ps.setInt(5, p.getCatId());
		ps.setInt(6, p.getUserId());
		ps.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
		return false;
	}
	
	return true;
}


public List<posts> getallPosts(){
	List<posts> li = new ArrayList<>();
	try {
		String query ="select * from posts order by pid desc";
		PreparedStatement ps = con.prepareStatement(query);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			int pid = rs.getInt("pid");
			String title =  rs.getString("ptitle");
			String content = rs.getString("pContent");
			String code = rs.getString("pCode");
			String pic = rs.getString("pPic");
			Timestamp date = rs.getTimestamp("pDate");
			int catId = rs.getInt("catID");
			int userId =  rs.getInt("userId");
			posts p = new posts(userId,pid, title, content, code, pic, date, catId);
			
			li.add(p);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return li;
}

public List<posts> getallPostsByCatId(int id ){
	List<posts> li = new ArrayList<>();
	try {
		String query ="select * from posts where catID=?";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			int pid = rs.getInt("pid");
			String title =  rs.getString("ptitle");
			String content = rs.getString("pContent");
			String code = rs.getString("pCode");
			String pic = rs.getString("pPic");
			Timestamp date = rs.getTimestamp("pDate");
			int userId =  rs.getInt("userId");
			posts p = new posts(userId,pid, title, content, code, pic, date, id);
			
			li.add(p);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return li;
}


public posts getallPostsByPostId(int id ){
	List<posts> li = new ArrayList<>();
	posts p =null;
	try {
		String query ="select * from posts where pid=?";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			int cID = rs.getInt("catID");
			String title =  rs.getString("ptitle");
			String content = rs.getString("pContent");
			String code = rs.getString("pCode");
			String pic = rs.getString("pPic");
			Timestamp date = rs.getTimestamp("pDate");
			int userId =  rs.getInt("userId");
			 p = new posts(userId,id, title, content, code, pic, date, cID);
			
			li.add(p);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return p;
}
}
