<%@page import="com.tech.blog.DAO.likeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="com.tech.blog.DAO.userDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.posts"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.DAO.PostDao"%>
<%@page import="com.tech.blog.entities.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp"%>
<%
user user = (user) session.getAttribute("currentuser");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>
<%
int postId = Integer.parseInt(request.getParameter("postId"));
PostDao d = new PostDao(ConnectionProvider.getConn());
posts p = d.getallPostsByPostId(postId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=p.getpTitle()%></title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet" href="components/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="components/javascript.js"></script>

<style type="text/css">
.background_clip {
	clip-path: polygon(0 0, 100% 0, 100% 88%, 75% 100%, 35% 89%, 0 99%);
}

body {
	background: url(images/bg-image.jpg);
	background-size: cover;
	background-attachment: fixed;
}

.post-title {
	font-size: 2rem;
	margin-bottom: 1rem;
	color: #0f172a;       /* dark slate / blue-black */
  font-weight: 700;
}

.post-content {
	font-size: 1.05rem;
	line-height: 1.8;
	color: #190097;
}

.post-UserInfo {
	font-size: 20px;
	font-weight: 200;
}

.post-Date {
	font-style: italic;
	font-weight: bold;
}

.post-meta {
	background: rgba(2, 6, 23, 0.6);
	border-radius: 10px;
	border: 1px solid #1e293b;
}

.post-UserInfo a {
	color: #22c55e;
	font-weight: 600;
	text-decoration: none;
}

.post-Date {
	font-size: 0.85rem;
	color: #94a3b8;
}

.post-code pre {
	background: #020617;
	color: #e5e7eb;
	padding: 16px;
	border-radius: 12px;
	overflow-x: auto;
	border: 1px solid #1e293b;
	font-size: 0.9rem;
}


/* FORCE SINGLE POST IMAGE SIZE */
.single-post-img-wrapper {
  width: 100%;
  height: 300px;              /* 👈 FIXED HEIGHT */
  max-height: 340px;
  overflow: hidden;
  border-radius: 12px;
  margin-bottom: 24px;
  border: 1px solid #1e293b;
}

.single-post-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: top center;   /* 👈 THIS FIXES IT */
}



