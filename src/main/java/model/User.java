package model;

import java.sql.Date;
import java.sql.Timestamp;

public class User {
    private String fullname;
    private String username;
    private String password;
    private String mobile;
    private String email;
    private Role role;
    private Timestamp created_at;
    private String create_by;
    private Timestamp updated_at;
    private String update_by;

    public User(){
    }

    public User(String fullname, String username, String password, String mobile, String email, Role role, Timestamp created_at, String create_by, Timestamp updated_at, String update_by) {
        this.fullname = fullname;
        this.username = username;
        this.password = password;
        this.mobile = mobile;
        this.email = email;
        this.role = role;
        this.created_at = created_at;
        this.create_by = create_by;
        this.updated_at = updated_at;
        this.update_by = update_by;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public String getCreate_by() {
        return create_by;
    }

    public void setCreate_by(String create_by) {
        this.create_by = create_by;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }

    public String getUpdate_by() {
        return update_by;
    }

    public void setUpdate_by(String update_by) {
        this.update_by = update_by;
    }
}

