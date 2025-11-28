<%@ page import="java.util.*, model.Course" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Courses</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f5f7fb;
        }
        .course-card {
            border-radius: 12px;
            padding: 20px;
            background: white;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
            transition: 0.2s;
        }
        .course-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 14px rgba(0,0,0,0.12);
        }
        .course-header {
            font-size: 26px;
            font-weight: 700;
            margin-bottom: 15px;
            text-align: center;
        }
        .progress {
            height: 8px;
            border-radius: 10px;
            background-color: #e8edf3;
        }
        .progress-bar {
            background-color: #1e90ff;
        }
        .search-bar {
            width: 350px;
        }
    </style>
</head>

<body>

<div class="container mt-5 mb-5">

    <h1 class="fw-bold mb-4">My Courses</h1>

    <!-- Search + Filters -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <input type="text" class="form-control search-bar" placeholder="Search for a course...">

        <div class="d-flex gap-3">
            <select class="form-select">
                <option>All Status</option>
                <option>Completed</option>
                <option>In Progress</option>
                <option>Not Started</option>
            </select>

            <select class="form-select">
                <option>All Categories</option>
                <option>IT</option>
                <option>Marketing</option>
                <option>Design</option>
            </select>
        </div>
    </div>

    <div class="row g-4">

        <%
            List<Course> courses = (List<Course>) request.getAttribute("courses");

            if (courses != null && !courses.isEmpty()) {

                for (Course c : courses) {
        %>

        <!-- Course Card -->
        <div class="col-md-4">
            <div class="course-card">

                <div class="course-header">
                    <%= c.getCourseName() %>
                </div>

                <p class="fw-semibold"><%= c.getDescription() %></p>
                <p class="text-muted">Author: Instructor #<%= c.getInstructorId() %></p>

                <!-- Progress bar giả lập -->
                <div class="progress mb-2">
                    <%
                        int progress = 0; // Bạn có thể lấy từ DB nếu có
                    %>
                    <div class="progress-bar" style="width: <%= progress %>%"></div>
                </div>
                <p class="text-muted small"><%= progress %> % Completed</p>

                <a href="#" class="btn btn-primary">View details</a>
            </div>
        </div>

        <%
            } // end for
        } else {
        %>

        <p class="text-center text-muted">You have not enrolled in any courses yet.</p>

        <% } %>

    </div>

    <!-- Pagination -->
    <div class="d-flex justify-content-center mt-4">
        <nav>
            <ul class="pagination">
                <li class="page-item disabled"><a class="page-link">Previous</a></li>
                <li class="page-item active"><a class="page-link">1</a></li>
                <li class="page-item"><a class="page-link">2</a></li>
                <li class="page-item"><a class="page-link">3</a></li>
                <li class="page-item"><a class="page-link">Next</a></li>
            </ul>
        </nav>
    </div>

</div>

</body>
</html>