</style>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark primary_background">
		<a class="navbar-brand" href="#"><span class="fa fa-opencart"></span>
			Tech Blog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item "><a class="nav-link" href="index.jsp"><span
						class="fa fa-qq"></span> Learn with Ayush <span class="sr-only">(current)</span></a>
				</li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Categories </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming language</a> <a
							class="dropdown-item" href="#">Data Structures</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Project Implementations</a>
					</div></li>

				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-id-badge"></span> Contact</a></li>

				<li class="nav-item"><a class="nav-link" data-toggle="modal"
					data-target="#add-Post-Modal" href="#"><span
						class="fa fa-pencil-square-o"></span> Do Post</a></li>

			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link active"
					data-toggle="modal" data-target="#exampleModal"><span
						class="fa fa-user-circle-o"></span> <%=user.getName()%></a></li>

				<li class="nav-item"><a class="nav-link active"
					href="logoutServlet"><span class="fa fa-user-circle-o"></span>
						Logout</a></li>
			</ul>
		</div>
	</nav>



	<%
	Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div
		class="alert alert-warning <%=m.getCssClass()%> alert-dismissible fade show"
		role="alert">
		<strong><%=m.getMessage()%></strong>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<%
	session.removeAttribute("msg");
	}
	%>


	<!-- Main Content of the Body -->

	<div class="container">
		<div class="row my-4">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header">
						<h4 class="post-title"><%=p.getpTitle()%></h4>
					</div>

					<div class="card-body">
						<div class="single-post-img-wrapper">
							<img src="postsImages/<%=p.getpPic()%>" class="single-post-img"
								alt="Post Image">
						</div>




						<div
							class="d-flex justify-content-between align-items-center
        			    post-meta mb-4 px-3 py-2">
							<div class="col-md-7">
								<%
								userDao dao = new userDao(ConnectionProvider.getConn());
								user u = dao.getUserbyUserId(p.getUserId());
								%>
								<p class="post-UserInfo">
									<a href="#!"><%=u.getName()%></a> has Posted
								</p>
							</div>
							<div class="col-md-5">
								<p class="post-Date"><%=DateFormat.getDateTimeInstance().format(p.getpDate())%></p>
							</div>
						</div>
						<p class="post-content"><%=p.getpContent()%>

							<br> <br>
						<div class="post-code mt-4">
							<pre>
								<code><%=p.getpCode()%></code>
							</pre>
						</div>


					</div>

					<div class="card-footer primary_background">
						<%
						likeDao dao1 = new likeDao(ConnectionProvider.getConn());
						%>

						<a href="#!" onclick="dolike(<%=user.getId()%>,<%=p.getPid()%>)"
							class="btn btn-outline-light btn-sm"><i
							class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%=dao1.countLike(p.getPid())%></span>
						</a> <a href="#!" class="btn btn-outline-light btn-sm"> <i
							class="fa fa-commenting-o"></i> <span>30</span>
						</a>
					</div>

				</div>
			</div>

		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header primary_background">
					<h5 class="modal-title text-white " id="exampleModalLabel">My
						Profile</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center mt-3">
					<img alt="image"
						src="pfp/<%=user.getProfile()%>?v=<%=System.currentTimeMillis()%>"
						style="width: 20%">

					<h4 class="mt-2">
						Name :
						<%=user.getName()%></h4>


					<!-- Dataa table -->
					<div id="profileDetails">
						<table class="table table-striped mt-2">
							<thead>
								<tr>
									<th scope="col">S-No.</th>
									<th scope="col">Columns</th>
									<th scope="col">Values</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">1</th>
									<td>Email</td>
									<td><%=user.getEmail()%></td>

								</tr>
								<tr>
									<th scope="row">2</th>
									<td>Phone number</td>
									<td><%=user.getPhoneNumber()%></td>

								</tr>
								<tr>
									<th scope="row">3</th>
									<td>Bio</td>
									<td><%=user.getAbout()%></td>
								</tr>
								<tr>
									<th scope="row">4</th>
									<td>Registered Date</td>
									<td><%=user.getDatetime()%></td>
								</tr>
							</tbody>
						</table>
					</div>


					<!-- editable form-->
					<div id="profile-edit" style="display: none">
						<h3 class="mt-2">Please Edit Details Carefully</h3>
						<form action="EditServlet" method="post"
							enctype="multipart/form-data">
							<table class="table">
								<tr>
									<td>Id:</td>
									<td><%=user.getId()%></td>
								</tr>


								<tr>
									<td>Name:</td>
									<td><input type="text" name="user_name"
										class="form-control" value="<%=user.getName()%>"></td>
								</tr>
								<tr>
									<td>Email :</td>
									<td><input type="email" name="user_email"
										class="form-control" value="<%=user.getEmail()%>"></td>
								</tr>
								<tr>
									<td>Mobile number :</td>
									<td><input type="text" name="user_mobile"
										class="form-control" value="<%=user.getPhoneNumber()%>"></td>
								</tr>

								<tr>
									<td>Bio :</td>
									<td><textarea type="email" name="user_Bio"
											class="form-control" rows="2" value="<%=user.getAbout()%>"></textarea></td>
								</tr>

								<tr>
									<td>password:</td>
									<td><input type="text" name="user_password"
										class="form-control" value="<%=user.getPassword()%>"></td>
								</tr>

								<tr>
									<td>New profile pic:</td>
									<td><input type="file" name="image" class="form-control"></td>
								</tr>





							</table>

							<div class="text-center">
								<button type="submit" class=" btn mb-2 btn-primary">Save</button>
							</div>

						</form>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="button" id="Editbtn" class="btn btn-primary">Edit</button>
					</div>
				</div>

			</div>
		</div>
	</div>


	<!-- Posts form -->

	<!-- Modal -->
	<div class="modal fade" id="add-Post-Modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Provide the
						post Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">



					<form action="addPost" id="add-Post-Form" method="post"
						enctype="multipart/form-data">

						<div class="form-group">
							<select class="form-control" name="cid" required>
								<option selected disabled>Select Category</option>
								<%
								PostDao ps = new PostDao(ConnectionProvider.getConn());
								ArrayList<category> al = ps.getAllCategories();
								for (category c : al) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>
								<%
								}
								%>
							</select>

						</div>

						<div class="form-group">
							<input name="PostTitle" type="text"
								placeholder="Enter the form title" class="form-control">
						</div>

						<div class="form-group">
							<textarea name="PostContent" rows="" cols="" class="form-control"
								style="height: 200px" placeholder="Enter you Content"></textarea>
						</div>

						<div class="form-group">
							<textarea name="PostCode" rows="" cols="" class="form-control"
								style="height: 200px" placeholder="Enter your Program(if any)"></textarea>
						</div>

						<div class="form-group">
							<label>Enter you Post image</label> <br> <input
								name="PostPic" type="file" placeholder="Enter your post Image">
						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Post
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>











	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
		integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</body>
</html>