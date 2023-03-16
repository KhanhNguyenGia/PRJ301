<%-- 
    Document   : personalPage
    Created on : Feb 6, 2023, 10:50:28 AM
    Author     : jerry
--%>

<%@page import="dto.Account"%>
<%@page import="dao.AccountDAO"%>
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
            Cookie[] c = request.getCookies();
            boolean login = false;
            if (name == null) {
                if (c != null) {
                    String token = "";
                    for (Cookie cookie : c) {
                        if (cookie.getName().equals("selector")) {
                            token = cookie.getValue();
                            Account acc = AccountDAO.getAccount(token);
                            if (acc != null) {
                                name = acc.getFullname();
                                email = acc.getEmail();
                                login = true;
                            }
                        }
                    }
                }
            } else {
                login = true;
            }
            if (!login) {
        %>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <h1>You must login to view personal page</h1>
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
                String error = (String) request.getAttribute("error");
                ArrayList<Order> list = OrderDAO.getOrders(email);
                String[] status = {"", "processing", "completed", "cancelled"};
                String filter = (String) request.getParameter("filter");
                if (error != null && !error.isEmpty()) {
            %>
            <h2>${error}</h2>
            <%
                }
                if (list != null && !list.isEmpty()) {
                    ArrayList<Order> filtered = new ArrayList<>();
                    for (Order o : list) {
                        if (filter == null || filter.isEmpty() || status[o.getStatus()].equals(filter)) {
                            filtered.add(o);
                        }
                    }
                    if (filtered.isEmpty()) {
            %>
            <h2>List is empty</h2>
            <%
            } else {
                for (Order o : filtered) {
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
                        <% if (o.getStatus() == 1) {%>
                        <a href="mainController?action=cancelorder&orderid=<%= o.getOrderID()%>&status=3">Cancel order</a>
                        <%}%>
                        <% if (o.getStatus() == 3) {%><a href="mainController?action=reorder&orderid=<%= o.getOrderID()%>&status=1">Re order</a>
                        <%}%>

                    </td>
                    <td>
                        <a href="orderDetail.jsp?orderid=<%= o.getOrderID()%>">detail</a>
                    </td>
                </tr>
            </table>
            <%
                    }
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
