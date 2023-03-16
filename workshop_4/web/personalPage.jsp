<%-- 
    Document   : personalPage
    Created on : Feb 6, 2023, 10:50:28 AM
    Author     : jerry
--%>

<%@page import="dao.OrderDAO"%>
<%@page import="dto.Order"%>
<%@page import="java.util.ArrayList"%>
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
                ArrayList<Order> list = OrderDAO.getOrders(email);
                String[] status = {"", "processing", "completed", "canceled"};
                if (list != null && !list.isEmpty()) {
                    for (Order o : list) {
            %>
            <table class="order">
                <tr>
                    <td>Order ID</td>
                    <td>Order Date</td>
                    <td>Ship Date</td>
                    <td>Order's status</td>
                    <td>Action</td>
                </tr>
                <tr>
                    <td><%= o.getOrderID()%></td>
                    <td><%= o.getOrderDate()%></td>
                    <td><%= o.getShipDate()%></td>
                    <td><%= status[o.getStatus()]%><br/>
                        <% if (o.getStatus() == 1)%><a href="#">Cancel order</a>
                    </td>
                    <td>
                        <a href="orderDetail.jsp?orderid=<%= o.getOrderID() %>">detail</a>
                    </td>
                </tr>
            </table>
            <%
                }
            } else {
            %>
            <p>You don't have any order</p>
            <%
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
