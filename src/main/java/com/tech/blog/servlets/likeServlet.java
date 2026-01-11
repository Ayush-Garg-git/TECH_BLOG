package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpClient;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.DAO.likeDao;
import com.tech.blog.helper.ConnectionProvider;
@WebServlet("/likeServlet")
public class likeServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String operation = req.getParameter("operation");
		int uid = Integer.parseInt(req.getParameter("uid"));
		int pid = Integer.parseInt(req.getParameter("pid"));
//		resp.setContentType("text/html");

		
		PrintWriter out = resp.getWriter();
		likeDao dao = new likeDao(ConnectionProvider.getConn());
		if(operation.equals("Like")){
			boolean f =  dao.insertLike(pid, uid);
			out.print(f);
		}
	}

}
