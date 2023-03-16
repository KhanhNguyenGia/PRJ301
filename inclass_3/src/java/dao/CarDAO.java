/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Car;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author jerry
 */
public class CarDAO {
    public static ArrayList<Car> getCars(String name) throws Exception {
        ArrayList<Car> result = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn == null) {
            return null;
        }
        String sql = "select id, name, description, price,speed,status from dbo.tblCars where status = 1 and name like ?";
        PreparedStatement ps = cn.prepareStatement(sql);
        ps.setString(1, "%" + name + "%");
        ResultSet rs = ps.executeQuery();
        if (rs == null) {
            return null;
        }
        while (rs.next()) {
            String id = rs.getString("id");
            String nameCar = rs.getString("name");
            String des = rs.getString("description");
            float price = rs.getFloat("price");
            int speed = rs.getInt("speed");
            boolean status = rs.getBoolean("status");
            Car c = new Car(id,nameCar,des,price,speed,status);
            result.add(c);
        }
        return result;
    }
    
    public static Car getCar(String id) throws Exception {
        Car result = null;
        Connection cn = DBUtils.makeConnection();
        if (cn == null) {
            return null;
        }
        String sql = "select id, name, description, price,speed,status from dbo.tblCars where status = 1 and id = ?";
        PreparedStatement ps = cn.prepareStatement(sql);
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs == null) {
            return null;
        }
        while (rs.next()) {
            String nameCar = rs.getString("name");
            String des = rs.getString("description");
            float price = rs.getFloat("price");
            int speed = rs.getInt("speed");
            boolean status = rs.getBoolean("status");
            result = new Car(id,nameCar,des,price,speed,status);
        }
        return result;
    }
}
