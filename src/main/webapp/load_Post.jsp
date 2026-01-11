<%@page import="com.tech.blog.entities.user"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tech.blog.DAO.likeDao"%>
<%@page import="com.tech.blog.entities.posts"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.DAO.PostDao"%>
<%@page errorPage="error.jsp"%>

<div class="row">
<%
    PostDao p = new PostDao(ConnectionProvider.getConn());
    user uu = (user) session.getAttribute("currentuser");
		System.out.print(uu.getName());
    List<posts> li = null;
    int cid = Integer.parseInt(request.getParameter("cid"));

    if (cid == 0) {
        li = p.getallPosts();
    } else {
        li = p.getallPostsByCatId(cid);
    }

    if (li.size() == 0) {
%>
    <div class="col-12 text-center text-light">
        <h3>No posts available in this category</h3>
    </div>
<%
        return;
    }

    for (posts pp : li) {
%>

    <!-- CARD -->
    <div class="col-md-6 col-lg-4 mb-4">
   <div class="card post-card h-100 d-flex flex-column">

    <!-- IMAGE -->
    <div class="post-img-wrapper">
        <img src="postsImages/<%=pp.getpPic()%>" class="post-img" alt="Post Image">
    </div>

    <!-- BODY -->
    <div class="card-body d-flex flex-column">
        <%
            String content = pp.getpContent();
            String shortContent = content.length() > 130 
                ? content.substring(0, 130) + "..." 
                : content;
        %>

        <h6 class="post-title"><%=pp.getpTitle()%></h6>
        <p class="post-text"><%=shortContent%></p>

        <!-- THIS is the key -->
        <div class="mt-auto"></div>
    </div>

    <!-- FOOTER -->
    <div class="card-footer post-card-footer text-center">
        <%
            likeDao dao2 = new likeDao(ConnectionProvider.getConn());
        %>

        <a href="#!" class="btn btn-sm btn-like"
           onclick="dolike(<%=uu.getId()%>,<%=pp.getPid()%>)">
            <i class="fa fa-thumbs-o-up"></i>
            <span class="like-counter"><%=dao2.countLike(pp.getPid())%></span>
        </a>

        <a href="show_Single_Post.jsp?postId=<%=pp.getPid()%>"
           class="btn btn-sm btn-read">
            Read More
        </a>

        <a href="#!" class="btn btn-sm btn-comment">
            <i class="fa fa-commenting-o"></i> 30
        </a>
    </div>
</div>

    </div>

<%
    }
%>
</div>
