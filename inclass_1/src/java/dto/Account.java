/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

/**
 *
 * @author jerry
 */
public class Account {

    private String userID;
    private String password;
    private String fullName;
    private String role;

    public Account(String accID, String password, String fullname, String role) {
        this.userID = accID;
        this.password = password;
        this.fullName = fullname;
        this.role = role;
    }

    public Account() {
        this.userID = "";
        this.password = "";
        this.fullName = "";
        this.role = "";
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
