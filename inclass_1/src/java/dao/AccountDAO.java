/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import utils.DBUtils;

/**
 *
 * @author jerry
 */
public class AccountDAO {

    public static Account getAccount(String userID, String password) {
        Connection cn = null;
        Account acc = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn == null) {
                return null;
            }
            String sql = "select userID, fullName, roleID,password from tblUsers\n"
                    + "where userID = ? and password = ? COLLATE Latin1_General_CS_AS";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, userID);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs != null && rs.next()) {
                String UserID = rs.getString("userID");
                String fullName = rs.getString("fullName");
                String pwd = rs.getString("password");
                String role = rs.getString("roleID");
                acc = new Account(UserID, password, fullName,role);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return acc;
    }

//    public static ArrayList<Account> getAccounts() {
//        Connection cn = null;
//        ArrayList<Account> accList = new ArrayList<>();
//        try {
//            cn = DBUtils.makeConnection();
//            if (cn == null) {
//                return null;
//            }
//            String sql = "select * from dbo.Accounts";
//            PreparedStatement ps = cn.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//            while (rs != null && rs.next()) {
//                int accID = rs.getInt("accID");
//                String Email = rs.getString("email");
//                String Password = rs.getString("password");
//                String fullname = rs.getString("fullname");
//                String phone = rs.getString("phone");
//                int status = rs.getInt("status");
//                int role = rs.getInt("role");
////                Account acc = new Account(accID, Email, Password, fullname, status, phone, role);
//                accList.add(acc);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (cn != null) {
//                try {
//                    cn.close();
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//        return accList;
//    }
//
//    public static boolean updateAccountStatus(String email, int status) {
//        Connection cn = null;
//        int result = 0;
//        try {
//            cn = DBUtils.makeConnection();
//            if (cn == null) {
//                return false;
//            }
//            String sql = "update accounts set status = ? where email = ?";
//            PreparedStatement ps = cn.prepareStatement(sql);
//            ps.setInt(1, status);
//            ps.setString(2, email);
//            result = ps.executeUpdate();
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (cn != null) {
//                try {
//                    cn.close();
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//        return result == 1;
//    }
//
//    public static boolean updateAccount(String email, String newPassword, String newFullname, String newPhone) {
//        Connection cn = null;
//        int result = 0;
//        try {
//            cn = DBUtils.makeConnection();
//            if (cn == null) {
//                return false;
//            }
//            String sql = "update accounts set password = ?, fullname = ?,phone = ? where email = ?";
//            PreparedStatement ps = cn.prepareStatement(sql);
//            ps.setString(1, newPassword);
//            ps.setString(2, newFullname);
//            ps.setString(3, newPhone);
//            ps.setString(4, email);
//            result = ps.executeUpdate();
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (cn != null) {
//                try {
//                    cn.close();
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//        return result == 1;
//    }
//
//    public static boolean insertAccount(String newEmail, String newPassword, String newFullname, String newPhone, int newStatus, int newRole) {
//        Connection cn = null;
//        int result = 0;
//        try {
//            cn = DBUtils.makeConnection();
//            if (cn == null) {
//                return false;
//            }
//            String sql = "insert accounts values (?,?,?,?,?,?)";
//            PreparedStatement ps = cn.prepareStatement(sql);
//            ps.setString(1, newEmail);
//            ps.setString(2, newPassword);
//            ps.setString(3, newFullname);
//            ps.setString(4, newPhone);
//            ps.setInt(5,newStatus);
//            ps.setInt(6,newRole);
//            result = ps.executeUpdate();
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (cn != null) {
//                try {
//                    cn.close();
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//        return result == 1;
//    }
//
//    public static void main(String[] args) {
//    }
}
