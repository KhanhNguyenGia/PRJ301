<%-- 
    Document   : ViewHistory
    Created on : Feb 14, 2023, 10:30:52 AM
    Author     : jerry
--%>

<%@page import="dto.User"%>
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
            User user = (User) session.getAttribute("loginUser");
            if (user == null) {
                response.sendRedirect("index.jsp");
            } else {
        %>
        <h1>Welcome: <%= user.getName()%></h1>
        <%
            ArrayList<Order> list = (ArrayList) request.getAttribute("listorders");
            if (list != null && list.size() > 0) {
        %>
        <table>
            <tr>
                <th>OrderId</th>
                <th>CreateDate</th>
                <th>UserID</th>                
                <th>Status</th>                
                <th>Action</th>
            </tr>
            <%
                for (Order o : list) {
                    if (o.getStatus() == 1) {
            %> 
            <tr>
                <td><%= o.getOrderid()%></td>
                <td><%= o.getCreateDate()%></td>
                <td><%= o.getUserid()%></td>
                <td>Pending</td>
                <td><a href="MainController?action=vieworderdetail">Detail</a></td>
            </tr>    
            <%
                    }
                }
            %>
        </table>
        <%
            }
            if (list != null && list.size() > 0) {
        %>
        <table>
            <tr>
                <th>OrderId</th>
                <th>CreateDate</th>
                <th>UserID</th>                
                <th>Status</th>
                <th>Action</th>
            </tr>
            <%
                for (Order o : list) {
                    if (o.getStatus() == 2) {
            %> 
            <tr>
                <td><%= o.getOrderid()%></td>
                <td><%= o.getCreateDate()%></td>
                <td><%= o.getUserid()%></td>
                <td>Pending</td>
                <td><a href="MainController?action=vieworderdetail">Detail</a></td>
            </tr>    
            <%
                    }
                }
            %>
        </table>
        <%
            }
            if (list != null && list.size() > 0) {
        %>
        <table>
            <tr>
                <th>OrderId</th>
                <th>CreateDate</th>
                <th>UserID</th>                
                <th>Status</th>
                <th>Action</th>
            </tr>
            <%
                for (Order o : list) {
                    if (o.getStatus() == 3) {
            %> 
            <tr>
                <td><%= o.getOrderid()%></td>
                <td><%= o.getCreateDate()%></td>
                <td><%= o.getUserid()%></td>
                <td>Pending</td>
                <td><a href="MainController?action=vieworderdetail">Detail</a></td>
            </tr>            
            <%
                    }
                }
            %>
        </table>
        <%
                }
            }
        %>
    </body>
</html>
