<%--
  Created by IntelliJ IDEA.
  User: Ryan, Eric, & Celine
  Team: Blue Team
  For: CSD460
  Date: 11/16/24
  Time: 3:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    String errorMessage = (String) request.getAttribute("errorMessage");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Moffat Bay Lodge - Registration</title>
    <link href="https://fonts.googleapis.com/css?family=Ubuntu&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cairo+Play&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/registrationpg.css">
    <!--<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">-->
</head>
<body>

<!-- Header -->
<%@ include file="/view/components/header.jsp" %>


<!-- REGISTRATION FORM CREATION -->
<div class="background"></div>
<div class="content">
    <div class="item">
        <h2 class="logo"><i class='bx bx-hotel'></i> Moffat Bay</h2>
        <div class="text-item">
            <h2>Welcome <br><span>
                    To Moffat Bay Lodge!
                </span></h2>
            <p>Tell Us About Yourself</p>
        </div>
    </div>
    <div class="login-section">
        <div class="form-box login">
            <!-- Update the form action to point to register.jsp -->
            <form action="${pageContext.request.contextPath}/view/components/register.jsp" method="post">
                <h2>Sign Up</h2>
                <!-- Display error message if any -->
                <% if (errorMessage != null) { %>
                <p class="error-message"><%= errorMessage %></p>
                <% } %>
                <div class="input-box">
                    <span class="icon"><i class='bx bxs-user'></i></span>
                    <input type="text" name="firstName" required>
                    <label>First Name</label>
                </div>
                <div class="input-box">
                    <span class="icon"><i class='bx bxs-user'></i></span>
                    <input type="text" name="lastName" required>
                    <label>Last Name</label>
                </div>
                <!-- Email field -->
                <div class="input-box">
                    <span class="icon"><i class='bx bxs-envelope'></i></span>
                    <input type="email" name="email" required>
                    <label>Email</label>
                </div>
                <!-- New Phone Number field -->
                <div class="input-box">
                    <span class="icon"><i class='bx bxs-phone'></i></span>
                    <input type="text" name="phoneNumber" required>
                    <label>Phone Number</label>
                </div>
                <!-- Password field -->
                <div class="input-box">
                    <span class="icon"><i class='bx bxs-lock-alt' ></i></span>
                    <input type="password" name="password" required>
                    <label>Password</label>
                </div>
                <!-- Confirm Password Field -->
                <div class="input-box">
                    <span class="icon"><i class='bx bxs-lock-alt' ></i></span>
                    <input type="password" name="confirmPassword" required>
                    <label>Confirm Password</label>
                </div>
                <!-- Display password requirements -->
                <div class="password-requirements">
                    <p>Password must be at least 8 characters long, contain uppercase and lowercase letters, and at least one number.</p>
                </div>
                <div class="remember-password">
                    <label><input type="checkbox" name="agreeTerms" required> I agree with the terms and conditions</label>
                </div>
                <button type="submit" class="btn">Create Account</button>
                <div class="create-account">
                    <p>Already Have An Account? <a href="${pageContext.request.contextPath}/view/login.jsp" class="login-link">Sign In</a></p>
                </div>
            </form>
        </div>
    </div>
</div>


<%@ include file="/view/components/footer.jsp" %>

</body>
</html>