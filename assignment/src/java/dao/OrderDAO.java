/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Account;
import dto.Order;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;
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

    public static boolean insertOrder(String email, HashMap<String, Integer> cart) {
        Connection cn = null;
        boolean result = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                int accid = 0, orderid = 0;
                cn.setAutoCommit(false);
                // get account id by email
                String sql = "select accID from Accounts where email = ?";
                PreparedStatement ps = cn.prepareStatement(sql);
                ps.setString(1, email);
                ResultSet rs = ps.executeQuery();
                if (rs != null && rs.next()) {
                    accid = rs.getInt("accID");
                }

                // insert a new order
                System.out.println("accountid: " + accid);
                Date d = new Date(System.currentTimeMillis());
                System.out.println("order date: " + d);
                sql = "insert Orders(OrdDate, status, AccID) values (?,?,?)";
                ps = cn.prepareStatement(sql);
                ps.setDate(1, d);
                ps.setInt(2, 1);
                ps.setInt(3, accid);
                ps.executeUpdate();
                // get order id that is the largest number
                sql = "select top 1 orderID from Orders order by orderId desc";
                ps = cn.prepareStatement(sql);
                rs = ps.executeQuery();
                if (rs != null && rs.next()) {
                    orderid = rs.getInt("orderID");
                }
                System.out.println("orderid: " + orderid);
                Set<String> pids = cart.keySet();
                for (String pid : pids) {
                    sql = "insert OrderDetails values(?,?,?)";
                    ps = cn.prepareStatement(sql);
                    ps.setInt(1, orderid);
                    ps.setInt(2, Integer.parseInt(pid.trim()));
                    ps.setInt(3, cart.get(pid));
                    ps.executeUpdate();
                    cn.commit();
                    cn.setAutoCommit(true);
                }
                return true;
            } else {
                System.out.println("Failed to insert order");
            }
        } catch (Exception e) {
            try {
                if (cn != null) {
                    cn.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            result = false;
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return true;
    }

    public static boolean updateOrderStatus(int orderId, int status) {
        boolean result = false;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn == null) {
                return false;
            }
            String sql = "update Orders\n"
                    + "set status = ?\n"
                    + "where OrderID = ?";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, orderId);
            int res = ps.executeUpdate();
            result = res != 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }
}
