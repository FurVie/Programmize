<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Email Verification | Codify</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

    <style>
        body {
            background: linear-gradient(135deg, #007bff, #6610f2);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .verify-card {
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            width: 380px;
            padding: 30px;
        }
        .verify-card h3 {
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        .verify-card p {
            text-align: center;
            color: #666;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="verify-card">
    <h3><i class="fa fa-envelope text-primary me-2"></i>Email Verification</h3>
    <p>We’ve sent a verification code to your email.</p>

    <form action="verify" method="post">
        <div class="mb-3">
            <label class="form-label">Verification Code</label>
            <input type="text" name="code" class="form-control text-center" maxlength="6"
                   placeholder="Enter your 6-digit code" required>
        </div>

        <% if (request.getAttribute("error") != null) { %>
        <div class="text-danger mb-3 text-center"><%= request.getAttribute("error") %></div>
        <% } %>

        <button type="submit" class="btn btn-primary w-100">Verify</button>
    </form>

    <p class="text-center mt-3">
        Didn’t receive the code?
        <a href="resendCode" class="text-primary text-decoration-none">Resend</a>
    </p>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
