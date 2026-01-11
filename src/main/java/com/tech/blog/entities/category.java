package com.tech.blog.entities;
// this class is used to represent categories
public class category {
private int cid;
private String name;
private String description;
private String imageName;
public int getCid() {
	return cid;
}
public void setCid(int cid) {
	this.cid = cid;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getImageName() {
	return imageName;
}
public void setImageName(String imageName) {
	this.imageName = imageName;
}
public category(int cid, String name, String description, String imageName) {
	this.cid = cid;
	this.name = name;
	this.description = description;
	this.imageName = imageName;
}
public category(String name, String description, String imageName) {
	
	this.name = name;
	this.description = description;
	this.imageName = imageName;
}





}
