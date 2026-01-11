<%@page import="com.tech.blog.entities.category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.DAO.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet" href="components/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.background_clip {
	clip-path: polygon(0 0, 100% 0, 100% 88%, 75% 100%, 35% 89%, 0 99%);
}

body {
	background: linear-gradient(135deg, #020617, #0b132b);
	color: #212529;
}

/* CATEGORY SIDEBAR */
.category-card {
	background: #020617;
	border: 1px solid #1e293b;
	border-radius: 14px;
	padding: 14px;
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.4);
	position: sticky;
	top: 90px;
}

.category-title {
	color: #22c55e;
	text-align: center;
	font-weight: 600;
	margin-bottom: 12px;
	letter-spacing: 0.5px;
}

/* CATEGORY ITEMS */
.category-list .list-group-item {
	background: transparent;
	border: none;
	color: #cbd5f5;
	padding: 10px 14px;
	margin-bottom: 6px;
	border-radius: 8px;
	transition: all 0.25s ease;
	cursor: pointer;
}

/* HOVER */
.category-list .list-group-item:hover {
	background: rgba(34, 197, 94, 0.15);
	color: #22c55e;
	transform: translateX(4px);
}

/* ACTIVE */
.category-list .list-group-item.active {
	background: #22c55e;
	color: #020617;
	font-weight: 600;
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
	System.out.print(m);

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

	<!-- Body Of the Page (Side bar) -->
	<main>
		<div class="container">
			<div class="row mt-4">
				<div class="col-md-2">
					<div class="category-card">
						<h6 class="category-title">
							<i class="fa fa-filter"></i> Categories
						</h6>

						<div class="list-group category-list">
							<a href="#" onclick="getPosts(0,this)"
								class="c-link list-group-item active"> <i
								class="fa fa-th-large mr-2"></i> All Posts
							</a>

							<%
							PostDao p = new PostDao(ConnectionProvider.getConn());
							ArrayList<category> list = p.getAllCategories();
							for (category c : list) {
							%>
							<a href="#" onclick="getPosts(<%=c.getCid()%>,this)"
								class="c-link list-group-item"> <i
								class="fa fa-angle-right mr-2"></i> <%=c.getName()%>
							</a>
							<%
							}
							%>
						</div>
					</div>
				</div>



				<div class="col-md-10">
					<div class="container text-center" id="loader">
						<i class="fa fa-refresh fa-4x fa-spin"></i>
						<h3 class="mt-2">Loading...</h3>
					</div>

					<div class="container" id="postsBox"></div>
				</div>
			</div>
		</div>

	</main>

	<!--  Modal -->
	<!-- Button trigger modal -->

	<!-- Profile Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content profile-modal">
				<div class="modal-header">
					<h5 class="modal-title">My Profile</h5>
					<button type="button" class="close text-light" data-dismiss="modal">
						&times;</button>
				</div>
				
				
				<div class="modal-body text-center">

					<!-- AVATAR -->
					<img class="profile-avatar height: 20px;"
						src="pfp/<%=user.getProfile()%>?v=<%=System.currentTimeMillis()%>">

					<h4 class="mt-3"><%=user.getName()%></h4>
					<p class="text-muted"><%=user.getEmail()%></p>

					<!-- VIEW MODE -->
					<div id="profileDetails" class="profile-info mt-4 text-left">

						<div class="info-row">
							<span>📞 Phone</span> <span><%=user.getPhoneNumber()%></span>
						</div>

						<div class="info-row">
							<span>🧠 Bio</span> <span><%=user.getAbout()%></span>
						</div>

						<div class="info-row">
							<span>📅 Joined</span> <span><%=user.getDatetime()%></span>
						</div>

					</div>

					<!-- EDIT MODE -->
					<div id="profile-edit" style="display: none" class="mt-4">

						<form action="EditServlet" method="post"
							enctype="multipart/form-data">

							<input type="text" name="user_name" class="form-control mb-2"
								value="<%=user.getName()%>"> <input type="email"
								name="user_email" class="form-control mb-2"
								value="<%=user.getEmail()%>"> <input type="text"
								name="user_mobile" class="form-control mb-2"
								value="<%=user.getPhoneNumber()%>">

							<textarea name="user_Bio" class="form-control mb-2" rows="2"><%=user.getAbout()%></textarea>

							<input type="password" name="user_password"
								class="form-control mb-2" placeholder="New password"> <input
								type="file" name="image" class="form-control mb-3">

							<button type="submit" class="btn btn-success w-100">
								Save Changes</button>

						</form>
					</div>

				</div>

				<!-- FOOTER -->
				<div class="modal-footer">
					<button class="btn btn-outline-light" data-dismiss="modal">Close</button>
					<button id="Editbtn" class="btn btn-primary">Edit</button>
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
					<h5 class="modal-title font-weight-bold" id="exampleModalLabel">Provide the
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
							<select class="form-control" name="cid">
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

	<script>
		$(document).ready(function() {
			let a = 1;
			$('#Editbtn').click(function() {
				if (a == 1) {
					$("#profileDetails").hide()
					$("#profile-edit").show()
					a = 0;
					$(this).text("Back")
				} else {
					$("#profileDetails").show()
					$("#profile-edit").hide()
					a = 1;
					$(this).text("Edit")
				}

			})
		});
	</script>



	<!-- Now add Post js -->

	<script>
		$(document).ready(function(e) {
			$("#add-Post-Form").on("submit", function(event) {
				// this code gets called when form is submited

				event.preventDefault();
				let form = new FormData(this);
				// now requesting to server
				$.ajax({
					url : "addPost",
					type : 'POST',
					data : form,
					success : function(data, textStatus, jqXHR) {
							console.log(data);
							if(data.trim() == 'done'){
								Swal.fire({
								    title: "Posted Successfully!",
								    icon: "success",
								    confirmButtonText: "OK"
								}).then(()=> {
									$("#add-post-Modal").modal("hide");
									$("#add-Post-Form")[0].reset();
								});

							}else{
								swal("Error !!" ,"Something went wrong " , "error");
							}
					},
					error : function(jqXHR, textStatus, errorThrown) {

					},

					processData : false,
					contentType : false
				})

			})
		})
	</script>

	<!-- Loading Posts  -->
	<script>
		function getPosts(catId,temp){
			
			$("#loader").show();
			$('.c-link').removeClass('active');
			$.ajax({
				url : "load_Post.jsp",
				data : {cid:catId},
				success : function(data,textStatus,jqXHR){
					$("#loader").hide();
					$("#postsBox").show();
					$("#postsBox").html(data);
					$(temp).addClass("active");
				}
			})
		}
	
	$(document).ready(function (e){
		let getAllPostRefrence = $('.c-link')[0]
		getPosts(0,getAllPostRefrence);
	})
	</script>
</body>
</html>