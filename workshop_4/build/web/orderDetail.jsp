<%-- 
    Document   : OrderDetail
    Created on : Mar 3, 2023, 9:56:08 AM
    Author     : jerry
--%>

<%@page import="dao.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.OrderDetail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            if (name == null) {
        %>
        <p>You must login to view personal page</p>
        <%
        } else {
        %>
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <section>
            <h3>Welcome <%= name%> back</h3>
            <h3><a href="mainController?action=logout">Log out</a></h3>
            <%
                String orderid = request.getParameter("orderid");
                if (orderid != null) {
                    int orderId = Integer.parseInt(orderid);
                    ArrayList<OrderDetail> list = OrderDAO.getOrderDetail(orderId);
                    if (list != null && !list.isEmpty()) {
                        int money = 0;
                        for (OrderDetail detail : list) {
            %>
            <table class="order">
                <tr>
                    <td>Order ID</td>
                    <td>Plant ID</td>
                    <td>Plant Name</td>
                    <td>Image</td>                    
                    <td>Price</td>
                    <td>Quantity</td>
                </tr>
                <tr>
                    <td><%= detail.getOrderID()%></td>
                    <td><%= detail.getPlantID()%></td>
                    <td><%= detail.getPlantName()%></td>
                    <td><img src="<%= detail.getImgPath()%>" alt="<%= detail.getPlantName()%>"/></td>
                    <td><%= detail.getPrice()%></td>
                    <td><%= detail.getQuantity()%></td>
                    <% money += detail.getPrice() * detail.getQuantity();%>
                </tr>
            </table>
            <%
                }
            %>
            <h3>Total money: <%= money%></h3>
            <%
            } else {
            %>
            <p>You don't have any order</p>
            <%
                    }
                }
            %>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        <%
            }
        %>
    </body>
</html>
