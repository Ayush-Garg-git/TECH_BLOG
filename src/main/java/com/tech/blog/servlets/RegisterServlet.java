package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.DAO.userDao;
import com.tech.blog.entities.user;
import com.tech.blog.helper.ConnectionProvider;


@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name =  req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String phoneNumber = req.getParameter("phoneNumber");
		String about =  req.getParameter("about");
		PrintWriter  out = resp.getWriter();
		System.out.println("name = " + name);
		System.out.println("email = " + email);
		System.out.println("password = " + password);
		System.out.println("phoneNumber = " + phoneNumber);
		System.out.println("about = " + about);

		
		userDao us = new userDao(ConnectionProvider.getConn());
		user  u =  new user(email,password,phoneNumber , about, name);
		System.out.println(u.getName());
		System.out.println(u.getAbout());
		System.out.println(u.getPassword());
		System.out.println(u.getName());
		System.out.println(u.getPhoneNumber());
		
		
		if(us.saveUser(u)) {
			out.print("Done");
		}else {
			out.print("Error Occured");
		}
	
		
	}

	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.service(arg0, arg1);
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
