/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mylib;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author jerry
 */
public class tester {

    public static void main(String[] args) {
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String q = "SELECT userID,fullName,roleID, password FROM tblUsers";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(q);
                if (rs != null) {
                    while (rs.next()) {
                        String id = rs.getString("userID");
                        String name = rs.getString("fullName");
                        String role = rs.getString("roleID");
                        String password = rs.getString("password");
                        System.out.println(id + "," + name + "," + role + "," + password);
                    }
                }
                cn.close();
            } else {
                System.out.println("Connection server");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
