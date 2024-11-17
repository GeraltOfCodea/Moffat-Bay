<%@ page import="com.MoffatBayLodge.beans.Authentication" %>
<%
    // Retrieve form data
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    String phoneNumber = request.getParameter("phoneNumber");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirmPassword");
    String agreeTerms = request.getParameter("agreeTerms");

    Authentication auth = new Authentication();

    // Validate inputs
    boolean isEmailValid = Authentication.stringFormatCheck(email);
    boolean isPasswordValid = Authentication.stringPasswordCheck(password);
    boolean isPhoneNumberValid = Authentication.phoneNumberFormatCheck(phoneNumber);
    boolean isEmailAvailable = auth.isEmailAvailable(email);

    if (agreeTerms == null) {
        // User did not agree to terms
        request.setAttribute("errorMessage", "You must agree to the terms and conditions.");
        request.getRequestDispatcher("/view/registrationpg.jsp").forward(request, response);
    } else if (!isEmailValid) {
        request.setAttribute("errorMessage", "Invalid email format.");
        request.getRequestDispatcher("/view/registrationpg.jsp").forward(request, response);
    } else if (!isPhoneNumberValid) {
        request.setAttribute("errorMessage", "Invalid phone number format.");
        request.getRequestDispatcher("/view/registrationpg.jsp").forward(request, response);
    } else if (!isPasswordValid) {
        request.setAttribute("errorMessage", "Password must be at least 8 characters, contain uppercase, lowercase letters, and numbers.");
        request.getRequestDispatcher("/view/registrationpg.jsp").forward(request, response);
    } else if (!password.equals(confirmPassword)) {
        request.setAttribute("errorMessage", "Passwords do not match.");
        request.getRequestDispatcher("/view/registrationpg.jsp").forward(request, response);
    } else if (!isEmailAvailable) {
        request.setAttribute("errorMessage", "An account with this email already exists.");
        request.getRequestDispatcher("/view/registrationpg.jsp").forward(request, response);
    } else {
        // Hash the password
        String hashedPassword = Authentication.hashPassword(password);

        // Register the user
        boolean isRegistered = auth.registerUser(firstName, lastName, email, phoneNumber, hashedPassword);

        if (isRegistered) {
            // Registration successful
            // Optionally, log the user in by setting session attributes
            session.setAttribute("userName", firstName);
            response.sendRedirect(request.getContextPath() + "/view/Index.jsp"); // Redirect to home page
        } else {
            // Registration failed due to server error
            request.setAttribute("errorMessage", "Registration failed. Please try again later.");
            request.getRequestDispatcher("/view/registrationpg.jsp").forward(request, response);
        }
    }
%>