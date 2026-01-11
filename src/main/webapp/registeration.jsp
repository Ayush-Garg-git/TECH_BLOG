<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
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
.auth-wrapper {
    min-height: 100vh;
    display: flex;
    align-items: latestart;
    justify-content: center;
    padding-top: 90px;   /* FIX: space for navbar */
    padding-bottom: 40px;
}


/* CARD */
.auth-card {
    background-color: #020617;
    padding: 2.5rem;
    border-radius: 16px;
    width: 100%;
    max-width: 450px;
    border: 1px solid #1e293b;
    box-shadow: 0 25px 50px rgba(0,0,0,0.4);
    color: #e5e7eb;
     margin-top: 20px;
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

textarea.form-control {
    resize: none;
}

/* BUTTON */
.btn-auth {
    background-color: #22c55e;
    color: #020617;
    font-weight: 700;
    border: none;
}

.btn-auth:hover {
    background-color: #16a34a;
    color: #020617;
}

/* LINKS */
.auth-card a {
    color: #22c55e;
}
</style>
</head>

<body>

<%@include file="components/navbar.jsp"%>

<div class="auth-wrapper">
    <div class="auth-card">

        <h3 class="text-center mb-4">
            <span class="fa fa-user-plus"></span> Register
        </h3>

        <form id="registerForm" method="post" action="RegisterServlet">

            <div class="mb-3">
                <label>Full Name</label>
                <input type="text" class="form-control" name="name"
                       placeholder="Enter your name" required>
            </div>

            <div class="mb-3">
                <label>Email address</label>
                <input type="email" class="form-control" name="email"
                       placeholder="Enter your email" required>
            </div>

            <div class="mb-3">
                <label>Phone Number</label>
                <input type="text" class="form-control" name="phoneNumber"
                       placeholder="Enter your phone" required>
            </div>

            <div class="mb-3">
                <label>About you</label>
                <textarea class="form-control" name="about"
                          placeholder="Tell us about yourself"
                          rows="3" required></textarea>
            </div>

            <div class="mb-3">
                <label>Password</label>
                <input type="password" class="form-control" name="password"
                       placeholder="Create password" required>
            </div>

            <div class="text-center mb-3" id="loader" style="display:none">
                <span class="fa fa-refresh fa-spin fa-2x"></span>
                <p>Please wait...</p>
            </div>

            <button type="submit" id="submitBtn"
                    class="btn btn-auth w-100">
                Register
            </button>

            <p class="text-center mt-4">
                Already have an account? <a href="login.jsp">Login</a>
            </p>

        </form>

    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
$(document).ready(function () {
    $('#registerForm').on('submit', function (event) {
        event.preventDefault();

        let form = new FormData(this);

        $('#submitBtn').hide();
        $('#loader').show();

        $.ajax({
            url: 'RegisterServlet',
            type: 'POST',
            data: form,
            processData: false,
            contentType: false,
            success: function () {
                $('#submitBtn').show();
                $('#loader').hide();

                Swal.fire({
                    title: "Registered Successfully",
                    icon: "success"
                }).then(() => {
                    window.location = "login.jsp";
                });
            }
        });
    });
});
</script>

</body>
</html>
