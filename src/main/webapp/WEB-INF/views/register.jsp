<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | Codify</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../css/style.css">
    <style>
        body {
            background: linear-gradient(135deg, #6610f2, #007bff);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .register-card {
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            width: 420px;
            padding: 30px;
        }
        .register-card h3 {
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
    </style>
</head>
<body>
<div class="register-card">
    <h3><i class="fa fa-user-plus text-primary me-2"></i>Create Account</h3>
    <form action="register" method="post">
        <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" name="fullname" class="form-control" placeholder="Enter your fullname" required
                   value="<%= request.getParameter("fullname") != null ? request.getParameter("fullname") : "" %>">
        </div>

        <% if (request.getAttribute("fullnameError") != null) { %>
        <div class="text-danger mb-3"><%= request.getAttribute("fullnameError") %></div>
        <% } %>

        <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" name="username" class="form-control" placeholder="Enter your username" required
                   value="<%= request.getParameter("username") != null ? request.getParameter("username") : "" %>">
        </div>

        <% if (request.getAttribute("usernameError") != null) { %>
        <div class="text-danger mb-3"><%= request.getAttribute("usernameError") %></div>
        <% } %>

        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" placeholder="Enter your email" required
                   value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>">
        </div>

        <% if (request.getAttribute("emailError") != null) { %>
        <div class="text-danger mb-3"><%= request.getAttribute("emailError") %></div>
        <% } %>

        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" placeholder="Enter your password">
        </div>

        <% if (request.getAttribute("passError") != null) { %>
        <div class="text-danger mb-3"><%= request.getAttribute("passError") %></div>
        <% } %>

        <div class="mb-3">
            <label class="form-label">Confirm Password</label>
            <input type="password" name="confirmPassword" class="form-control" placeholder="Re-enter your password">
        </div>

        <% if (request.getAttribute("confirmPassError") != null) { %>
        <div class="text-danger mb-3"><%= request.getAttribute("confirmPassError") %></div>
        <% } %>

        <% if (request.getAttribute("error") != null) { %>
        <div class="text-danger mb-3"><%= request.getAttribute("error") %></div>
        <% } %>

        <button type="submit" class="btn btn-success w-100">Register</button>
    </form>
    <p class="text-center mt-3">Already have an account?
        <a href="login" class="text-primary text-decoration-none">Login</a>
    </p>
</div>
</body>
</html>
