/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Plant;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import utils.DBUtils;

/**
 *
 * @author jerry
 */
public class PlantDAO {

    public static ArrayList<Plant> getPlants(String keyword, String searchby) {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn == null || searchby == null) {
                return null;
            }
            String sql = "select PID, PName, price, imgPath, description, status, Plants.CateID as CateID, CateName from Plants join Categories on Plants.CateID = Categories.CateID\n";
            if (searchby.equals("byname")) {
                sql += "where Plants.PName like ?";
            } else {
                sql += "where CateName like ?";
            }
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("PID");
                    String name = rs.getString("PName");
                    int price = rs.getInt("price");
                    String imgpath = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    int cateid = rs.getInt("CateID");
                    String catename = rs.getString("CateName");
                    Plant plant = new Plant(id, name, price, imgpath, description, status, cateid, catename);
                    list.add(plant);
                }
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
        return list;
    }

    public static Plant getPlant(int pid) {
        Plant p = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select PID, PName, price, imgPath, description, status, Plants.CateID as CateID, CateName\n"
                        + "from Plants, Categories\n"
                        + "where Plants.CateID = Categories.CateID and PID = ?";
                PreparedStatement ps = cn.prepareStatement(sql);
                ps.setInt(1, pid);
                ResultSet rs = ps.executeQuery();
                if (rs != null && rs.next()) {
                    pid = rs.getInt("PID");
                    String pname = rs.getString("PName");
                    int price = rs.getInt("price");
                    String imgPath = rs.getString("imgPath");
                    String des = rs.getString("description");
                    int status = rs.getInt("status");
                    int cateid = rs.getInt("cateID");
                    String cateName = rs.getString("CateName");
                    p = new Plant(pid, pname, price, imgPath, des, status, cateid, cateName);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn!=null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return p;
    }
}
