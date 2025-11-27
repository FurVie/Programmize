package dao;

import model.Student;
import utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    public List<Student> searchStudents(String keyword, String status, String className) {
        List<Student> list = new ArrayList<>();

        StringBuilder sql = new StringBuilder(
                "SELECT u.user_id, u.fullname, u.email, u.status, c.class_name " +
                        "FROM user u " +
                        "JOIN user_role ur ON u.user_id = ur.user_id " +
                        "JOIN setting s ON ur.role_id = s.setting_id " +
                        "LEFT JOIN class_user cu ON u.user_id = cu.user_id " +
                        "LEFT JOIN `class` c ON cu.class_id = c.class_id " +
                        "WHERE s.setting_name = 'Student' "
        );

        if (status != null && !status.isEmpty()) {
            sql.append(" AND u.status = ?");
        }

        if (className != null && !className.isEmpty()) {
            sql.append(" AND c.class_name = ?");
        }

        if (keyword != null && !keyword.isEmpty()) {
            sql.append(" AND (u.fullname LIKE ? OR u.email LIKE ?)");
        }

        sql.append(" ORDER BY u.fullname ASC");

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {

            int index = 1;

            if (status != null && !status.isEmpty()) {
                ps.setInt(index++, Integer.parseInt(status));
            }
            if (className != null && !className.isEmpty()) {
                ps.setString(index++, className);
            }
            if (keyword != null && !keyword.isEmpty()) {
                ps.setString(index++, "%" + keyword + "%");
                ps.setString(index++, "%" + keyword + "%");
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Student st = new Student();
                st.setId(rs.getInt("user_id"));
                st.setFullname(rs.getString("fullname"));
                st.setEmail(rs.getString("email"));
                st.setStatus(rs.getBoolean("status"));
                st.setClassName(rs.getString("class_name"));
                list.add(st);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NumberFormatException e) {
            System.err.println("Invalid status value: " + status);
            e.printStackTrace();
        }

        return list;
    }

    public boolean addStudentToClass(String identifier, boolean isEmail, String className) throws SQLException {
        Connection conn = null;
        PreparedStatement psFindUser = null;
        PreparedStatement psFindClass = null;
        PreparedStatement psInsertClassUser = null;
        PreparedStatement psInsertUserRole = null;
        PreparedStatement psFindStudentRole = null;
        ResultSet rsUser = null;
        ResultSet rsClass = null;
        ResultSet rsRole = null;

        int userId = -1;
        int classId = -1;
        int studentRoleId = -1;

        try {
            conn = DBUtil.getConnection();
            conn.setAutoCommit(false); // Bắt đầu Transaction

            // 1. Tìm user_id
            String findUserSql = isEmail ? "SELECT user_id FROM user WHERE email = ?" : "SELECT user_id FROM user WHERE username = ?";
            psFindUser = conn.prepareStatement(findUserSql);
            psFindUser.setString(1, identifier);
            rsUser = psFindUser.executeQuery();
            if (rsUser.next()) {
                userId = rsUser.getInt("user_id");
            } else {
                return false; // Không tìm thấy người dùng
            }

            // 2. Tìm class_id
            String findClassSql = "SELECT class_id FROM class WHERE class_name = ?";
            psFindClass = conn.prepareStatement(findClassSql);
            psFindClass.setString(1, className);
            rsClass = psFindClass.executeQuery();
            if (rsClass.next()) {
                classId = rsClass.getInt("class_id");
            } else {
                return false; // Không tìm thấy lớp
            }

            // 3. Thêm vào class_user (Sử dụng INSERT IGNORE để bỏ qua nếu đã tồn tại)
            String insertClassUserSql = "INSERT IGNORE INTO class_user (user_id, class_id) VALUES (?, ?)";
            psInsertClassUser = conn.prepareStatement(insertClassUserSql);
            psInsertClassUser.setInt(1, userId);
            psInsertClassUser.setInt(2, classId);
            psInsertClassUser.executeUpdate();

            // 4. Đảm bảo người dùng có role là 'Student'
            // a. Tìm role_id của 'Student'
            String findRoleSql = "SELECT setting_id FROM setting WHERE setting_name = 'Student'";
            psFindStudentRole = conn.prepareStatement(findRoleSql);
            rsRole = psFindStudentRole.executeQuery();
            if (rsRole.next()) {
                studentRoleId = rsRole.getInt("setting_id");

                // b. Thêm role 'Student' vào user_role (Sử dụng INSERT IGNORE)
                String insertUserRoleSql = "INSERT IGNORE INTO user_role (user_id, role_id) VALUES (?, ?)";
                psInsertUserRole = conn.prepareStatement(insertUserRoleSql);
                psInsertUserRole.setInt(1, userId);
                psInsertUserRole.setInt(2, studentRoleId);
                psInsertUserRole.executeUpdate();
            }

            conn.commit(); // Hoàn tất Transaction
            return true;

        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback(); // Rollback nếu có lỗi
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            throw e; // Ném lỗi để servlet xử lý
        } finally {
            // Đóng tất cả tài nguyên (rs, ps, conn)
            if (rsUser != null) rsUser.close();
            if (rsClass != null) rsClass.close();
            if (rsRole != null) rsRole.close();
            if (psFindUser != null) psFindUser.close();
            if (psFindClass != null) psFindClass.close();
            if (psInsertClassUser != null) psInsertClassUser.close();
            if (psInsertUserRole != null) psInsertUserRole.close();
            if (psFindStudentRole != null) psFindStudentRole.close();
            if (conn != null) conn.close();
        }
    }

    public Student getStudentById(int id) {
        Student student = null;
        String sql = "SELECT u.user_id, u.fullname, u.username, u.email, u.status, u.avatar_url, " +
                "GROUP_CONCAT(c.class_name SEPARATOR ', ') AS class_names " +
                "FROM user u " +
                "JOIN user_role ur ON u.user_id = ur.user_id " +
                "JOIN setting s ON ur.role_id = s.setting_id " +
                "LEFT JOIN class_user cu ON u.user_id = cu.user_id " +
                "LEFT JOIN `class` c ON cu.class_id = c.class_id " +
                "WHERE u.user_id = ? AND s.setting_name = 'Student' " +
                "GROUP BY u.user_id";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                student = new Student();
                student.setId(rs.getInt("user_id"));
                student.setFullname(rs.getString("fullname"));
                student.setEmail(rs.getString("email"));
                student.setStatus(rs.getBoolean("status"));
                student.setClassName(rs.getString("class_names")); // Chứa danh sách lớp, hoặc NULL

                // Bổ sung các thông tin chi tiết khác từ bảng user
                student.setUsername(rs.getString("username"));
                student.setAvatarUrl(rs.getString("avatar_url"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return student;
    }

    public boolean updateStudentStatus(int userId, boolean newStatus) {
        String sql = "UPDATE user SET status = ? WHERE user_id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setBoolean(1, newStatus);
            ps.setInt(2, userId);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public String getFullnameById(int userId) {
        String fullname = null;
        String sql = "SELECT fullname FROM user WHERE user_id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                fullname = rs.getString("fullname");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return fullname;
    }

    public List<String> getAllClassNames() {
        List<String> classNames = new ArrayList<>();
        String sql = "SELECT class_name FROM class WHERE status = 1 ORDER BY class_name ASC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                classNames.add(rs.getString("class_name"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return classNames;
    }
}