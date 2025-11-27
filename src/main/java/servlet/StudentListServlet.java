package servlet;

import dao.StudentDAO;
import model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/student-list")
public class StudentListServlet extends HttpServlet {

    private StudentDAO studentDAO;

    @Override
    public void init() throws ServletException {
        studentDAO = new StudentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // --- Xử lý hành động Cập nhật Trạng thái (Toggle Status) ---
        String action = request.getParameter("action");
        String idParam = request.getParameter("id");
        String statusParam = request.getParameter("newStatus");

        String actionMessage = null;

        if ("toggleStatus".equals(action) && idParam != null && statusParam != null) {
            try {
                int studentId = Integer.parseInt(idParam);
                boolean newStatus = "1".equals(statusParam);

                // Giả định phương thức updateStudentStatus tồn tại trong StudentDAO
                boolean success = studentDAO.updateStudentStatus(studentId, newStatus);

                String statusText = newStatus ? "Activated" : "Deactivated";
                actionMessage = success
                        ? "Status update successful: Student " + studentId + " changed to " + statusText + "."
                        : "Error: Unable to update status for student " + studentId + ".";

            } catch (NumberFormatException e) {
                actionMessage = "Error: Invalid ID or state.";
            }
        }

        // --- Lấy filter + search ---
        String keyword = request.getParameter("search");
        String status = request.getParameter("status");
        String className = request.getParameter("class");

        if (keyword != null && keyword.trim().isEmpty()) keyword = null;
        if (status != null && status.trim().isEmpty()) status = null;
        if (className != null && className.trim().isEmpty()) className = null;


        List<String> classNamesList = studentDAO.getAllClassNames();
        request.setAttribute("classNamesList", classNamesList);

        // Lấy danh sách student
        List<Student> students = studentDAO.searchStudents(keyword, status, className);

        request.setAttribute("students", students);
        request.setAttribute("search", keyword);
        request.setAttribute("status", status);
        request.setAttribute("className", className);

        // --- Xử lý thông báo hành động ---
        if (actionMessage != null) {
            request.setAttribute("actionMessage", actionMessage);
        } else {
            // Kiểm tra xem có thông báo từ action add-student không
            String paramMsg = request.getParameter("message");
            if (paramMsg != null && !paramMsg.isEmpty()) {
                request.setAttribute("actionMessage", paramMsg);
            }
        }


        request.getRequestDispatcher("/WEB-INF/views/student-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}