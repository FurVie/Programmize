package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.Course;

public class MyCoursesDAO {

    private Connection conn;

    public MyCoursesDAO(Connection conn) {
        this.conn = conn;
    }

    /**
     * Returns all courses a user has enrolled/bought.
     */
    public List<Course> getEnrolledCoursesByUser(int userId) throws SQLException {
        List<Course> list = new ArrayList<>();

        String sql =
            "SELECT c.course_id, c.course_name, c.listed_price, c.sale_price, c.thumbnail_url, c.instructor_id, c.duration, c.description, c.status FROM enrollment e INNER JOIN course c ON e.course_id = c.course_id WHERE e.user_id = ?"
        ;

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, userId);

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Course c = new Course();
            c.setCourseId(rs.getInt("course_id"));
            c.setCourseName(rs.getString("course_name"));
            c.setListedPrice(rs.getBigDecimal("listed_price"));
            c.setSalePrice(rs.getBigDecimal("sale_price"));
            c.setThumbnailUrl(rs.getString("thumbnail_url"));
            c.setInstructorId(rs.getInt("instructor_id"));
            c.setDuration(rs.getInt("duration"));
            c.setDescription(rs.getString("description"));
            c.setStatus(rs.getString("status"));

            list.add(c);
        }

        rs.close();
        ps.close();

        return list;
    }
}
