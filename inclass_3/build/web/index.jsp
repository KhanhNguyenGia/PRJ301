<%-- 
    Document   : index
    Created on : Feb 10, 2023, 10:32:10 AM
    Author     : jerry
--%>

<%@page import="dto.Car"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p><a href="MainController?action=viewdetailcard">View cart</a></p>
        <form action="MainController" method="get">
            <input type="text" name="txtsearch" value='<%= request.getParameter("name") != null ? request.getParameter("name") : ""%>'>            
            <input type="submit" value="find" name="action">
        </form>
        <%
            ArrayList<Car> list = (ArrayList<Car>) request.getAttribute("listCar");
            if (list != null) {
                for (Car c : list) {
        %>
        <div>
            <p>Id: <%= c.getId()%></p>            
            <p>Name: <%= c.getName()%></p>
            <p>Price: <%= c.getPrice()%></p>
            <p><a href="MainController?action=viewcar&id=<%= c.getId()%>">Detail</a></p>
        </div>
        <%
                }
            }
        %>
        <%
            String msg = (String) request.getAttribute("MSG");
            if (msg != null) {
        %>
        <script>
            alert(msg);
        </script>
        <%
            }
        %>
    </body>
</html>
