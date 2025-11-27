package servlet;

import dao.PublicClassDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.PublicClass;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet(name = "PublicClassesServlet", urlPatterns = {"/public-classes"})
public class PublicClassesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy connection từ ServletContext
        Connection conn = (Connection) getServletContext().getAttribute("DBConnection");

        // Gọi DAO
        PublicClassDao dao = new PublicClassDao(conn);
        List<PublicClass> classes = dao.getAllPublicClasses();

        // Gửi sang JSP
        request.setAttribute("classes", classes);
        request.getRequestDispatcher("/WEB-INF/views/public-classes.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Public ⇒ không có POST, forward như GET
        doGet(request, response);
    }
}
