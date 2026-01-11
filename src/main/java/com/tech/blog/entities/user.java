package com.tech.blog.entities;

import java.security.Timestamp;

public class user {
	private int id;
	private String email;
	private String password;
	private String phoneNumber;
	private java.sql.Timestamp datetime;
	private String about;
	private String name;
	private String profile;
	
	public user(int id, String email, String password, String phoneNumber,  String about,
			String name) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.phoneNumber = phoneNumber;
		this.datetime = datetime;
		this.about = about;
		this.name = name;
	}
	public user(String email, String password, String phoneNumber, String about, String name) {
		super();
		this.email = email;
		this.password = password;
		this.phoneNumber = phoneNumber;
		this.about = about;
		this.name = name;
	}
	public user() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public java.sql.Timestamp getDatetime() {
		return datetime;
	}
	public void setDatetime(java.sql.Timestamp timestamp) {
		this.datetime = timestamp;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}

	
	
	
	
}
