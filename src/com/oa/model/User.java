package com.oa.model;

/**
 * @author 郭宏禧
 * @createTime 2017/8/15
 * @context **
 */
public class User {
    private String user_id;
    private String account;
    private String user_name;
    private String password;
    private String dep;
    private String role;

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDep() {
        return dep;
    }

    public void setDep(String dep) {
        this.dep = dep;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_id='" + user_id + '\'' +
                ", account='" + account + '\'' +
                ", user_name='" + user_name + '\'' +
                ", password='" + password + '\'' +
                ", dep='" + dep + '\'' +
                ", role='" + role + '\'' +
                '}';
    }
}
