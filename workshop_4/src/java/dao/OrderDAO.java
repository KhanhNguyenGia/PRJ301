/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Account;
import dto.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import utils.DBUtils;

/**
 *
 * @author jerry
 */
public class OrderDAO {

    public static ArrayList<Order> getOrders(String email) {
        ArrayList<Order> list = new ArrayList<>();
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn == null) {
                return null;
            }
            String sql = "select o.* from orders o join Accounts a on o.AccID = a.accID where a.email =  ?";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs == null) {
                return null;
            }
            while (rs.next()) {
                int orderID = rs.getInt("OrderID");
                String orderDate = rs.getString("OrdDate");
                String shipDate = rs.getString("shipdate");
                int status = rs.getInt("status");
                int accID = rs.getInt("AccID");
                Order order = new Order(orderID, orderDate, shipDate, status, accID);
                list.add(order);
            }
            cn.close();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static ArrayList<OrderDetail> getOrderDetail(int orderID) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn == null) {
                return null;
            }
            String sql = "select od.DetailID, od.OrderID, p.PID, p.PName,p.imgPath, p.price, od.quantity from OrderDetails od join Plants p on p.PID = od.FID where od.OrderID = ?";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, orderID);
            ResultSet rs = ps.executeQuery();
            if (rs == null) {
                return null;
            }
            while (rs.next()) {
                int orderDetailID = rs.getInt("DetailID");
                int productID = rs.getInt("PID");
                String plantName = rs.getString("PName");
                String imgPath = rs.getString("imgPath");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                OrderDetail od = new OrderDetail(orderDetailID, orderID, productID, plantName, price, imgPath, quantity);
                list.add(od);
            }
            cn.close();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
