package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.DAO.PostDao;
import com.tech.blog.entities.posts;
import com.tech.blog.entities.user;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.helper;

@WebServlet("/addPost")
@MultipartConfig(
		    fileSizeThreshold = 1024 * 1024 * 1,   // 1 MB buffer
		    maxFileSize = 1024 * 1024 * 10,        // 10 MB per file
		    maxRequestSize = 1024 * 1024 * 20      // 20 MB total
		)

public class addPost extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		String Ptitle = req.getParameter("PostTitle");
		int cid =Integer.parseInt(req.getParameter("cid"));
		String PContent = req.getParameter("PostContent");
		String PCode = req.getParameter("PostCode");
		Part part = req.getPart("PostPic");
		HttpSession session = req.getSession();
		user user1 = (user) session.getAttribute("currentuser");
		
		posts p = new posts(user1.getId() , Ptitle , PContent , PCode ,part.getSubmittedFileName() , null , cid);
		
		PostDao postDao = new PostDao(ConnectionProvider.getConn());
		if(postDao.savePost(p)) {
			String path = getServletContext().getRealPath("/") +
                    "postsImages" + File.separator + part.getSubmittedFileName();

            helper.saveFile(part.getInputStream(), path);
            resp.getWriter().print("done");
		}else {
			resp.getWriter().print("Error");
		}
		
		
	}

	

}
