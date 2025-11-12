package servlet;

import dao.UserDAO;
import jakarta.mail.MessagingException;
import jakarta.servlet.annotation.WebServlet;
import model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import utils.EmailUtil;

import java.io.IOException;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String email = request.getParameter("email").trim();
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        UserDAO dao = new UserDAO();

        boolean error = false;

        // 1. Check fullname
        if (fullname.length() > 50) {
            request.setAttribute("fullnameError", "Full name must be less than 50 characters!");
            error = true;
        } else if(fullname.trim().isEmpty()){
            request.setAttribute("fullnameError", "Full name cannot be empty!");
        }

        // 2. Check username
        if (username.length() > 20) {
            request.setAttribute("usernameError", "Username must be less than 20 characters!");
            error = true;
        } else if (dao.checkUserOrEmailExists(username)){
            request.setAttribute("usernameError", "Username already exists!");
            error = true;
        } else if (username.trim().isEmpty()){
            request.setAttribute("usernameError", "Username cannot be empty!");
        }

        // 3. Check email
        if (dao.checkUserOrEmailExists(email)) {
            request.setAttribute("emailError", "Email already exists!");
            error = true;
        }

        // 4. Check password
        if (password.length() < 8) {
            request.setAttribute("passError", "Password must be at least 8 characters!");
            error = true;
        }

        if (error) {
            request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
            return;
        }
        // 6. Check Confirm Password
        if (!password.equals(confirmPassword)) {
            request.setAttribute("confirmPassError", "Confirmation password does not match!");
            request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
            return;
        }

        // 5. Save user
        User user = new User();
        user.setFullname(fullname);
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(password);
        user.setStatus(false);

        if (dao.addUser(user)) {
            response.sendRedirect("verify?email=" + email);

        } else {
            request.setAttribute("error", "Register failed. Please try again.");
            request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
        }
    }
}
