package servlet;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.EmailUtil;

import java.io.IOException;

@WebServlet("/verify")
public class VerificationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Gửi mã xác thực
        String email = request.getParameter("email");

        if (email == null || email.isEmpty()) {
            response.sendRedirect("register");
            return;
        }

        // Sinh mã ngẫu nhiên 6 chữ số
        String code = String.valueOf((int) (Math.random() * 900000) + 100000);

        // Lưu vào session
        HttpSession session = request.getSession();
        session.setAttribute("verifyEmail", email);
        session.setAttribute("verifyCode", code);

        try {
            EmailUtil.sendEmail(email, "Verification code: " + code);
            request.getRequestDispatcher("/WEB-INF/views/verifyEmail.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "The verification email could not be sent. Please try again.");
            request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Xác thực mã
        String inputCode = request.getParameter("code");
        HttpSession session = request.getSession();

        String sessionCode = (String) session.getAttribute("verifyCode");
        String email = (String) session.getAttribute("verifyEmail");

        if (inputCode != null && inputCode.equals(sessionCode)) {
            UserDAO dao = new UserDAO();
            dao.updateStatusByEmail(email);

            session.removeAttribute("verifyCode");
            session.removeAttribute("verifyEmail");

            request.getRequestDispatcher("/WEB-INF/views/verifySuccess.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Incorrect verification code, please try again!");
            request.getRequestDispatcher("/WEB-INF/views/verifyEmail.jsp").forward(request, response);
        }
    }
}

