/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DbAccessObj;

import DbTemplateObj.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import mylib.DBUtils;

/**
 *
 * @author ADMIN
 */
public class UserDAO {

    //Hàm này để lấy 1 dòng trong bảng tblUser
    //vào userid(username) và password
    public static User getUser(String userid, String password) throws Exception {
        User result = null;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String s = "select [userID],[fullName],[roleID],password from tblUsers where userID=? and password = ? COLLATE Latin1_General_CS_AI";
            // bật tính năng phân biệt hoa thường (COLLATE Latin1_General_CS_AI)
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, userid);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    String id = rs.getString("userID");
                    String name = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    String pwd = rs.getString("password");
                    result = new User(id, name, roleID, password);
                }
            }
            cn.close();
        }
        return result;
    }
    
        public static boolean getUser(String userid) throws Exception {
        boolean result = false;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String s = "select [userID],[fullName],[roleID],password from tblUsers where userID=? COLLATE Latin1_General_CS_AI";
            // bật tính năng phân biệt hoa thường (COLLATE Latin1_General_CS_AI)
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, userid);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                result =  true;
            }
            cn.close();
        }
        return result;
    }

    public static int insertUser(String username, String fullname, String roleID, String password) throws Exception {
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String s = "INSERT tblUsers(userID, fullname, roleID, password) VALUES (?,?,?,?)";
            PreparedStatement ps = cn.prepareStatement(s);
            ps.setString(1, username);
            ps.setString(2, fullname);
            ps.setString(3, roleID);
            ps.setString(4, password);
            result = ps.executeUpdate();
            cn.close();
        }
        return result;
    }
}
