/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import utils.DBUtils;

/**
 *
 * @author jerry
 */
public class CategoryDAO {

    public static ArrayList<Category> getCategories() {
        Connection cn = null;
        ArrayList<Category> result = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn == null) {
                return null;
            }
            String sql = "select CateID, CateName from Categories";
            PreparedStatement ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int cateid = rs.getInt("CateID");
                    String catename = rs.getString("CateName");
                    Category temp = new Category(cateid, catename);
                    result.add(temp);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
        return result;
    }
}
