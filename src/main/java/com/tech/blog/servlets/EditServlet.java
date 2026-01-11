package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.DAO.userDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.user;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.helper;

@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(">>> EditServlet NEW CODE LOADED");

		String email = req.getParameter("user_email");
		String password = req.getParameter("user_password");
		String bio = req.getParameter("user_Bio");
		String name = req.getParameter("user_name");
		String mobilenumber = req.getParameter("user_mobile");

		Part part = req.getPart("image");
		String imageName = part.getSubmittedFileName();

		HttpSession session = req.getSession();
		user u = (user) session.getAttribute("currentuser");

		// save old profile pic name before updating user
		String oldPic = u.getProfile();

		// update user object
		u.setEmail(email);
		u.setAbout(bio);
		u.setPassword(password);
		u.setPhoneNumber(mobilenumber);
		u.setProfile(imageName);
		u.setName(name);
		PrintWriter out = resp.getWriter();
		// update DB
		userDao dao = new userDao(ConnectionProvider.getConn());
		boolean updated = dao.updateUser(u);
		System.out.println("REAL PATH = " + req.getServletContext().getRealPath("/"));

		if (updated) {

			String path = req.getRealPath("/") + "pfp" + File.separator + u.getProfile();
			helper.deletefile(path);
			boolean res2 = helper.saveFile(part.getInputStream(), path);
			if (res2) {
				Message msg = new Message("Profile Updated successfully...", "success", "alert-success");
				session.setAttribute("msg", msg);
			} else {
				Message msg = new Message("Something went wrong...", "error", "alert-danger");
				session.setAttribute("msg", msg);
			}
		} else {
			Message msg = new Message("Something went wrong...", "error", "alert-danger");
			session.setAttribute("msg", msg);
		}
		
		
		resp.sendRedirect("profile.jsp");
		
	}

}
