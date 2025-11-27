package dao;

import model.PublicClass;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PublicClassDao {

    private Connection conn;

    public PublicClassDao(Connection conn) {
        this.conn = conn;
    }

    // Lấy danh sách lớp public (ai cũng xem được)
    public List<PublicClass> getAllPublicClasses() {

        List<PublicClass> list = new ArrayList<>();

        String sql =
                "SELECT c.course_id, c.course_name, c.thumbnail_url, " +
                        "       s.name AS instructor_name, c.start_date, c.end_date " +
                        "FROM course c " +
                        "JOIN setting s ON s.setting_id = c.instructor_id " +
                        "WHERE c.status = 1";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                PublicClass m = new PublicClass();

                m.setId(rs.getLong("course_id"));
                m.setTitle(rs.getString("course_name"));
                m.setThumbnailUrl(rs.getString("thumbnail_url"));
                m.setInstructor(rs.getString("instructor_name"));
                m.setStartDate(rs.getDate("start_date"));
                m.setEndDate(rs.getDate("end_date"));

                // Public classes không cần progress
                m.setProgress(0);

                list.add(m);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
