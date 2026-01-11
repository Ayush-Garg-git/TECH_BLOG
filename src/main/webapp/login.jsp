<%@page import="com.tech.blog.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
	<link rel="stylesheet" href="components/style.css">
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
/* PAGE BACKGROUND */
body {
    background: linear-gradient(135deg, #020617, #0b132b);
    min-height: 100vh;
}

/* CENTER WRAPPER */
.login-wrapper {
    min-height: calc(100vh - 70px);
    display: flex;
    align-items: center;
    justify-content: center;
}

/* LOGIN CARD */
.login-card {
    background-color: #020617;
    padding: 2.5rem;
    border-radius: 16px;
    width: 100%;
    max-width: 380px;
    border: 1px solid #1e293b;
    box-shadow: 0 25px 50px rgba(0,0,0,0.4);
    color: #e5e7eb;
}

/* HEADINGS */
.login-card h3 {
    color: #ffffff;
}

/* INPUTS */
.form-control {
    background-color: #020617;
    border: 1px solid #1e293b;
    color: #e5e7eb;
}

.form-control::placeholder {
    color: #94a3b8;
}

.form-control:focus {
    background-color: #020617;
    border-color: #22c55e;
    box-shadow: none;
    color: #ffffff;
}

/* PRIMARY BUTTON */
.btn-login {
    background-color: #22c55e;
    color: #020617;
    border: none;
    font-weight: 700;
}

.btn-login:hover {
    background-color: #16a34a;
    color: #020617;
}

/* LINKS */
.login-card a {
    color: #22c55e;
    text-decoration: none;
}

.login-card a:hover {
    text-decoration: underline;
}

.alert-dark {
    background-color: #020617;
    border: 1px solid #1e293b;
    color: #e5e7eb;
}

</style>

</head>
<body>

<%@include file="components/navbar.jsp" %>

<div class="login-wrapper">
  	<div class="login-card">
				<h3 class="text-center mb-4"><span class="fa fa-sign-in"></span>  Login</h3>
    			<form method="post" action="loginServlet">
			   		<%
							Message m= (Message) session.getAttribute("msg");
			    			if(m!=null){
			    	 %>
						<div class="alert alert-dark <%= m.getCssClass() %> alert-dismissible fade show">
						  <strong><%= m.getMessage() %></strong>
						  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
						    <span aria-hidden="true">&times;</span>
						</button>
						</div>
					<%
						session.removeAttribute("msg");
						}
					%>
    
			      <div class="mb-3">
			        <label for="email" class="form-label">Email address</label>
			        <input type="email" name="email" class="form-control" id="email" placeholder="Enter your email">
			      </div>
			
			      <div class="mb-3">
			        <label for="password" class="form-label">Password</label>
			        <input type="password" name="password" class="form-control" id="password" placeholder="Enter your password">
			      </div>
				 <div class="d-flex justify-content-between align-items-center mb-3">
			        <div>
			          <input type="checkbox" id="remember">
			          <label for="remember" class="small">Remember me</label>
			        </div>
			        <a href="#" class="small">Forgot password?</a>

			      </div>
			
			    <button type="submit" class="btn btn-primary w-100">Login</button>

			    </form>
			
			    <p class="text-center text-muted mt-4">
			      Don’t have an account? <a href="registeration.jsp">Sign up</a>
			    </p>
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
		
	
</body>
</html>