<%-- 
    Document   : CartDetail
    Created on : Feb 10, 2023, 11:40:05 AM
    Author     : jerry
--%>

<%@page import="dao.CarDAO"%>
<%@page import="dto.Car"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HashMap<String, Integer> cart = (HashMap) session.getAttribute("cart");
            if (cart != null && cart.size() > 0) {
                float total = 0;
        %>
        <h1>Thong in giao hang cua ban</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>QUANTITY</th>
                <th>CHOOSE</th>
            </tr>
            <%
                for (String id : cart.keySet()) {
                    Car c = CarDAO.getCar(id);
            %>
            <tr>
            <form action="MainController" method="post">
                <td><%= c.getId()%></td>                
                <td><%= c.getName()%></td>
                <td><input type="number" name="quantity" value='<%= cart.get(id)%>'></td>
                <td>
                    <input type="submit" value="update" name="action">
                    <input type="submit" value="remove" name="action">
                </td>
                <input type="hidden" name="cartid" value="<%= c.getId()%>" >
            </form>
        </tr>
        <%
                total += c.getPrice() * cart.get(id);
            }
        %>
    </table>
    <h2>Tong tien can thanh toan <%= total%> vnnd</h2>
    <form action="MainController" action="post">
        <input name="action" value="checkout" type="submit">
    </form>
    <%
        } else {
            out.print("<h1>Gio hang trong</h1>");
        }
    %>
</body>
</html>
