<%-- 
    Document   : CarDetail
    Created on : Feb 10, 2023, 11:04:00 AM
    Author     : jerry
--%>

<%@page import="dto.Car"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Car c = (Car) request.getAttribute("carDetail");
            if (c != null) {
        %>
        <div>
            <p>Id: <%= c.getId()%></p>       
            <p>Name: <%= c.getName()%></p>
            <p>Price: <%= c.getPrice()%></p>            
            <p>Speed <%= c.getSpeed()%></p>
            <p>Description: <%= c.getDescription()%></p>
            <p><a href="MainController?action=addtocart&id=<%= c.getId() %>">Add to carts</a></p>
        </div>
        <%
            }
        %>
    </body>
</html>
