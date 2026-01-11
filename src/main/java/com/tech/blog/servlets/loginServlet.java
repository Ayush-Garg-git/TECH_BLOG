package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.DAO.userDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.user;
import com.tech.blog.helper.ConnectionProvider;
@WebServlet("/loginServlet")
@MultipartConfig
public class loginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email   = req.getParameter("email");
		String password =  req.getParameter("password");
		PrintWriter out = resp.getWriter();
		userDao userdao = new userDao(ConnectionProvider.getConn());
		
		user user =  userdao.getUserbyEmailandPassword(email, password);
		if(user==null) {
			Message msg = new Message("Invalid details try wih other ", "error", "alert-danger");
			HttpSession session = req.getSession();
			session.setAttribute("msg", msg);
			resp.sendRedirect("login.jsp");
		}else {
			HttpSession session = req.getSession();
			session.setAttribute("currentuser", user);
			resp.sendRedirect("profile.jsp");
		}
	}
	

}
